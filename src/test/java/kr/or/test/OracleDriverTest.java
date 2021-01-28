package kr.or.test;

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
		// ojdbc6, mysql, hsql
	}

}
