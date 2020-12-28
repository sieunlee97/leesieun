package org.edu.dao;

import java.util.List;

import org.edu.vo.BoardVO;
import org.edu.vo.PageVO;

public interface IF_BoardDAO {
	public List<BoardVO> selectBoard(PageVO pageVO) throws Exception;
}
