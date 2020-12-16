package org.edu.service;

import java.util.List;

import javax.inject.Inject;

import org.edu.dao.IF_MemberDAO;
import org.edu.vo.MemberVO;
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
	public List<MemberVO> selectMember(String search_type, String search_keyword) throws Exception {
		//회원정보조회 DAO클래스의 메소드 호출(아래)
		return memberDAO.selectMember(search_type, search_keyword);		
	}
	
}
