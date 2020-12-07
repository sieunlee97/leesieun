package kr.or.test;

import java.io.IOException;
//import java.io.InputStreamReader;

/**
 * 자바에서 예외처리하는 테스트 클래스
 * @author sieunlee
 *
 */
public class ExceptionTest {

	public static void main(String[] args) throws IOException{
		// 진입(실행) 메소드 구현내용
		// 멤버변수(전역변수) 
		int number=0;
		// 클래스형 멤버변수(전역변수) 
		// InputStreamReader inputStreamReader = new InputStreamReader(System.in);
		System.out.print("키보드로 0부터 9까지 숫자를 입력해주세요. ");
		try {
			number=System.in.read(); //키보드로 한개의 문자만 입력받아서 바이트데이터 반환
			//number=inputStreamReader.read();//키보드로 한개의 문자만 입력받아서 char형으로 반환
			//number=1l number=a;
		} catch (IOException e) {
			System.out.println("숫자를 입력하지 않으셨습니다.");
			e.printStackTrace();
		}
		System.out.println("키보드로 입력받은 바이트 문자 = "+ number);
		System.out.println("바이트로 반환받은 수를 문자형으로 변환 = "+ (char)number);
		// int형 number변수를 문자형 char형으로 변환하는 방법 (char)number
		// ex) 숫자 1을 입력하면, byte형 문자는 49, char형으로 변환하면 1로 출력
	}

}
