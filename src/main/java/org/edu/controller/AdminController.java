package org.edu.controller;

import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.edu.service.IF_MemberService;
import org.edu.util.SecurityCode;
import org.edu.vo.BoardVO;
import org.edu.vo.MemberVO;
import org.edu.vo.PageVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

// 스프링에서 사용가능한 클래스를 빈(bean)이라고 하고, @Controller 클래스를 사용하면 된다.
@Controller
public class AdminController {
	//@inject방식으로 외부 라이브러리(모듈, 클래스, 인스턴스) 가져와쓰기(아래)
	@Inject
	SecurityCode securityCode;
	
	@Inject
	IF_MemberService memberService; //멤버인터페이스를 주입받아서 memberService 오브젝트변수 생성
	
	@RequestMapping(value="/admin/board/board_write", method=RequestMethod.GET) //url경로
	public String board_write () throws Exception {
		return "admin/board/board_write";//파일경로
	}
	@RequestMapping(value="/admin/board/board_write", method=RequestMethod.POST)
	public String board_write(MultipartFile file, BoardVO boardVO) throws Exception {
		//POST로 받은 boardVO내용을 DB서비스에 입력하면 된다.
		//DB에 입력 후 새로고침 명령으로 게시물테러를 당하지 않으려면 redirect로 이동 처리한다.(아래)
		return "redirect:/admin/board/board_list";
	}
	@RequestMapping(value="/admin/board/board_view", method=RequestMethod.GET)
	public String board_view(@RequestParam("bno") Integer bno, Model model) throws Exception {
		//jsp로 보낼 더미데이터 memberVO에 담아서 보낸다.
		// 실제로는 아래처럼 더미데이터를 만드는 것이 아닌, 쿼리스트링(질의문자열)로 받아온 bno(게시물고유번호)를 이용해서
		// DB에서  SELECT * FROM tbl_board WHERE bno=? 실행이 된 결과값을 BoardVO형으로 받아서 jsp로 보내줌
		BoardVO boardVO = new BoardVO();
		boardVO.setBno(1);
		boardVO.setTitle("첫번째 게시물입니다.");
		String xss_data="첫번째 내용입니다.<br>줄바꿈 자리입니다.<script>alert('메롱')</script>";
		boardVO.setContent(securityCode.unscript(xss_data));
		boardVO.setWriter("admin");
		Date regdate = new Date();
		boardVO.setRegdate(regdate);
		boardVO.setView_count(2);
		boardVO.setReply_count(0);
		model.addAttribute("boardVO", boardVO);
		return "admin/board/board_view";
	}
	@RequestMapping(value="/admin/board/board_list", method=RequestMethod.GET)
	public String board_list(Model model) throws Exception {
		
		//테스트용 더미 게시판 데이터 만들기
		BoardVO board_input = new BoardVO();
		board_input.setBno(1);
		board_input.setTitle("첫번째 게시물입니다.");
		board_input.setContent("첫번째 게시물 내용입니다.<br>줄바꿈했습니다.");
		board_input.setWriter("admin");
		Date regdate = new Date();
		board_input.setRegdate(regdate);
		board_input.setView_count(2);
		board_input.setReply_count(0);
		
		BoardVO[] board_array = new BoardVO[2];
		board_array[0] = board_input;
		// ----------------------------------------------
		BoardVO board_input2 = new BoardVO();
		board_input2.setBno(2);
		board_input2.setTitle("두번째 게시물입니다.");
		board_input2.setContent("두번째 게시물 내용입니다.<br>줄바꿈했습니다.");
		board_input2.setWriter("user02");
		board_input2.setRegdate(regdate);
		board_input2.setView_count(2);
		board_input2.setReply_count(0);
		// board_input.setBno(2); // 게시물번호만 2로 변경, 나머지값들은 변경없이 board_array[1]에 저장
		board_array[1] = board_input2;
	
		List<BoardVO> board_list = Arrays.asList(board_array); //배열타입을 List타입으로 변경 절차.
		model.addAttribute("board_list", board_list);
		
		return "admin/board/board_list"; 
	}
	
//==============================================================================================================================
	
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
	public String member_list(@ModelAttribute("pageVO") PageVO pageVO, Model model) throws Exception {
		//고전적인 방식의 검색
		//@RequestParam(value="search_type", required=false) String search_type, @RequestParam(value="search_keyword", required=false) String search_keyword
		// member_list(첫번재 파라미터, 두번째파라미터, jsp로 보낼때)
		/*
		 * String[][] members = { {"admin", "관리자", "admin@abc.com", "true",
		 * "2020-12-02", "ROLE_ADMIN"}, {"user", "사용자", "user@abc.com", "false",
		 * "2020-12-04", "ROLE_USER"} }; //{"user_id":"admin", "user_name":"관리자", ...}
		 * #해시 데이터 타입<키(key), 값(value)>(그물-낚시) // Map타입이 부모, HashMap타입이 자식 클래스, 관례적으로
		 * 사용. paramMap오브제트를 확장하기 편하도록 // Map타입을 상속받아서, HashMap타입의 오브젝트를 생성하는 방식
		 * Map<String,Object> paramMap = new HashMap<String, Object>();
		 * paramMap.put("user_id", "admin"); paramMap.put("user_name", "관리자");
		 * paramMap.put("email", "admin@abc.com"); paramMap.put("age",40);
		 * System.out.println("해시데이터타입 출력 " + paramMap);
		 * 
		 * 
		 * //members 2차원 배열 변수를 MemberVO 클래스형 오브젝트 members_input로 변경(아래) MemberVO
		 * members_input = new MemberVO(); members_input.setUser_id("admin");
		 * members_input.setUser_name("관리자"); members_input.setEmail("admin@abc.com");
		 * members_input.setEnabled(true);//enabled 데이터형(타입)이 boolean형이기 때문에 true, false
		 * Date toDay = new Date();//자바의 Date클래스를 이요해서 현재 날짜(시간)를 가진 toDay 변수 생성
		 * members_input.setReg_date(toDay);//reg_date 데이터타입이 Date형이기 때문에 java의 날짜 데이터
		 * 입력 members_input.setLevels("ROLE_ADMIN"); members_input.setPoint(10);//point
		 * 데이터타입이 Integer형이기 때문에 숫자 입력
		 * 
		 * // 위 membes_input 오브젝트는 1개의 라인(레코드)만 입력되어 있어서, 이 오브젝트를 배열오브젝트에 저장(아래)
		 * MemberVO[] members_array = new MemberVO[2]; // 클래스형 배열 오브젝트 생성
		 * members_array[0]=members_input; members_array[1]=members_input;
		 * 
		 * //---------------------------------------------------------------------------
		 * --
		 * 
		 * //실제 코딩에서는 배열타입으로 보내지 않고, List타입(목록)으로 model이용해서 jsp로 보낸다. List<MemberVO>
		 * members_list = Arrays.asList(members_array); //위에서 만든 members_arrya배열오브젝트를
		 * Arrays.asList메소드로 리스트타입으로 변경 //위에서 데이터타입연습으로 총 3가지 데이터타입 확인했음.
		 * System.out.println("List타입의 오브젝트 클래스 내용을 출력 " + members_list.toString());
		 */
		List<MemberVO> members_list = memberService.selectMember(pageVO);
		model.addAttribute("memberss", members_list);//members 2차원 배열을 members_array 클래스 오브젝트로 변경
		// null/10 => 에러처리
		if(pageVO.getPage()==null) { // int일때 null체크 에러가 나서, pageVO의 page변수형을 Integer로 변경
			pageVO.setPage(1);
		}
		pageVO.setPerPageNum(5); // 페이지 리스트 단위 5페이지씩 
		pageVO.setPerQueryPageNum(10); //한페이지당 보여줄 회원 수 10명
		pageVO.setTotalCount(110); //전체 회원 수를 구한 변수값을 매개변수로 입력
		//전체 회원 수 입력하는 순간 calcpage()메소드 실행.
		model.addAttribute("pageVO", pageVO);
		return "admin/member/member_list";//member_list.jsp로 members 변수명으로 데이터를 전송
	}
	
	//bind:묶는다는 의미, /admin 요청경로와 admin/home.jsp를 묶는다.
	@RequestMapping(value="/admin",method=RequestMethod.GET)
	public String admin() throws Exception {
		return "admin/home";
	}
}
