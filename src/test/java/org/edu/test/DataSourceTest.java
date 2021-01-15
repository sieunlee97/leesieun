package org.edu.test;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.edu.dao.IF_BoardDAO;
import org.edu.dao.IF_MemberDAO;
import org.edu.vo.BoardVO;
import org.edu.vo.MemberVO;
import org.edu.vo.PageVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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
	
	@Inject
	IF_BoardDAO boardDAO;
	
	@Inject // 사용하면 안되는 이유 : 클래스 상단에 @Controller, @Service, @Repository, @Component 이런 내용만 @inject로 주입
	MemberVO memberVO; // 기본 자바처럼 new MemberVO()로 오브젝트를 생성하지 않고, 주입해서 사용.
	
	public String memberPrimaryKey() throws Exception {
		// 사용자 프라이머리키 생성하는 메소드  년월시분초+밀리초 대량 더미데이터 입력시 uniq에러 발생 -> countMember사용
		/*
		Date primaryKey = new Date();
		SimpleDateFormat newFormat = new SimpleDateFormat("yyyyMMddhhmmssSSS");
		System.out.println("프라이머리키 : "+ newFormat.format(primaryKey));
		return "dummy_"+newFormat.format(primaryKey);
		 */
		PageVO pageVO = new PageVO();
		pageVO.setPage(1);
		pageVO.setPerPageNum(8); // 페이지 리스트 단위 5페이지씩 
		pageVO.setQueryPerPageNum(10); //한페이지당 보여줄 게시물 수 10개
		// 검색된 전체 화면 게시물 개수 구하기 서비스 호출
		int countMember = 0;
		countMember = memberDAO.countMember(pageVO); 
		return "dummy_"+(countMember+1);

	}
	// 생성 순서 : (쿼리->DAO->memberDAO주입받은 오브젝트사용)
	@Test
	public void update() throws Exception {
		//CRUD 중 Update 테스트 구현
		//특징 : user_id는 primary키이기 때문에 수정대상이 아니다.
		//MemberVO memberVO = new MemberVO();
		memberVO.setUser_id("dummy_1");
		memberVO.setUser_name("수정더미");
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
	public void insertBoard() throws Exception {
		BoardVO boardVO = new BoardVO();
		boardVO.setTitle("더미게시물");
		boardVO.setContent("더미 내용입니다.");
		boardVO.setWriter("사용자");
		//boardVO.setBno(프라이머리키);
		for(int cnt=0;cnt<100;cnt++) {
			boardDAO.insertBoard(boardVO);
		}
		
	}
	
	@Test
	public void insertMember() throws Exception {
		//CRUD 중 Create 테스트
		//MemberVO memberVO = new MemberVO();
		// 사용자 생성 규칙 : user-시작(prefix), suffix(접미사)는 년월일시분초
		// ex)사용자생성 결과 예:user_20201215142132
		
		memberVO.setUser_name("사용자");
		//패스워드 암호화 처리(필수이지만, 스프링 시큐리티 엔코더 처리 아래)
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		memberVO.setUser_pw(passwordEncoder.encode("1234"));
		// 패스워드 암호화 처리 (필수이지만 스프링 시큐리티 할 때 처리 예정)
		memberVO.setEmail("user@abc.com");
		memberVO.setPoint(100);
		memberVO.setEnabled(true);
		memberVO.setLevels("ROLE_USER");
		Date reg_date = new Date();
		memberVO.setReg_date(reg_date); //매퍼쿼리에서의 처리로 대체
		for(int cnt=0; cnt<100; cnt++) {
			//String memberIKey = memberPrimaryKey();
			memberVO.setUser_id(memberPrimaryKey());
			memberDAO.insertMember(memberVO);	
		}
	}
		
	
	@Test
	public void selectMember() throws Exception {
		PageVO pageVO = new PageVO();
		pageVO.setSearch_type("user_id");
		pageVO.setSearch_keyword("admin");
		// 아래 3가지는 초기 페이징 처리에 필요한 필수값 저장
		pageVO.setPage(1);
		pageVO.setPerPageNum(5); // 페이지 리스트 단위 5페이지씩 
		pageVO.setQueryPerPageNum(10); //한페이지당 보여줄 회원 수 10명
		List<MemberVO> memberList =	memberDAO.selectMember(pageVO);
		System.out.println("회원리스트 테스트 입니다.");
		System.out.println(memberList.toString());
	}
	@Test
	public void oldQueryTest() throws Exception {
		/* root-context.xml 사용 (아래) */
		//Connection connection = dataSource.getConnection();
		Connection connection = null;
		connection = DriverManager.getConnection("jdbc:hsqldb:file:c:/egov/workspace/embeded/hsql_file.db","sa","");
		//직접 쿼리를 날린다.(아래)
		Statement stmt = connection.createStatement();
		/* insert 쿼리 실행(아래) */ 
		/*
		 * stmt.executeQuery("INSERT INTO tbl_board VALUES("
		 * +"(SELECT COUNT(*) FROM tbl_board)+1"
		 * +",'강제 수정된 글입니다.', '수정 테스트', 'user00', now(), now(), 0, 0)" );
		 */
		
		/* select 쿼리 실행(아래) */
		ResultSet rs = stmt.executeQuery("select * from tbl_board");
		System.out.println("번호\t\t제목\t\t내용\t\t작성자");
		while(rs.next()) {
			System.out.print(rs.getString("bno"));
			System.out.print(rs.getString("title"));
			System.out.print(rs.getString("content"));
			System.out.print(rs.getString("writer"));
			System.out.println();
		}
			if(rs != null) {rs.close();}
			if(stmt != null) {stmt.close();}
			if(connection != null) {connection.close();}
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
