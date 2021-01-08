package org.edu.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

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
	
	//사용자 홈페이지 접근 매핑
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String home() throws Exception {
		return "home/home"; 
	}
	/**
	 * Simply selects the home view to render by returning its name.
	 * 루트 / 라는 이름으로 요청받으면, home.jsp파일에 화면출력(렌더링)이 된다. (아래)
	 * HomeController.java를 저장하면, 이클립스에서는 HomeController.class 실행가능한 파일 새엇ㅇ
	 * 그래서 저장 시 콘솔에 보면, Reloading Context with...is completed 재실행되었다고 나온다.
	 * 그래서 .java 클래스는 수정 후 약간 기다린 후 Reloading... 메시지 후 결과 확인 가능하다.
	 */
	@RequestMapping(value="/sample/contact", method=RequestMethod.POST)//POST방식은 데이터를 전송하는 역할
	public String contact_send() {
		//데이터 전송 후 에 다른 페이지로 이동이 필요하다. 새로고침(자동등록)을 방지하기 위해서, 게시판 테러 방지용
		return "redirect:/sample/blog"; // URL경로 사용
		
	}
	
	@RequestMapping(value="/sample/contact", method=RequestMethod.GET)//GET방식은 홈페이지를 보여주는 역할
	public String contact() {
		return "sample/contact";
	}
	@RequestMapping(value="/sample/blog", method=RequestMethod.GET)
	public String blog() {
		return "sample/blog";
	}
	@RequestMapping(value="/sample/work", method=RequestMethod.GET)
	public String work() {
		return "sample/work";
	}
	@RequestMapping(value="/sample/weare", method=RequestMethod.GET)
	public String weare() {
		// 외부에서 /booking 경로로 접근했을 때, sample/booking.jsp와 매핑시키라는 의미.
		return "sample/weare";
	}
	@RequestMapping(value="/sample", method=RequestMethod.GET) // 여기가 절대경로
	public String index() {// 메소드(함수)의 리턴(출력)형태지정(String) 메소드명(index)() {구현내용}
		// 상단 리퀘스트매핑에서 지정한 경로로 접근하게 되면, 아래에 있는 index() 메소드를 실행해라.
		// 메소드명 제일 앞에 있는 public는 접근권한에 대한 키워드인데, 
		// public(공공-다른 클래스에서 접근 가능), private(내부-현재 HomeController클래스에서만 접근 가능)
		// public String index(){} 자바(스프링) 메소드 기본 형태
		// $(document).ready(function(){});  jquery 기본형태
		// 리턴반환값으로 사용한 String클래스는 문자열을 반환하고, 여기서는 indedx.jsp와 매칭되는 문자열 반환. 상대경로 필요
		// 스프링MVC프로젝트에서 상대경로의 최상위는 views폴더. 최상위root폴더=views폴더
		// 접두사(prefix), 접미사(suffix) index(접두사-파일명).jsp(접미사-확장자)
		return "sample/index"; //접두사만 반환값으로 넣는다.
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
