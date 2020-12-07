package kr.or.test;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

public class FileInputOutput {

	public static void main(String[] args) throws IOException {
		// 내 PC에 저장된 텍스트 메모장 파일 읽어들이고, 출력하기 구현
		
		// 내부변수 선언
		FileInputStream fileInputStream = null;
		FileOutputStream fileOutputStream = null;
		
		// 오브젝트, 실행가능한 클래스형 변수 생성, 인스턴스(실행)
		try {
			fileInputStream = new FileInputStream("C:\\egov\\workspace\\leesieun\\manifest.yml");
			//fileOutputStream = new FileOutputStream("");
			//반복문으로 for(시작;끝;증가)를 사용했지만, 지금은 while(~조건동안){구현내용} 사용
			int byte_content;
			while((byte_content=fileInputStream.read()) != -1) { // -1은 문서끝을 읽어들일 때까지
				System.out.println("바이트형 문자 읽어 들이기" + (char)byte_content);
			}
		} catch (FileNotFoundException e) {
			System.out.println("경로에서 파일을 찾을 수 없습니다." + e.toString());
			e.printStackTrace();
		}
	}

}
