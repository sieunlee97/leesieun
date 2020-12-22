package org.edu.service;

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
	
}
