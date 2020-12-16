package org.edu.test;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.edu.dao.IF_MemberDAO;
import org.edu.vo.MemberVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

/**
 * JUnit 자바단위테스트이고, DataSource 지정 후 DB(Hsql, Mysql, Oracle) 접속,
 * 데이터베이스 테이블에 Create, Read, Update, Delete 테스트용 클래스
 * @author 이시은
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
@WebAppConfiguration
public class DataSourceTest {
	
	@Inject
	private DataSource dataSource; // 자바에서처럼 new 키워드로 객체 생성X, 스프링에서는 @Inject로 객체 생성	
	
	@Inject 
	IF_MemberDAO memberDAO;
	
	@Inject // 사용하면 안되는 이유 : 클래스 상단에 @Controller, @Service, @Repository, @Component 이런 내용만 @inject로 주입
	MemberVO memberVO; // 기본 자바처럼 new MemberVO()로 오브젝트를 생성하지 않고, 주입해서 사용.
	
	public String memberPrimaryKey() {
		// 사용자 프라이머리키 생성하는 메소드  년월시분초+밀리초
		Date primaryKey = new Date();
		SimpleDateFormat newFormat = new SimpleDateFormat("yyyyMMddhhmmssSSS");
		System.out.println("프라이머리키 : "+ newFormat.format(primaryKey));
		return "user_"+newFormat.format(primaryKey);
	}
	// 생성 순서 : (쿼리->DAO->memberDAO주입받은 오브젝트사용)
	@Test
	public void update() throws Exception {
		//CRUD 중 Update 테스트 구현
		//특징 : user_id는 primary키이기 때문에 수정대상이 아니다.
		//MemberVO memberVO = new MemberVO();
		memberVO.setUser_id("admin");
		memberVO.setUser_name("홍길동");
		memberVO.setUser_pw(""); // 암호를 수정하지 않는 사람 가정. 수정할 때 암호는 새로 입력 안하겠다.
		memberVO.setEmail("test@test.com");
		memberVO.setPoint(100);
		memberVO.setEnabled(true);
		memberVO.setLevels("ROLD_ADMIN");
		String user_id = memberVO.getUser_id(); //memberVO의 오브젝트의 데이터는 1개의 레코드이기 때문에 반환값이 1개만 반환
		// 위 getUser-id는  get/set 사용을 보기 위함
		memberDAO.updateMember(memberVO);
	}
	
	@Test
	public void readMember() throws Exception {
		//CRUD 중 Read 테스트 구현
		//MemberVO memberVO = new MemberVO();
		memberVO = memberDAO.readMember("admin");
		System.out.println("user_id가 admin인 사람의 정보는 다음과 같다.");
		System.out.println(memberVO.toString());
	}
	@Test
	public void deleteMember() throws Exception {
		//CRUD 증 Delete 테스트 구현
		memberDAO.deleteMember("user_20201215025558093"); // 삭제메소드 -> 쿼리 호출
	}
	
	@Test
	public void insertMember() throws Exception {
		//CRUD 중 Create 테스트
		//MemberVO memberVO = new MemberVO();
		// 사용자 생성 규칙 : user-시작(prefix), suffix(접미사)는 년월일시분초
		// ex)사용자생성 결과 예:user_20201215142132
		String memberIKey = memberPrimaryKey();
		memberVO.setUser_id(memberIKey);
		memberVO.setUser_name("이시은");
		memberVO.setUser_pw("1234");
		// 패스워드 암호화 처리 (필수이지만 스프링 시큐리티 할 때 처리 예정)
		memberVO.setEmail("user03@abc.com");
		memberVO.setPoint(100);
		memberVO.setEnabled(true);
		memberVO.setLevels("ROLE_USER");
		Date reg_date = new Date();
		memberVO.setReg_date(reg_date); //매퍼쿼리에서의 처리로 대체
		
		memberDAO.insertMember(memberVO);
	}
		
	
	@Test
	public void selectMember() throws Exception {
	List<MemberVO> memberList =	memberDAO.selectMember("user_id", "길동");
		System.out.println("회원리스트 테스트 입니다.");
		System.out.println(memberList.toString());
	}
	
	@Test
	public void dbConnectinoTest() throws Exception{
		// 127.0.0.1의 3306포트에 있는 DB에 커넥션해서 사용가능한지 테스트
		
		// try-catch 구문은 테스트에서만 사용하고, 
		// 스프링에서는 throws Exception으로 예외를 스프링으로 보낸다.
		try {
			Connection connection = dataSource.getConnection();
			System.out.println("DB접속 성공");
		} catch (SQLException e) {
			System.out.println("DB접속 실패 원인 : "+ e);
			// e.printStackTrace();
		}
		
	}
	@Test
	public void test() {
		//fail("Not yet implemented");
		System.out.println("JUnit테스트시작");
	}

}
