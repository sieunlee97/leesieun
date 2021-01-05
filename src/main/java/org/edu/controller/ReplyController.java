package org.edu.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
	
	@RequestMapping(value="/reply/reply_list/{bno}", method=RequestMethod.GET)
	public ResponseEntity<Map<String,Object>> reply_list() {
		ResponseEntity<Map<String,Object>> result = null;

		Map<String,Object> resultMap = new HashMap<String,Object>();//해시맵타입으로 Json저장소생성
		//Map변수=데이터형 [{'key':'List<>'},{'key':'ClassVO'},{'':''},...]
		Map<String,Object> dummyMap = new HashMap<String,Object>();
		dummyMap.put("rno", "1");
		dummyMap.put("replyer", "관리자");
		dummyMap.put("reply_text", "댓글 입력 테스트 입니다.");
		Map<String,Object> dummyMap2 = new HashMap<String,Object>();
		dummyMap.put("rno", "2");
		dummyMap2.put("replyer", "관리자");
		dummyMap2.put("reply_text", "댓글 입력 테스트 입니다.");
		List<Object> dummyMapList = new ArrayList<Object>();
		dummyMapList.add(0,dummyMap);
		dummyMapList.add(1,dummyMap2);
		//-----------------------------------------------
		resultMap.put("replyList", dummyMapList);//put메서드로 Key:Value 제이슨데이터 생성
		//resultMap를 Json데이터로 반환하려면, jackson-databind 모듈이 필수(pom.xml)
		result = new ResponseEntity<Map<String,Object>>(resultMap,HttpStatus.OK);
		//HttpStatus.No_CONTENT 는 204 조회된 데이터가 없음 코드.
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
