package kr.or.test;

public class ThreadApp {
	
	public static void main(String[] args) {
		// 메인스레드 시작 진입점 main()
		// (new ThreadApp()).start(); // 아래 두 줄과 이곳 한 줄은 같음
		
		/* 아래와 같이 해도 됨.
		 * ThreadApp threadApp = new ThreadApp();
		 * threadApp.start();
		*/
		MyThread myThread1 = new MyThread("myThread1");
		MyThread myThread2 = new MyThread("myThread2");
		MyThread myThread3 = new MyThread("myThread3");
		myThread1.start();
		myThread2.start();
		myThread3.start();
		System.out.println("언제 출력될까?");
	}
}

class MyThread extends Thread {
	public MyThread(String szName) {
		super(szName);		
	}
	@Override
	public void run() { //MyThread를 start() 호출해야지만 자동 실행되는 메소드
		for(int cnt=0;cnt<50;cnt++) {
			System.out.print(this.getName()+" ");
		}
	}
}