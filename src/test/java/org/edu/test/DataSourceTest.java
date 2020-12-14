package org.edu.test;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.sql.SQLException;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

/**
 * JUnit 자바단위테스트이고, DataSource 지정 후 DB(Hsql, Mysql, Oracle) 접속,
 * 데이터베이스 테이블에 Create, Read, Update, Delete 테스트용 클래스
 * @author sieunlee
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
@WebAppConfiguration
public class DataSourceTest {
	
	@Inject
	private DataSource dataSource; // 자바에서처럼 new 키워드로 객체 생성X, 스프링에서는 @Inject로 객체 생성	
	
	@Test
	public void dbConnectinoTest() throws SQLException {
		// 127.0.0.1의 3306포트에 있는 DB에 커넥션해서 사용가능한지 테스트
		Connection connection = dataSource.getConnection();
	}
	@Test
	public void test() {
		//fail("Not yet implemented");
		System.out.println("JUnit테스트시작");
	}

}
