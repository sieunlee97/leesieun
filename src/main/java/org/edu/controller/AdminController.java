package org.edu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

// 스프링에서 사용가능한 클래스를 빈(bean)이라고 하고, @Controller 클래스를 사용하면 된다.
@Controller
public class AdminController {
	@RequestMapping(value="/admin/board_list", method=RequestMethod.GET)
	public String board_list() {
		return "admin/board/board_list";
	}
	
	@RequestMapping(value="/admin/member_write", method=RequestMethod.POST)
	public String member_write_do() {
		// 아래 GET방식의 폼 출력화면에서 데이터 전송받은 내용을 처리하는 바인딩
		// DB 입력/출력/삭제/수정 처리
		return "redirect:/admin/member_list";//절대경로로 처리된 이후에 이동할 URL주소 입력
	}
	
	@RequestMapping(value="/admin/member_write", method=RequestMethod.GET)
	public String member_write() {
		return "admin/member/member_write";
	}

	@RequestMapping(value="/admin/member_view", method=RequestMethod.GET)
	public String member_view() {
		return "admin/member/member_view";		
	}
	
	@RequestMapping(value="/admin/member_list", method=RequestMethod.GET)
	public String member_list() {
		return "admin/member/member_list";
	}
	
	//bind:묶는다는 의미, /admin 요청경로와 admin/home.jsp를 묶는다.
	@RequestMapping(value="/admin",method=RequestMethod.GET)
	public String admin() {
		return "admin/home";
	}
}
