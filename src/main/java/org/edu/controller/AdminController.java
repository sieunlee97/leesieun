package org.edu.controller;

import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.edu.vo.MemberVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

// 스프링에서 사용가능한 클래스를 빈(bean)이라고 하고, @Controller 클래스를 사용하면 된다.
@Controller
public class AdminController {
	@RequestMapping(value="/admin/board/board_list", method=RequestMethod.GET)
	public String board_list() throws Exception {
	
		return "admin/board/board_list"; 
	}
	// 메소드 오버로딩(ex. 동영상 로딩중.., 로딩된 매개변수가 다르면, 메소드 이름 중복가능하다. 대표적인 다형성 구현)
	@RequestMapping(value="/admin/member/member_write", method=RequestMethod.POST)
	public String member_write(@RequestParam("user_name") String user_name) throws Exception{
		// 아래 GET방식의 폼 출력화면에서 데이터 전송받은 내용을 처리하는 바인딩
		// DB 입력/출력/삭제/수정 처리
		return "redirect:/admin/member/member_list";//절대경로로 처리된 이후에 이동할 URL주소 입력
	}
	
	@RequestMapping(value="/admin/member/member_write", method=RequestMethod.GET)
	public String member_write() throws Exception {
		return "admin/member/member_write";
	}
	
	//member_list.jsp에서 받은 데이터를 수신하는 역할  @RequestParam("키값") 리퀘스트파라미터 클래스 사용
	//현재 컨트롤러 클래스에서 member_view.jsp로 데이터를 보내는 역할, Model 클래스 사용
	//자료 흐름 : member_list.jsp -> (@RequestParam("user_id")-수신, Model-송신 -> member_view.jsp
	@RequestMapping(value="/admin/member/member_view", method=RequestMethod.GET)
	public String member_view(@RequestParam("user_id") String user_ID, Model model ) throws Exception {
		//member_list.jsp에서 받은 "user_id"를 user_ID에 저장한다. -> user_ID값을 user_id2에 넣어서 출력.
		//위에서 수신한 user_id를 member_view.jsp로 보낸다(아래)
		model.addAttribute("user_id2", user_ID + "<script>alert('메롱');</script> 님");
		//member_view.jsp에서 model로부터 받은 데이터 user_id2를 출력하는 방법-점심이후
		return "admin/member/member_view";	
	}
	
	@RequestMapping(value="/admin/member/member_list", method=RequestMethod.GET)
	public String member_list(Model model) throws Exception {
		String[][] members = {
				{"admin", "관리자", "admin@abc.com", "true", "2020-12-02", "ROLE_ADMIN"},
				{"user", "사용자", "user@abc.com", "false", "2020-12-04", "ROLE_USER"}
		};
		//{"user_id":"admin", "user_name":"관리자", ...} #해시 데이터 타입<키(key), 값(value)>(그물-낚시)
		// Map타입이 부모, HashMap타입이 자식 클래스, 관례적으로 사용. paramMap오브제트를 확장하기 편하도록
		// Map타입을 상속받아서, HashMap타입의 오브젝트를 생성하는 방식
		Map<String,Object> paramMap = new HashMap<String, Object>();
		paramMap.put("user_id", "admin");
		paramMap.put("user_name", "관리자");
		paramMap.put("email", "admin@abc.com");
		paramMap.put("age",40);
		System.out.println("해시데이터타입 출력 " + paramMap);
		
		//members 2차원 배열 변수를 MemberVO 클래스형 오브젝트 members_input로 변경(아래)
		MemberVO members_input = new MemberVO();
		members_input.setUser_id("admin");
		members_input.setUser_name("관리자");
		members_input.setEmail("admin@abc.com");
		members_input.setEnabled(true);//enabled 데이터형(타입)이 boolean형이기 때문에 true, false
		Date toDay = new Date();//자바의 Date클래스를 이요해서 현재 날짜(시간)를 가진 toDay 변수 생성
		members_input.setReg_date(toDay);//reg_date 데이터타입이 Date형이기 때문에 java의 날짜 데이터 입력
		members_input.setLevels("ROLE_ADMIN");
		members_input.setPoint(10);//point 데이터타입이 Integer형이기 때문에 숫자 입력
		
		// 위 membes_input 오브젝트는 1개의 라인(레코드)만 입력되어 있어서, 이 오브젝트를 배열오브젝트에 저장(아래)
		MemberVO[] members_array = new MemberVO[2]; // 클래스형 배열 오브젝트 생성
		members_array[0]=members_input;
		members_array[1]=members_input;
		//-----------------------------------------------------------------------------
		//실제 코딩에서는 배열타입으로 보내지 않고, List타입(목록)으로 model이용해서 jsp로 보낸다.
		List<MemberVO> members_list = Arrays.asList(members_array);
		//위에서 만든 members_arrya배열오브젝트를 Arrays.asList메소드로 리스트타입으로 변경
		//위에서 데이터타입연습으로 총 3가지 데이터타입 확인했음.
		System.out.println("List타입의 오브젝트 클래스 내용을 출력 " + members_list.toString());
		model.addAttribute("memberss", members_list);//members 2차원 배열을 members_array 클래스 오브젝트로 변경
		return "admin/member/member_list";//member_list.jsp로 members 변수명으로 데이터를 전송
	}
	
	//bind:묶는다는 의미, /admin 요청경로와 admin/home.jsp를 묶는다.
	@RequestMapping(value="/admin",method=RequestMethod.GET)
	public String admin() throws Exception {
		return "admin/home";
	}
}
