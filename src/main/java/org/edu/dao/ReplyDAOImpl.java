package org.edu.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.edu.vo.ReplyVO;
import org.springframework.stereotype.Repository;

@Repository // MVC관련 어노테이션 중 모델 어노테이션 
public class ReplyDAOImpl implements IF_ReplyDAO {

	@Inject 
	private SqlSession sqlSession; //root-context.xml에서 지정한 sql템플릿 빈 사용
	
	@Override
	public List<ReplyVO> selectReply(Integer bno) throws Exception {
		// 매퍼쿼리 연결	
		return sqlSession.selectList("replyMapper.selectReply", bno);
	}

	@Override
	public int countReply(Integer bno) throws Exception {
		// 매퍼쿼리 연결
		return sqlSession.selectOne("replyMapper.countReply", bno);
	}

	@Override
	public void insertReply(ReplyVO replyVO) throws Exception {
		// 매퍼쿼리 연결
		sqlSession.insert("replyMapper.insertReply", replyVO);
	}

	@Override
	public void updateReply(ReplyVO replyVO) throws Exception {
		// 매퍼쿼리 연결
		sqlSession.update("replyMapper.updateReply", replyVO);
	}

	@Override
	public void deleteReply(Integer rno) throws Exception {
		// 매퍼쿼리 연결
		sqlSession.delete("replyMapper.deleteReply", rno);
	}

}
