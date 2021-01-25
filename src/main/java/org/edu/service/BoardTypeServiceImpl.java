package org.edu.service;

import javax.inject.Inject;

import org.edu.dao.IF_BoardTypeDAO;
import org.edu.vo.BoardTypeVO;

import org.springframework.stereotype.Service;

@Service
public class BoardTypeServiceImpl implements IF_BoardTypeService {

	@Inject
	private IF_BoardTypeDAO boardTypeDAO;
	
	@Override
	public BoardTypeVO view_board_type(String board_type) throws Exception {
		// 게시판 타입 수정용 기존값 불러오는 DAO호출(아래)
		return boardTypeDAO.view_board_type(board_type);
	}

	@Override
	public void update_board_type(BoardTypeVO boardTypeVO) throws Exception {
		// 게시판 타입 수정 DAO호출(아래)
		boardTypeDAO.update_board_type(boardTypeVO);
	}

	@Override
	public void insert_board_type(BoardTypeVO boardTypeVO) throws Exception {
		// 게시판 타입 신규 생성 DAO 호출(아래)
		boardTypeDAO.insert_board_type(boardTypeVO);
	}

	@Override
	public void delete_board_type(String board_type) throws Exception {
		// 게시판 타입 삭제 DAO 호출(아래)
		boardTypeDAO.delete_board_type(board_type);
	}



}
