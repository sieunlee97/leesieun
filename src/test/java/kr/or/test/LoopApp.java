package kr.or.test;

public class LoopApp {

	public static void main(String[] args) {
		// 반복문 중에 for문
		int[] numbers = {1,2,3,4,5,6,7,8,9,10}; //배열변수 선언
		int cnt; //반복횟수 카운트하는 역할 변수 선언
		//for문(반복의 시작 값 정의; 반복의 종료 값 정의; 반복할 때 증가하는 값;) { 반복할 때 구현내용 }
		for(cnt=0; cnt<10; cnt++) {//cnt++은 cnt=cnt+1과 같은 의미
			System.out.println("현재 카운터는 " + numbers[cnt]);
			//println함수는 한번 출력 후 newline 엔터치는 역할
			//10번 반복하는데, numbers[0], numbers[1], ..., numbers[9] 출력
		}
		// 향상된 for문, 스프링 jsp에서 가장 많이 사용하게 될 구문
		String[] names = {"사용자1", "사용자2","사용자3","사용자4","사용자5"};
		// names는 클래스형 변수이지만, 인스턴스는 아니다.
		//자바에서 String형 큰따옴표는 문자열 데이터, char형 작은따옴표는 한개의 문자
		//배열타입[] 1차원 배열 = 가로 선 1row 단일 
		//향상된 for문에서는 시작값, 끝값, 증가값 필요 없음
		for(String user_name:names) {
			System.out.println("등록된 사용자 이름은 " + user_name);
		}
		
		String[][] members = {
				{"admin", "관리자", "admin@abc.com", "true", "2020-12-01", "ROLE_ADMIN"},
				{"user", "사용자", "user@abc.com", "false", "2020-12-04", "ROLE_USER"}
		};
		//배열타입[][] 2차원배열 = 표 1row, 2row 리스트
		System.out.println("=========회원리스트=========");
		System.out.println("user_id | user_name |    mail    | use | REGdate | levels");
		for(String[] member:members) {
			System.out.println(member[0]+" | "+member[1]+" | "+member[2]
					+" | "+member[3]+" | "+member[4]+" | "+member[5]);
		}
	}

}
