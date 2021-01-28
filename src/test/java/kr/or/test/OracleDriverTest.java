package kr.or.test;

import java.sql.Driver;
import java.sql.DriverManager;
import java.util.Enumeration;

public class OracleDriverTest {

	public static void main(String[] args) {
		// ojdbc6.jar 스프링에서 사용할 오라클 드라이버 클래스 테스트
		// 오라클 드라이버를 수동으로 로드(인스턴스만드는)하는 메소드 = Class.forName()
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("ojdbc6드라이버를 정상적으로 로드했습니다.");
		} catch (ClassNotFoundException e) {
			// ojdbc6.jar 클래스를 사용할 수 없을 때 
			e.printStackTrace();
		}
		
		// 현재 dependency로 등록된 jdbc 드라이버는 몇개가 있는지 확인.
		// 예를 들면, 개발자가 등록한 다음 3개 이상 확인. ojdbc6, mysql, hsql
		// DriverManager 클래스는 JDBC 드라이버 인스턴스(실행클래스)를 관리하는 클래스
		// .getDrivers()에소드를 이용해서 현재 등록된 드라이버를 뽑아올 수 있다.
		// 데이터타입 중에 이넘(반복되는 형태의 자료) Enumerate
		Enumeration<Driver> driverList = DriverManager.getDrivers();
		// 객체 = 오브젝트 = 인스턴스 = 실행클래스 driverList
		while(driverList.hasMoreElements()) {
			Driver driver = driverList.nextElement();
			System.out.println("dependency로 등록된 jdbc 드라이버: " + driver);
		}
	}

}
