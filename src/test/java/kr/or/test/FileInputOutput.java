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
		// 오브젝트, 실행가능한 클래스형 변수 생성, 인스턴스 (실행)
		try {
			fileInputStream = new FileInputStream("C:\\egov\\workspace\\leesieun\\manifest.yml");
			fileOutputStream = new FileOutputStream("C:\\egov\\workspace\\leesieun\\manifest_bak.txt");
			//특수문자를 "" 내부에 사용할 때 특수문자를 문자로 인식하게 하는 역할 역슬래시 " \" \\ "
			int byte_content;
			while((byte_content=fileInputStream.read()) != -1) {
				System.out.print(" " + (char)byte_content);
				//read()로 읽어들인 바이트문자를 manyfiest_back.txt파일로 저장(아래)
				fileOutputStream.write(byte_content);
			}
		
		}catch(FileNotFoundException e){
			System.out.println("경로에서 파일을 찾을 수 없다."+e.toString());
			e.printStackTrace();
		}
			
		}
}
