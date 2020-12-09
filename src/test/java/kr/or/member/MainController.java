package kr.or.member;

import java.io.IOException;
import java.net.InetAddress;
//아래 두 예외처리는 IOException에 포함
import java.net.SocketException;
import java.net.UnknownHostException;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;

import org.apache.commons.net.ntp.NTPUDPClient;
import org.apache.commons.net.ntp.TimeInfo;

import kr.or.member.MemberService;
import kr.or.member.MemberVO;

public class MainController {

	public static void main(String[] args) throws IOException {
		// 실행 메소드

		MemberVO memberVO = new MemberVO();
		memberVO.setName("이시은");
		memberVO.setAge(25);
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
		
		
		//서버시간 가져오기
		System.out.println();
		System.out.println("========================= 서버시간 출력 =========================");
		//서버시간을 가져올 수 있는 commons-net Maven Dependencies 사용해서 외부라이브러리 추가
		NTPUDPClient timeClient = new NTPUDPClient();
		timeClient.setDefaultTimeout(2000); //네트워크로 서버시간을 가져올 때, 응답 시간이 1초를 넘기면 재접속해라.
		timeClient.open(); //예외처리를 main()메소드에 넘김
		//pool.ntp.org는 서버시간 보내줄 실제 서버 주소.
		InetAddress address = InetAddress.getByName("pool.ntp.org");
		TimeInfo timeInfo = timeClient.getTime(address);
		// pool.ntp.org의 서버시간이 담긴 address를 불러와서 timeinfo에 반환
		
		// 서버시간을 담은 timeInfo 객체변수사용
		// TimeStamp : 1970년부터 초단위로 계산된 현재까지의 초를 합친 결과값
		long returnTime = timeInfo.getMessage().getTransmitTimeStamp().getTime();
		
		// 위 반환받은 타임스탬프 초 값을 사람이 알아볼 수 있는 시간으로 변환
		Date nowDate = new Date(returnTime);
		//System.out.println("현재 서버시간 - 영어버전 : "+nowDate);
		// Wed Dec 09 11:17:41 KST 2020 -> 2020-12-09 11:17:41
		//SimpleDateFormat formatDate = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		//System.out.println("현재 서버시간 - 한국버전 : "+formatDate.format(nowDate));
		LocalDateTime localDateTime = nowDate.toInstant()
				.atZone(ZoneId.systemDefault())
				.toLocalDateTime();
		System.out.println("Server시간 : "+localDateTime);
		System.out.println("로컬PC 시간 : "+localDateTime.now());
	}

}
