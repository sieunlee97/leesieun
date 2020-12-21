package org.edu.dao;

import java.util.List;

import org.edu.vo.MemberVO;
import org.edu.vo.PageVO;

/**
 * 회원관리 DAO 메소드 명세(목차) 인터페이스
 * @author 이시은
 *
 */
public interface IF_MemberDAO {
	public int countMember(PageVO pageVO) throws Exception;
	public List<MemberVO> selectMember(PageVO pageVO) throws Exception;
	//jsp에서 foreach문 사용
	public void insertMember(MemberVO memberVO) throws Exception;
	public void deleteMember(String user_id) throws Exception;
	public MemberVO readMember(String user_id) throws Exception;
	//jsp에서 MemberVO.user_id, MemberVO.user_name... 으로 사용
	//List<MemberVO>가 아닌 이유는, 레코드 하나만 가져오면 되기 때문이다.
	//throws 스프링을 예외보내면, 나중에 예외처리 전용 error.jsp를 만들어서 에러메세지 뿌리는 사용자단 사용
	public void updateMember(MemberVO memberVO) throws Exception;
}

