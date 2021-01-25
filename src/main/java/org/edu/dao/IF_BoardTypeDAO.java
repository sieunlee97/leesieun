package org.edu.dao;

import java.util.List;

import org.edu.vo.BoardTypeVO;

public interface IF_BoardTypeDAO {
	public List<BoardTypeVO> select_board_type() throws Exception;
}
