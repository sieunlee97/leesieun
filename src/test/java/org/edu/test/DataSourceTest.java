package org.edu.test;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.sql.SQLException;
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
	
	@Test
	public void selectMember() throws Exception {
		List<MemberVO> memberList =	memberDAO.selectMember();
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
