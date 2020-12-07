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
		
		try {
			fileInputStream = new FileInputStream("C:\\\\egov\\\\workspace\\\\leesieun\\\\manifest.yml");
			int byte_content;
			while((byte_content=fileInputStream.read()) != -1) {
				System.out.println("바이트형 문자 읽어들이기 " + (char)byte_content);
			}
		
		}catch(FileNotFoundException e){
			System.out.println("경로에서 파일을 찾을 수 없다."+e.toString());
		}
			
		}
}
