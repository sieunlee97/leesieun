package org.edu.service;

import java.util.List;

import javax.inject.Inject;

import org.edu.dao.IF_BoardDAO;
import org.edu.vo.BoardVO;
import org.edu.vo.PageVO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service // 스프링빈으로 사용하기 위해서 어노테이션 사용
public class BoardServiceImpl implements IF_BoardService {

	@Inject //DAO클래스 주입받아서 사용변수 생성
	private IF_BoardDAO boardDAO;
	
	@Override
	public List<BoardVO> selectBoard(PageVO pageVO) throws Exception {
		// DAO클래스 사용 코드(아래)
		return boardDAO.selectBoard(pageVO);
	}

	@Override
	public int countBoard(PageVO pageVO) throws Exception {
		// DAO클래스 사용 코드(아래)
		return boardDAO.countBoard(pageVO);
	}

	// 아래 메소드는 구현이 2개 있는데, 조회수 업데이트 처리 후
	// 조회 에러 발생시 업데이트한 조회수를 원상복귀하는 작업 필요한데, 그 작업이 트랜잭션.
	@Transactional // 에러발생시 update부분이 롤백(Rollback)된다.
	@Override 
	public BoardVO readBoard(Integer bno) throws Exception {
		// bno 번호에 해당하는 게시물 조회 쿼리 DAO연결 + 해당 게시물 조회 수 업데이트
		boardDAO.updateViewCount(bno);
		return boardDAO.readBoard(bno);
	}

	@Override
	public List<String> readAttach(Integer bno) throws Exception {
		// bno번호에 해당하는 첨부파일 조회하기 DAO연결(아래)
		return boardDAO.readAttach(bno);
	}

}
