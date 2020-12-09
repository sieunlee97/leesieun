package kr.or.member;

import kr.or.member.MemberVO;

public class MemberService {
	public void printMember(MemberVO[] members_) { // members는 레코드가 여러개=여러줄
		// 서비스 구현 메소드 내용 , 향상된 for반복문 사용
		int cnt = 0;
		for (MemberVO member : members_) { // members 여러 레코드 중 한 개의 레코드를 member오브젝트로 대입
			++cnt;
			System.out.println(cnt + "번째 레코드는 " + member.toString());
		}
	}
}
