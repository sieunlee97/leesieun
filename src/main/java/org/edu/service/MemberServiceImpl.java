package org.edu.service;

import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

import javax.inject.Inject;

import org.edu.dao.IF_MemberDAO;
import org.edu.vo.MemberVO;
import org.edu.vo.PageVO;
import org.springframework.stereotype.Service;

/**
 * MemberServiceImpl는 DAO 메소드 호출 구현
 * @author 이시은
 *
 */

// 스프링에서 빈으로 인식하려면 어노테이션 필요
@Service
public class MemberServiceImpl implements IF_MemberService {
	@Inject
	IF_MemberDAO memberDAO; // IF_MemberDAO를 주입받아서 MemberDAO 객체 생성
	
	@Override
	public List<MemberVO> selectMember(PageVO pageVO) throws Exception {
		//회원정보조회 DAO클래스의 메소드 호출(아래)
		return memberDAO.selectMember(pageVO);		
	}

	@Override
	public int countMember(PageVO pageVO) throws Exception {
		// 검색된 회원의 전체 명 수 구하기
		return memberDAO.countMember(pageVO);
	}

	@Override
	public MemberVO readMember(String user_id) throws Exception {
		// 선택한 회원의 상세 정보 읽어들이기
		return memberDAO.readMember(user_id);
	}

	@Override
	public void deleteMember(String user_id) throws Exception {
		// 선택한 회원 삭제하기
		memberDAO.deleteMember(user_id);
		
	}

	@Override
	public void updateMember(MemberVO memberVO) throws Exception {
		// 선택한 회원정보 수정하기
		memberDAO.updateMember(memberVO);
	}

	@Override
	public void insertMember(MemberVO memberVO) throws Exception {
		// jsp 폼에서 입력한 회원정보 등록하기
		memberDAO.insertMember(memberVO);
	}

	@Override
	public void herokuJobMethod() throws Exception {
		// 월-금 오전8시부터 오후 11시까지 (미국시간 23, 0-14) 헤로쿠앱에 20분간격으로 URL접근
		String urlStr = "https://leesieun.herokuapp.com";
		URL url = new URL(urlStr);
		HttpURLConnection urlConnection = (HttpURLConnection)url.openConnection();
		urlConnection.setUseCaches(false); //기존 접속된 정보가 있든지 없든지 무조건 접속
		urlConnection.setReadTimeout(10000); //접속 대기시간을 10초. 헤로쿠 20초 ZZZ깨어남
		//개발자 확인 코드(아래)
		if(urlConnection != null && urlConnection.getResponseCode()==HttpURLConnection.HTTP_OK) {
			System.out.println("헤로쿠 앱이 활성화되었습니다.");
		}else {
			System.out.println("해로쿠 앱이 활성화되지 않았습니다.");
		}
	}
	
}
