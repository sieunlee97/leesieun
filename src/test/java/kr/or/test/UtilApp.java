package kr.or.test;

public class UtilApp {

	public static void main(String[] args) {
		// 클래스의 실행 진입점
		// java.lang.Math클래스를 사용해서 랜덤하게 숫자 뽑아보기
		// 제비뽑기로 생각하면, 꽝이 0
		System.out.println("1부터 30까지 제비뽑기 숫자 출력하기 = "
							+ (int)(Math.random()*30)); // +1을 하면 1부터, +1없으면 0부터 
		//결과가 double(실수)로 나오기 때문에, 정수형(int)로 형변환해서 출력
		//아이디 자동생성기 만들 때, Math클래스의 랜덤에서도 사용하게 된다.
		//기본형을 객체(Object)로 표현했다는 int(Not null) -> Integer(null 허용),
		//float -> Float, double -> Double
	}	

}
