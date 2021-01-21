package kr.or.test;

public class HelloWorldApp {

	public static void main(String[] args) {
		// 위 main() 메소드는 자바프로그램의 실행 진입지점입니다.
		System.out.println("헬로우 월드!");
		String testNull = null;
		String testEmpty = "";
		System.out.println("null출력-"+testNull+"/");
		System.out.println("empty출력-"+testEmpty+"/");
		//System.out.println("testNull.isEmpty메소드값 출력"+testNull.isEmpty()); 에러발생
		System.out.println("testEmpty.isEmpty메소드값 출력"+testEmpty.isEmpty());
	}
}
