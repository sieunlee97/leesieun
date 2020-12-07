package kr.or.test;

//Runnable 인터페이스 구현클래스
public class RunnableApp implements Runnable {

	public static void main(String[] args) {
		// Runnable 인터페이스를 구현하는 내용
		(new Thread(new RunnableApp())).start();
	}

	@Override
	public void run() {
		// Runnable 인터페이스 구현클래스를 start()하면 자동 실행
		System.out.println("Runnable 시작 시, 자동실행");
		
	}

}

