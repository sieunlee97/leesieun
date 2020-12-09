package kr.or.member;

import kr.or.member.MemberService;
import kr.or.member.MemberVO;

public class MainController {

	public static void main(String[] args) {
		// 실행 메소드

		MemberVO memberVO = new MemberVO();
		memberVO.setName("홍길동");
		memberVO.setAge(45);
		memberVO.setPhoneNum("010-0000-0000");

		MemberVO memberVO2 = new MemberVO();
		memberVO2.setName("성춘향");
		memberVO2.setAge(18);
		memberVO2.setPhoneNum("111-1111-1111");

		MemberVO memberVO3 = new MemberVO();
		memberVO3.setName("각시탈");
		memberVO3.setAge(28);
		memberVO3.setPhoneNum("222-2222-2222");

		// 위 각각 3개의 레코드를 1군데 담을 배열 클래스 오브젝트를 하나 생성
		MemberVO[] members = new MemberVO[3];
		members[0] = memberVO;
		members[1] = memberVO2;
		members[2] = memberVO3;

		// 이전에 사용했던 출력보다는 개선된 방식으로 출력 - MemberService 서비스 전용 클래스 만들어서 처리.
		MemberService memberService = new MemberService();// 자바 오브젝트 객체 생성 방법
		memberService.printMember(members); // 서비스 클래스의 메소드 호출

	}

}
