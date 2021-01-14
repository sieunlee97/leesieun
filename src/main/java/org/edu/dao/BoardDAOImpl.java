package org.edu.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.edu.vo.AttachVO;
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

	@Override
	public BoardVO readBoard(Integer bno) throws Exception {
		// 게시물 상세보기 매퍼 쿼리 연결(아래)
		return sqlSession.selectOne("boardMapper.readBoard", bno);
	}
	@Override
	public List<AttachVO> readAttach(Integer bno) throws Exception {
		// 게시물에 딸린 첨부파일 보기 매퍼 쿼리 연결(아래)
		return sqlSession.selectList("boardMapper.readAttach", bno);
	}

	@Override
	public List<HashMap<String,Object>> readAttach_notUse(Integer bno) throws Exception {
		// 게시물에 딸린 첨부파일 보기 매퍼 쿼리 연결(아래)
		return sqlSession.selectList("boardMapper.readAttach_notUse", bno);
	}

	@Override
	public void updateViewCount(Integer bno) throws Exception {
		// 게시물 상세보기 시, 조회수 +1 업데이트처리 매퍼 쿼리 연결(아래)
		sqlSession.update("boardMapper.updateViewCount", bno);
	}

	@Override
	public void insertBoard(BoardVO boardVO) throws Exception {
		// 게시물 등록 매퍼쿼리 연결(아래)
		sqlSession.insert("boardMapper.insertBoard", boardVO);
		
	}

	@Override
	public void deleteBoard(Integer bno) throws Exception {
		// 게시물 삭제 매퍼쿼리 연결(아래)
		sqlSession.delete("boardMapper.deleteBoard", bno);
		
	}

	@Override
	public void updateBoard(BoardVO boardVO) throws Exception {
		// 게시물 업데이트 매퍼쿼리 연결(아래)
		sqlSession.update("boardMapper.updateBoard", boardVO);
		
	}

	@Override
	public void insertAttach(String save_file_name, String real_file_name) throws Exception {
		// 첨부파일 입력 매퍼쿼리 연결(아래)
		Map<String,Object> paramMap = new HashMap<String, Object>();
		paramMap.put("save_file_name", save_file_name);
		paramMap.put("real_file_name", real_file_name);
		sqlSession.insert("boardMapper.insertAttach", paramMap);
		
	}

	@Override
	public void deleteAttach(String save_file_name) throws Exception {
		// 첨부파일 1개 삭제 매퍼쿼리 연결(아래)
		sqlSession.delete("boardMapper.deleteAttach", save_file_name);
	}

	@Override
	public void deleteAttachAll(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete("boardMapper.deleteAttachAll", bno);
	}

	@Override
	public void updateAttach(String save_file_name, String real_file_name, Integer bno) throws Exception {
		// 해당 게시물의 첨부파일 업데이트 매퍼쿼리 연결(아래)
		Map<String,Object> paramMap = new HashMap<String, Object>();
		paramMap.put("save_file_name", save_file_name);
		paramMap.put("real_file_name", real_file_name);
		paramMap.put("bno", bno);
		sqlSession.insert("boardMapper.updateAttach",paramMap);
		
	}
}
