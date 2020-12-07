package kr.or.test;

public class ThreadApp extends Thread {
	
	public void run() {
		System.out.println("스레드 시작 시 자동 실행입니다.");
	}
	public static void main(String[] args) {
		// 메인스레드 시작 진입점 main()
		(new ThreadApp()).start(); // 아래 두 줄과 이곳 한 줄은 같음
		
		/* 아래와 같이 해도 됨.
		 * ThreadApp threadApp = new ThreadApp();
		 * threadApp.start();
		*/
	}

}
