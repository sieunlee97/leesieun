package org.edu.dao;

import java.util.List;

import org.edu.vo.MemberVO;

/**
 * 회원관리 DAO 메소드 명세(목차) 인터페이스
 * @author 이시은
 *
 */
public interface IF_MemberDAO {
	public List<MemberVO> selectMember() throws Exception;
	public void insertMember(MemberVO memberVO) throws Exception;
	public void deleteMember(String user_id) throws Exception;
	//throws 스프링을 예외보내면, 나중에 예외처리 전용 error.jsp를 만들어서 에러메세지 뿌리는 사용자단 사용
}
