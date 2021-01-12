package org.edu.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.edu.vo.BoardVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 * 앱을 위한 홈페이지 요청(request)을 처리한다(아래).
 * http://localhost:8080/ 요청을 받았을 때, 변수를 만들어서 크롬화면 또는 콘솔에 뿌려준다.
 */
@Controller
public class HomeController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	//전역 홈페이지에서 스프링 진입 전에 발생하는 에러의 페이지 처리
	@RequestMapping(value="/home/error/404", method=RequestMethod.GET)
	public String error404() throws Exception {
		return "home/error/404";
	}
	
	//사용자 홈페이지 게시판 뷰 매핑
	@RequestMapping(value="/home/board/board_view", method=RequestMethod.GET)
	public String board_view() throws Exception {
		return "home/board/board_view";
	}
	
	//사용자 홈페이지 게시판 쓰기 매핑(POST), 오버로드 메소드 이용
	//jsp에서 board_write메소드를 호출 -> 호출할 때 폼의 필드값을 컨트롤러로 보낸다.
	//컨트롤러에서 받을 때 사용하는 매개변수 - BoardVO boardVO 
	//위에서 받은 boardVO를 DAO에서 받아서 DB테이블에 쿼리로 입력한다.
	@RequestMapping(value="/home/board/board_write", method=RequestMethod.POST)
	public String board_write(BoardVO boardVO) throws Exception {
		return "redirect:/home/board/board_view";
	}
	//사용자 홈페이지 게시판 쓰기 매핑(GET)
	@RequestMapping(value="/home/board/board_write", method=RequestMethod.GET)
	public String board_write() throws Exception {
		return "home/board/board_write";
	}
	
	//사용자 홈페이지 게시판 리스트 매핑
	@RequestMapping(value="/home/board/board_list", method=RequestMethod.GET)
	public String board_list() throws Exception {
		return "home/board/board_list";
	}
	//사용자 홈페이지 회원 마이페이지 접근 매핑
	@RequestMapping(value="/member/mypage", method=RequestMethod.GET)
	public String mypage() throws Exception {
		return "home/member/mypage";
	}
	//사용자 홈페이지 회원가입 접근 매핑
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String join() throws Exception {
		return "home/join";
	}
	
	//사용자 홈페이지 접근 매핑
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String home() throws Exception {
		return "home/home"; 
	}
	
	/*@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("개발자들이 변수값 확인으로 사용하는 것이 로그이다. 현재 여러분 컴퓨터 언어는 {} 입니다.", locale);
		logger.info("환영합니다. 현재 여러분의 컴퓨터 언어는 " + locale + " 입니다.");
		System.out.println("위에 Locale 클래스를 사용하는 이유는 다국어 지원때문에 변수로 사용하게 된다.");
		System.out.println("함수-C언어나 자바스크립트-와 메서드-자바,스프링에서 사용함-는 같은 대상을 가리킨다.");
		System.out.println("함수-메서드는 함수명(매개변수-입력값){구현내용}형식이고, 입력값->출력값 구현된다.");
		Date date = new Date(); // Date 날짜 관련 클래스형 변수 date 선언. date변수 메서드를 사용가능하게 됨.
		// date 변수는 실행가능한 변수 = 클래스형 변수 = Object = 인스턴스 (위)
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		// DateFormat 클래스형 변수 dateFormat이 선언되었고, 실행가능한 변수로 됨.(위)
		String formattedDate = dateFormat.format(date); // 변수가 실행됨.
		// 위 변수가 실행되어서 출력된 결과값이 String 클래스형 변수 formattedDate변수에 담기게 됨. (위)
		model.addAttribute("TomcatserverTime", formattedDate ); //serverTime 변수값으로 jsp파일로 이동.
		// model이라는 클래스형 변수를 이용해서 serverTime 변수값을 아래 home(.jsp)로 전송해줌.(위)
		System.out.println("현재 서버의 시간은 " + formattedDate + " 입니다.");
		return "home"; // 결과적으로 return 반환값이 home(.jsp)에 연동됨.
		// ★ 스프링에서 View단으로 데이터 이동(전송)에 대해서 살펴보았다.
	}*/
	
}
