package org.edu.service;

import java.util.List;

import org.edu.vo.MemberVO;

/**
 * IF_MemberService클래스는 DAO를 호출하는 역할이다.
 * @author 이시은
 *
 */
public interface IF_MemberService {
	public List<MemberVO> selectMember(String search_type, String search_keyword) throws Exception;
	// 메소드 정의할 때 파라미터 타입 필요. 파라미터(매개변수)를 String형으로 받는다. 
}
