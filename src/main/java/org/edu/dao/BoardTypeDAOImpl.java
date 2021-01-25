package org.edu.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.edu.vo.BoardTypeVO;
import org.springframework.stereotype.Repository;

@Repository
public class BoardTypeDAOImpl implements IF_BoardTypeDAO {
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<BoardTypeVO> select_board_type() throws Exception {
		// 게시판 타입 리스트를 출력하는 쿼리 매핑(아래)
		return sqlSession.selectList("boardTypeMapper.selectBoardType");
	}

	@Override
	public BoardTypeVO view_board_type(String board_type) throws Exception {
		// 게시판 타입 수정 시 기존 내용 불러오는 쿼리 매핑(아래)
		return sqlSession.selectOne("boardTypeMapper.viewBoardType", board_type);
	}

	@Override
	public void update_board_type(BoardTypeVO boardTypeVO) throws Exception {
		// 게시판 타입 수정 쿼리 매핑(아래)
		sqlSession.update("boardTypeMapper.updateBoardType", boardTypeVO);
		
	}

	@Override
	public void insert_board_type(BoardTypeVO boardTypeVO) throws Exception {
		// 게시판 타입 신규 등록 쿼리 매핑(아래)
		sqlSession.insert("boardTypeMapper.insertBoardType", boardTypeVO);		
	}

	@Override
	public void delete_board_type(String board_type) throws Exception {
		// 게시판 타입 삭제 쿼리 매핑(아래)
		sqlSession.delete("boardTypeMapper.deleteBoardType", board_type);
		
	}

}
