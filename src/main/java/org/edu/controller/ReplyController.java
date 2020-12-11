package org.edu.controller;

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
