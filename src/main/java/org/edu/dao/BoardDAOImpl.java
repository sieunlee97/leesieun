package org.edu.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.edu.vo.BoardVO;
import org.edu.vo.PageVO;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAOImpl implements IF_BoardDAO{

	@Inject //sqlSessionTemplate을 주입받아 변수로 지정.
	private SqlSession sqlSession;
	
	@Override
	public List<BoardVO> selectBoard(PageVO pageVO) throws Exception {
		// sqlSessionTemplate(select, update, delete, insert 같은 쿼리 메소드 포함) 매퍼쿼리 지정(아래)
		// 매퍼쿼리를 실행할 때, 개발자가 DB커넥션, 디스커넥션을 생각할 필요 없이 사용가능한 메소드 집합을 구성해놓은 것 -> sqlSessionTemplate
		return sqlSession.selectList("boardMapper.selectBoard", pageVO);
	}

	@Override
	public int countBoard(PageVO pageVO) throws Exception {
		// sqlSessionTemplate 사용해서 게시물 개수 구하기, 매퍼쿼리 연결(아래)
		return sqlSession.selectOne("boardMapper.countBoard", pageVO);
	}
}
