package org.edu.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.edu.dao.IF_ReplyDAO;
import org.edu.vo.ReplyVO;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
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
	@RequestMapping(value="/reply/reply_list/{bno}", method=RequestMethod.POST)
	public ResponseEntity<Map<String,Object>> reply_list(@PathVariable("bno") Integer bno) {
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
			List<ReplyVO> replyList = replyDAO.selectReply(bno);
			if(replyList.isEmpty()) { //댓글이 없을 때
				//result=null;
				result = new ResponseEntity<Map<String,Object>>(HttpStatus.NO_CONTENT);	 	//코드 204
			}else {					  //댓글이 있을 때
				resultMap.put("replyList", replyList);
				//resultMap를 Json데이터로 반환하려면, jackson-databind 모듈이 필수(pom.xml)
				result = new ResponseEntity<Map<String,Object>>(resultMap,HttpStatus.OK);	//코드 200
			}
			
		} catch (Exception e) {
			result=new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);//코드 500
		}
		return result;
	}
	//댓글입력 메소드(아래)
	@RequestMapping(value="/reply/reply_write", method=RequestMethod.POST)
	public ResponseEntity<String> reply_write(){
		ResponseEntity<String> responseEntity = new ResponseEntity<String>("OK", HttpStatus.OK);
		//ResponseEntity는 json 텍스트를 반환하는데, (전송내용:"SUCCESS", HttpSatus.OK(200))
		//(전송내용-e.getMessage()실페메세지값, 전송상태-HttpStatus.BAD_REQUEST(400))
		return responseEntity;
	}
	//기존 @Controller의 메소드 반환값인 파일위치 대신에
	//@RestController의 메소드의 반환값인 ResponseEntity는 json텍스트(body,전송상태값)로, Ajax로 호출한 jsp에 리턴보내게 된다.
}
