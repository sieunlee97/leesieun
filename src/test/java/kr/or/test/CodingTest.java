package kr.or.test;

import java.util.Scanner;

public class CodingTest {
	
	String endString;
	
	public static void main(String[] args) {
		CodingTest codingTest = new CodingTest();
		Scanner sc = new Scanner(System.in);
		String w; //체크할 코딩 문자열
		w = sc.nextLine();
		String r = codingTest.recursive(w);
		if(w.equals(r)) {
			System.out.println("올바른 괄호문자열입니다."+r);
		} else {
			System.out.println("잘못된 괄호문자열입니다. 입력값 :"+w+", 수정값 : "+r);
		}
	}

	public String recursive(String w) {
		if(w == null || w.equals("")) {
			return w+endString;
		} else {
			int balancedIndex = getBalancedIndex(w); //w를 u,v로 파싱할 때 사용할 시작 인덱스값 추출
			String u = w.substring(0, balancedIndex+1);
			String v = w.substring(balancedIndex+1);
			boolean isValidCheck = isValidString(u);//올바른 문자열인지 확인
			if(isValidCheck == true) { //올바른 문자열이람녀
				if(u.equals("(")) {
					endString += ")";
				}else {
					u += recursive(v); //재귀함수 호추라면서 u값 누적
					return u;
				}
			} else { //올바른 문자열이 아니라면
				String createString="(";
				createString += recursive(v); //재귀함수 호출하면서 createString값 누적
				createString += ")";
				createString += reArrange(u); //올바른 괄호문자열 만들기
				return createString;
			}
			return recursive(v);
		}
	}
	
	//올바른 괄호문자열 만들기
	private String reArrange(String u) {
		String arrangeString = "";
		for(int i=1; i<u.length()-1; i++) {
			String tmpChar = u.substring(i, i+1);
			if(tmpChar.equals("(")) {
				arrangeString += ")";
			}else if(tmpChar.equals(")")) {
				arrangeString += "(";
			}
		}
		return arrangeString;
	}

	//올바른 문자열인지 확인
	public boolean isValidString(String u) {
		int balanceCount = 0;
		for(int i=1; i<u.length()-1; i++){
			String tmpChar = u.substring(i, i+1);
			if(tmpChar.equals("(")) {
				balanceCount++;
			}else if(tmpChar.equals(")")) {
				balanceCount--;
			}
		}
		if(balanceCount < 0) {
			return false;
		}else {
			return true;
		}
	}
	//w를 u,v로 파싱할 때 사용할 시작 인덱스값 추출
	public int getBalancedIndex(String w) {
		int index=0;
		int balanceCount=0;
		for(int i=1; i<w.length(); i++) {
			String tmpChar = w.substring(i, i+1); //substring(시작인덱스, 끝인덱스)
			if(tmpChar.equals("(")) {
				balanceCount++;
			} else if(")" ==tmpChar){
				balanceCount--;
			}
			if(balanceCount ==0) {
				index=i;
				break;
			}
		}
		return index;
	}
}
