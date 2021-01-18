package org.edu.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.edu.dao.IF_BoardDAO;
import org.edu.dao.IF_ReplyDAO;
import org.edu.vo.AttachVO;
import org.edu.vo.BoardVO;
import org.edu.vo.PageVO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service // 스프링빈으로 사용하기 위해서 어노테이션 사용
public class BoardServiceImpl implements IF_BoardService {

	@Inject //댓글 DAO 클래스 주입
	private IF_ReplyDAO replyDAO;
	
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
	public List<AttachVO> readAttach(Integer bno) throws Exception {
		// bno번호에 해당하는 첨부파일 조회하기 DAO연결(아래)
		return boardDAO.readAttach(bno);
	}
	
	@Override
	public List<HashMap<String, Object>> readAttach_notUse(Integer bno) throws Exception {
		// bno번호에 해당하는 첨부파일 조회하기 DAO연결(아래)
		return boardDAO.readAttach_notUse(bno);
	}

	@Transactional
	@Override
	public void insertBoard(BoardVO boardVO) throws Exception {
		// 게시물 등록 DAO연결(아래)
		boardDAO.insertBoard(boardVO);
		// 첨부파일 등록 DAO연결(아래)
		Integer bno = boardVO.getBno();
		String[] save_file_names = boardVO.getSave_file_names();
		String[] real_file_names = boardVO.getReal_file_names();
		
		//첨부파일이 여러개일 때 상황 대비
		int index = 0;
		String real_file_name="";
		if(save_file_names == null) {return;} //배열에 첨부파일 없으면 진행 빠져나감.(아래 코드 진행 안됨)
		for(String save_file_name:save_file_names) {//첨부파일 1개일때는 1번만 반복됩니다.
			if(save_file_name != null) {//첨부파일배열에서 배열값이 있는경우만
				real_file_name = real_file_names[index];
				boardDAO.insertAttach(save_file_name, real_file_name);
			}
			index = index + 1;
		}
	}

	@Transactional
	@Override
	public void deleteBoard(Integer bno) throws Exception {
		// 첨부파일 삭제 후, 게시물 삭제 DAO연결(아래)
		boardDAO.deleteAttachAll(bno);
		replyDAO.deleteReplyAll(bno);
		boardDAO.deleteBoard(bno);
		
	}

	@Override
	public void updateBoard(BoardVO boardVO) throws Exception {
		// 게시물 수정 DAO연결(아래)
		boardDAO.updateBoard(boardVO);
		// 첨부파일 등록 DAO연결(아래), 조건: 첨부파일 DB를 삭제한 이후		
		Integer bno = boardVO.getBno();
		String[] save_file_names = boardVO.getSave_file_names();
		String[] real_file_names = boardVO.getReal_file_names();
		//첨부파일이 여러개일 때 상황 대비
		if(save_file_names == null) {return;} //첨부파일 없을때
		int index = 0;
		String real_file_name="";
		for(String save_file_name:save_file_names) { //첨부파일 개수만큼 반복
			if(save_file_name != null) {
				real_file_name=real_file_names[index];
				boardDAO.updateAttach(save_file_name, real_file_name, bno);	
			}
			index=index+1;
		}
		
		
	}

}
