package kr.or.test;
/**
 * 내부변수와 배열 사용
 * @author 이시은
 *
 */
public class Step1 {
	
	public static void main(String[] args) {
		// 필드=메소드 내부변수 만들기
		// 내부변수 <-> 전역변수(멤버변수)
		String name;
		int age;
		String phoneNum;
		// 변수에 값을 대입연산자로 대입
		name="홍길동";
		age=45;
		phoneNum="010-0000-0000";
		//위 내용을 출력하는 메소드 1개 사용
		printMember(name, age, phoneNum);	
		name="성춘향"; age=18; phoneNum="111-1111-1111";
		printMember(name,age,phoneNum);
		name="각시탈"; age=28; phoneNum="222-2222-2222";
		printMember(name, age, phoneNum);
		
		//배열을 이용해서 좀 더 간편하게 입력하고, 출력해보기
		String[] names = {"홍길동", "성춘향", "각시탈"};
		int[] ages = {45, 20, 28};
		String[] phoneNums = {"010-0000-0000", "111-1111-1111", "222-2222-2222"};
		printMember(names, ages, phoneNums);
	}

	private static void printMember(String[] names, int[] ages, String[] phoneNums) {
		// member를 출력하는데 배열값을 받아서 구현
		int dataLength = names.length; // 이름배열에 있는 사람의 명 수 구하기
		for(int cnt=0; cnt<dataLength; cnt++) {
			System.out.println("배열의 이름 : "+names[cnt]+"| 나이 : "+ages[cnt]+"| 연락처 : "+phoneNums[cnt]);
		}
		
	}

	private static void printMember(String name, int age, String phoneNum) {
		// member를 출력하는 프린트 메소드 구현 내용 
		System.out.println("회원의 이름 : "+name+"| 나이 : "+age+"| 연락처 : "+phoneNum);
	}

}
