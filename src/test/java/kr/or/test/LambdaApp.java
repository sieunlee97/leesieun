package kr.or.test;

import java.util.function.IntSupplier;

public class LambdaApp {

	// static은 현재 클래스에서 유일한 메소드로 사용하겠다.
	public static int method(int x, int y) {
		//IntSupplier 계산된 결과값을 반환할 때, int타입으로 변환하는 명세가 모여있는 인터페이스
		//위 IntSupplier는 인터페이스로 메소드명만 있고, 구현내용이 없는 내용
		// 람다식 적용 전 
		IntSupplier intSupplier = new IntSupplier() { //구현내용 시작
			@Override
			public int getAsInt() {
				int sum = x+y;
				return sum;
			}
		};
		// 위 intSupplier오브젝트를 호출해야만 실행이 된다.
		int result = intSupplier.getAsInt();
		
		
		// 람다식 적용 후 -----------------------------------------------------------------------
		IntSupplier intSupplier2 = () -> {// new생략,  메소드명 생략, ->에로우함수 추가, @override 생략
				int sum = x + y;
				return sum;			
		};
		int result2 = intSupplier2.getAsInt();
		
		
		return result2;
	}
	public static void main(String[] args) {
		// 자바 애플리케이션의 진입 실행 함수
		System.out.println("람다식 테스트용 메소드 반환값 출력 = "+ method(3,5));

	}
}
