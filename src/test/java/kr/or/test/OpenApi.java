package kr.or.test;

import java.io.BufferedReader;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;



/**
 * OpenAPI 클래스로 HRD-Net에서 제공하는 구직자훈련과정API 목록을 출력하는 자바앱
 * @author 이시은
 *
 */
public class OpenApi {

	//외부연계 역할  메소드
	public static void serviceApi() {
		BufferedReader bufferedReader = null; //HRD-Net에서 전송받은 데이터를 임시 저장하는 공간.
		String urlStr = "http://www.hrd.go.kr/jsp/HRDP/HRDPO00/HRDPOA60/HRDPOA60_1.jsp?returnType=XML&authKey=2k8XniQf8CYxls0AKifzX9d8ZN7BLb8D&pageNum=1&pageSize=10&srchTraOrganNm=%ED%9C%B4%EB%A8%BC&srchTraStDt=20201109&srchTraEndDt=20210317&outType=1&sort=ASC&sortCol=TR_STT_DT&srchTraArea1=44&srchTraArea2=44133";
		try {
			URL url = new URL(urlStr);
		 	try {
				HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
				urlConnection.setRequestMethod("GET"); //URL쿼리스트링으로 파라미터를 보낸다.
		 	} catch (IOException e) {
				// Http웹 접근 에러상황 발생
				System.out.println("Http접근 실패. 원인 : "+e.toString());
			}
		} catch (MalformedURLException e) {
			// 외부연계 URL에 접근하지 못했을 때 에러상황 발생
			System.out.println("URL접근 실패. 원인 : " + e.toString());
		}
		
	}
	// static메소드 : new키워드로 객체생성 없이 바로 접근 가능한 메소드
	public static void main(String[] args) {
		// 일반 메소드와 static 메소드의 호출차이
		// StaticTest staticTest = new StaticTest();
		// staticTest.noStatic(); //일반 메소드는 객체 생성 후 접근 가능
		// staticTest.test(); // static메소드는 객체 생성 없이 클래스로 바로 접근 가능. 변수도 가능.
	}

}

//-----------------------------------------------------------------------------
class StaticTest { //static은 메소드, 변수에도 해당되는 이론.
	public static void test() { 
		// static 메소드는 클래스를 읽어들이는 순간 고정메모리를 할당 받음 -> 클래스를 읽어들이는 순간 실행 가능
		System.out.println("static테스트");
	}
	public void noStatic() { 
		//일반 메소드는 new키워드로 오브젝트를 생성할 때 메모리할당 받음. -> 객체 생성하는 순간 실행 가능
		System.out.println("static이 아닌 메소드 호출할 때는 new키워드로 객체 생성 후 호출");
	}
}
