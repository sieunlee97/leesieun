package org.edu.test;

import static org.junit.Assert.*;

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

	@Test
	public void test() {
		//fail("Not yet implemented");
		System.out.println("JUnit테스트시작");
	}

}
