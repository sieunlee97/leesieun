package org.edu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

// 스프링에서 사용가능한 클래스를 빈(bean)이라고 하고, @Controller 클래스를 사용하면 된다.
@Controller
public class AdminController {
	@RequestMapping(value="/admin/board/board_list", method=RequestMethod.GET)
	public String board_list() {
		
		return "admin/board/board_list"; 
	}
	// 메소드 오버로딩(ex. 동영상 로딩중.., 로딩된 매개변수가 다르면, 메소드 이름 중복가능하다.)
	@RequestMapping(value="/admin/member/member_write", method=RequestMethod.POST)
	public String member_write(@RequestParam("user_name") String user_name) {
		// 아래 GET방식의 폼 출력화면에서 데이터 전송받은 내용을 처리하는 바인딩
		// DB 입력/출력/삭제/수정 처리
		return "redirect:/admin/member/member_list";//절대경로로 처리된 이후에 이동할 URL주소 입력
	}
	
	@RequestMapping(value="/admin/member/member_write", method=RequestMethod.GET)
	public String member_write() {
		return "admin/member/member_write";
	}
	
	//member_list.jsp에서 받은 데이터를 수신하는 역할  @RequestParam("키값") 리퀘스트파라미터 클래스 사용
	//현재 컨트롤러 클래스에서 member_view.jsp로 데이터를 보내는 역할, Model 클래스 사용
	//자료 흐름 : member_list.jsp -> (@RequestParam("user_id")-수신, Model-송신 -> member_view.jsp
	@RequestMapping(value="/admin/member/member_view", method=RequestMethod.GET)
	public String member_view(@RequestParam("user_id") String user_ID, Model model ) {
		//member_list.jsp에서 받은 "user_id"를 user_ID에 저장한다. -> user_ID값을 user_id2에 넣어서 출력.
		//위에서 수신한 user_id를 member_view.jsp로 보낸다(아래)
		model.addAttribute("user_id2", user_ID + "<script>alert('메롱');</script> 님");
		//member_view.jsp에서 model로부터 받은 데이터 user_id2를 출력하는 방법-점심이후
		return "admin/member/member_view";	
	}
	
	@RequestMapping(value="/admin/member/member_list", method=RequestMethod.GET)
	public String member_list(Model model) {
		String[][] members = {
				{"admin", "관리자", "admin@abc.com", "true", "2020-12-02", "ROLE_ADMIN"},
				{"user", "사용자", "user@abc.com", "false", "2020-12-04", "ROLE_USER"}
		};
		//{"user_id":"admin", "user_name":"관리자", ...} // #해시 데이터
		model.addAttribute("memberss", members);
		return "admin/member/member_list";//member_list.jsp로 members 변수명으로 데이터를 전송
	}
	
	//bind:묶는다는 의미, /admin 요청경로와 admin/home.jsp를 묶는다.
	@RequestMapping(value="/admin",method=RequestMethod.GET)
	public String admin() {
		return "admin/home";
	}
}
