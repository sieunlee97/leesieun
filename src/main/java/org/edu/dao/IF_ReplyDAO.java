package org.edu.dao;

import java.util.List;

import org.edu.vo.PageVO;
import org.edu.vo.ReplyVO;

public interface IF_ReplyDAO {
	public List<ReplyVO> selectReply(Integer bno, PageVO pageVO) throws Exception;
	public void updateCountReply(Integer bno) throws Exception;
	public void insertReply(ReplyVO replyVO) throws Exception;
	public void updateReply(ReplyVO replyVO) throws Exception;
	public void deleteReply(Integer rno) throws Exception;
	public int selectReplyCount(Integer bno) throws Exception;
}
