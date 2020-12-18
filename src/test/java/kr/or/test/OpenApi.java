package kr.or.test;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Calendar;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.TimeUnit;



/**
 * OpenAPI 클래스로 HRD-Net에서 제공하는 구직자훈련과정API 목록을 출력하는 자바앱
 * @author 이시은
 *
 */
public class OpenApi {

	//외부연계 역할  메소드
	public static void serviceApi() {
		BufferedReader bufferedReader = null; //HRD-Net에서 전송받은 데이터를 임시 저장하는 공간.
		String urlStr = "http://www.hrd.go.kr/jsp/HRDP/HRDPO00/HRDPOA60/HRDPOA60_1.jsp?returnType=XML&authKey=2k8XniQf8CYxls0AKifzX9d8ZN7BLb8D&pageNum=1&pageSize=10&srchTraStDt=20201108&srchTraEndDt=20201231&outType=1&sort=DESC&sortCol=TR_STT_DT&srchTraArea1=44";
		try {
			URL url = new URL(urlStr);
		 	try {
				HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
				urlConnection.setRequestMethod("GET"); //URL쿼리스트링으로 파라미터를 보낸다.
				bufferedReader = new BufferedReader(new InputStreamReader(urlConnection.getInputStream(), "euc-kr"));
				String result="";
				String line;
				// int cnt=0;
				//while 반복문 시작
				while( (line=bufferedReader.readLine()) !=null ) {
					result = result + line + "\n"; // \n Newline 나타내는 기호 = enter
				}
				System.out.println("버퍼리더로 읽어들인 최종 결과값은 아래이다.");
				// System.out.println(result); // 2줄로 읽어들이고 끝.
				// XMLUtils.java 클래스를 이용해서 xml태그 내용을 예쁘게 출력(아래)
				String result_xmlUtils = XmlUtils.formatXml(result);
				System.out.println(result_xmlUtils);
		 	} catch (IOException e) {
				// Http웹 접근 에러상황 발생
				System.out.println("Http접근 실패. 원인 : "+e.toString());
			}
		} catch (MalformedURLException e) {
			// 외부연계 URL주소 형식이 잘못됐을 때 에러상황 발생
			System.out.println("URL 주소 형식 잘못됨. 원인 : " + e.toString());
		} finally {
			// 콘솔화면에 현재 PC시간을 표시해서 진짜 5초단위 스케줄대로 작동되는지 확인
			Calendar calendar = Calendar.getInstance();
			System.out.println(calendar.getTime());
		}
		
	}
	// static메소드 : new키워드로 객체생성 없이 바로 접근 가능한 메소드
	public static void main(String[] args) {
		// 메인스레드는 1개인데, 다른 스레드를 추가로 실행할 때 Runnable 메소드를 사용한다.(아래)
		// 추가스레드를 스케줄로(주기적으로) 실행할 때, 실행간격으로 사용할 변수(5초)
		int sleepSec = 10;
		// 주기적인 스레드 작업(Concurrent동시작업)을 위한 코딩 : new키워드로 실행가능한 오브젝트변수 exec 생성
		// final 현재 클래스에서만 사용하겠다는 명시.
		final ScheduledThreadPoolExecutor exec = new ScheduledThreadPoolExecutor(1);
		exec.scheduleAtFixedRate(new Runnable() { // 스레드를 이용해서 5초 단위로 메소드 반복 실행
			public void run() {
				serviceApi();
			}
		}, 0, sleepSec, TimeUnit.SECONDS);
		
		// 일반 메소드와 static 메소드의 호출차이
		// StaticTest staticTest = new StaticTest();
		// staticTest.noStatic(); //일반 메소드는 객체 생성 후 접근 가능
		// staticTest.test(); // static메소드는 객체 생성 없이 클래스로 바로 접근 가능. 변수도 가능.
		/*
		int sum = 0;
		while(sum<10) {
			sum = sum + 1;
			System.out.println(sum);
		}
		*/
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
