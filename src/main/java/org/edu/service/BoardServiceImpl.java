package org.edu.service;

import java.util.List;

import javax.inject.Inject;

import org.edu.dao.IF_BoardDAO;
import org.edu.vo.BoardVO;
import org.edu.vo.PageVO;
import org.springframework.stereotype.Service;

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

}
