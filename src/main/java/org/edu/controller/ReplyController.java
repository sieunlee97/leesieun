package org.edu.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.edu.dao.IF_ReplyDAO;
import org.edu.vo.PageVO;
import org.edu.vo.ReplyVO;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * ReplyController.java 클래스
 * 댓글 구현 Rest-API 전용 Controller
 * 
 * @author 이시은
 *
 */
@RestController
public class ReplyController {
	@Inject
	private IF_ReplyDAO replyDAO; 
	
	//댓글 리스트 메소드(아래)
	@RequestMapping(value="/reply/reply_list/{bno}/{page}", method=RequestMethod.POST)
	public ResponseEntity<Map<String,Object>> reply_list(@PathVariable("page") Integer page,@PathVariable("bno") Integer bno) throws Exception {
//페이징 계산식 처리
		PageVO pageVO = new PageVO();
		pageVO.setPage(page); // 조건은 Ajax로 호출시 항상 page변수는 반드시 보내야한다.
		pageVO.setPerPageNum(3); //리스트하단에 보이는 페이징번호 개수
		pageVO.setQueryPerPageNum(5); //한페이지당 보이는 댓글 개수
		int replyCount=replyDAO.selectReplyCount(bno);
		pageVO.setTotalCount(replyCount); // 전체 댓글 개수를 구해서 set하는 순간 변수들이 활성화되기 때문에 필요.
//페이징 계산식 처리 끝
//현재 게시물에 달린 전체 댓글 개수 구하기 -> 게시물 관리 테이블에 있는 reply_count 가져와서 사용
		
		System.out.println("디버그 : PathVariable변수는 "+bno);
		
		ResponseEntity<Map<String,Object>> result = null;
		Map<String,Object> resultMap = new HashMap<String,Object>();//해시맵타입으로 Json저장소생성
		//Map변수=데이터형 [{'key':'List<>'},{'key':'ClassVO'},{'':''},...]
//DUMMY---------------------------------------------------------------------------
		Map<String,Object> dummyMap = new HashMap<String,Object>();
		dummyMap.put("rno", "1");
		dummyMap.put("replyer", "관리자1");
		dummyMap.put("reply_text", "컨트롤1 댓글 입력 테스트 입니다.");
		Map<String,Object> dummyMap2 = new HashMap<String,Object>();
		dummyMap.put("rno", "2");
		dummyMap2.put("replyer", "관리자2");
		dummyMap2.put("reply_text", "컨트롤2 댓글 입력 테스트 입니다.");
		List<Object> dummyMapList = new ArrayList<Object>();
		dummyMapList.add(0,dummyMap);
		dummyMapList.add(1,dummyMap2);
		//resultMap.put("replyList", dummyMapList);//put메서드로 Key:Value 제이슨데이터 생성
//---------------------------------------------------------------------------------
		//dummyMapList 대신 DB tbl_reply 테이블에서 조회된 결과값으로 대체.
		try {
			List<ReplyVO> replyList = replyDAO.selectReply(bno, pageVO);
			if(replyList.isEmpty()) { //댓글이 없을 때
				//result=null; //jsp에서 받는 값이 text일 때 적용
				result = new ResponseEntity<Map<String,Object>>(resultMap,HttpStatus.NO_CONTENT);	 	//코드 204
			}else {					  //댓글이 있을 때
				resultMap.put("replyList", replyList);
				resultMap.put("pageVO", pageVO); // 페이징 처리 때문에 추가함. 페이지 정보를 json데이터에 포함시킴
				//resultMap를 Json데이터로 반환하려면, jackson-databind 모듈이 필수(pom.xml)
				result = new ResponseEntity<Map<String,Object>>(resultMap,HttpStatus.OK);	//코드 200
			}
		} catch (Exception e) {
			result=new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);//코드 500
		}
		return result;
	}
	
	//댓글삭제 메소드(아래) 전송방식 POST가 아니고 DELETE 사용
	@RequestMapping(value="/reply/reply_delete/{bno}/{rno}", method=RequestMethod.DELETE)
	public ResponseEntity<String> reply_delete(@PathVariable("rno") Integer rno, @PathVariable("bno") Integer bno) {
		ResponseEntity<String> result=null;
		try {
			replyDAO.deleteReply(rno);
			result=new ResponseEntity<String>("success", HttpStatus.OK);
			replyDAO.updateCountReply(bno);
		} catch (Exception e) {
			result=new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		return result;
	}
	//댓글수정 메소드(아래) 전송방식 POST(전통방식)아니고 PATCH(최근방식, RestAPI)사용
	@RequestMapping(value="/reply/reply_update", method=RequestMethod.PATCH)
	public ResponseEntity<String> reply_update(@RequestBody ReplyVO replyVO) {
		ResponseEntity<String> result = null;
		try {
			replyDAO.updateReply(replyVO);
			result= new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			result= new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		return result;
	}
	
	//댓글입력 메소드(아래)
	@RequestMapping(value="/reply/reply_write", method=RequestMethod.POST)
	public ResponseEntity<String> reply_write(@RequestBody ReplyVO replyVO) {//@RequestBody 클래스는 ajax로 보내온 폼데이터를 ReplyVO 클래스에 바인딩시켜주는 어노테이션 클래스	
		//ResponseEntity<String> responseEntity = new ResponseEntity<String>("OK", HttpStatus.OK);
		//ResponseEntity는 json 텍스트를 반환하는데, (전송내용:"SUCCESS", HttpSatus.OK(200))
		//(전송내용-e.getMessage()실페메세지값, 전송상태-HttpStatus.BAD_REQUEST(400))
		
		ResponseEntity<String> result = null;
		//예외처리를 상위 메소드로 보내지 않는 이유는 RestAPI에서 예외 메세지를 개발자가 제공하기 위해서
		try {
			replyDAO.insertReply(replyVO);
			result=new ResponseEntity<String>("success", HttpStatus.OK);
			replyDAO.updateCountReply(replyVO.getBno());
		} catch (Exception e) {
			result=new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
		return result; //ResponseEntity클래스형 String 값을 Ajax로 호출한 페이지에 반환.
	}
	//기존 @Controller의 메소드 반환값인 파일위치 대신에
	//@RestController의 메소드의 반환값인 ResponseEntity는 json텍스트(body,전송상태값)로, Ajax로 호출한 jsp에 리턴보내게 된다.
}
