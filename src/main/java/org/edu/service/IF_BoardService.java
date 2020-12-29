package org.edu.service;

import java.util.List;

import org.edu.vo.BoardVO;
import org.edu.vo.PageVO;

public interface IF_BoardService {
	public List<BoardVO> selectBoard(PageVO pageVO) throws Exception;
	public int countBoard(PageVO pageVO) throws Exception;
	public BoardVO readBoard(Integer bno) throws Exception;
	public List<String> readAttach(Integer bno) throws Exception;
	public void insertBoard(BoardVO boardVO) throws Exception;
	public void deleteBoard(Integer bno) throws Exception;
	public void updateBoard(BoardVO boardVO) throws Exception;
}
