package kr.or.test;

import java.io.IOException;

import org.edu.vo.MemberVO;
//import java.io.InputStreamReader;

/**
 * 자바에서 예외처리하는 테스트 클래스
 * @author sieunlee
 *
 */
public class ExceptionTest {

	public static void main(String[] args) throws IOException{
		// toString메소드에 대해서...
		MemberVO memberVO = new MemberVO(); //jsp폼데이터를 set으로 저장->get으로 출력
		// 멤버클래스에 값을 입력해 본다. 메모리DB에 입력
		memberVO.setUser_id("leesieun");
		memberVO.setUser_name("이시은");
		memberVO.setEmail("tldms0137@naver.com");
		System.out.println("회원정보 클래스의 멤버변수 값들 출력하기 = "+memberVO.getUser_name());
		System.out.println("회원정보 클래스의 멤버변수 값들 출력하기 = "+memberVO.toString());
		System.out.println("");
		// 진입 실행 메소드 main()
		// 메소드 내부변수
		String[] stringArray = {"10", "2a","100"}; //2a는 강제로 예외사항 발생시키기 위해서
		int indexValue = 0;
		for(int cnt=0; cnt<=2; cnt++) {
			/*
			indexValue = Integer.parseInt(stringArray[cnt]);//배열의 문자값을 int형변환
			System.out.println(cnt+ "번째 배열에 저장된 숫자는 = " + indexValue);
			*/
			// 아래처럼 예외처리를 하면, 프로그램 종료되지 않고, 예외에 대한 메세지만 출력하고 게속 실행됨.
			try {
				indexValue = Integer.parseInt(stringArray[cnt]);//배열의 문자값을 int형변환
				System.out.println((cnt+1) + "번째 배열에 저장된 숫자는 = " + indexValue);
			}catch(ArrayIndexOutOfBoundsException e) {
				System.out.println("에러메세지 출력 : " + e.toString());
				System.out.println("개발자가 지정한 에러메세지 : 배열의 크기가 올바르지 않음.");
			}
			catch(NumberFormatException e) {
				System.out.println("에러메세지 출력 : " + e.toString());
				System.out.println("개발자가 지정한 에러메세지 : 숫자 변환 시 에러가 발생되었음.");
			}finally {
				System.out.println("finally는 try~catch 결과와 상관 없이 항상 실행");
			}
		}
		
	}

}
