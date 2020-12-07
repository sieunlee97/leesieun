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
		// 진입 실행 메소드 main()
		// 메소드 내부변수
		String[] stringArray = {"10", "2a"};
		int indexValue = 0;
		for(int cnt=0; cnt<2; cnt++) {
			/*
			indexValue = Integer.parseInt(stringArray[cnt]);//배열의 문자값을 int형변환
			System.out.println(cnt+ "번째 배열에 저장된 숫자는 = " + indexValue);
			*/
			try {
				indexValue = Integer.parseInt(stringArray[cnt]);//배열의 문자값을 int형변환
				System.out.println(cnt+ "번째 배열에 저장된 숫자는 = " + indexValue);
			}catch(NumberFormatException e) {
				System.out.println("에러메세지 출력 : " + e.toString());
				System.out.println("개발자가 지정한 에러메세지 : 숫자 변환 시 에러가 발생되었음.");
			}finally {
				System.out.println("finally는 try~catch 결과와 상관 없이 항상 실행");
			}
		}
		
	}

}
