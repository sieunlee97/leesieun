package org.edu.controller;

import java.io.File;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.edu.dao.IF_BoardDAO;
import org.edu.service.IF_BoardService;
import org.edu.service.IF_MemberService;
import org.edu.util.CommonController;
import org.edu.util.SecurityCode;
import org.edu.vo.AttachVO;
import org.edu.vo.BoardVO;
import org.edu.vo.MemberVO;
import org.edu.vo.PageVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * Handles requests for the application home page.
 * 앱을 위한 홈페이지 요청(request)을 처리한다(아래).
 * http://localhost:8080/ 요청을 받았을 때, 변수를 만들어서 크롬화면 또는 콘솔에 뿌려준다.
 */
@Controller
public class HomeController {
	//private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Inject
	private IF_BoardService boardService;
	
	@Inject
	private IF_MemberService memberService;
	
	@Inject
	private IF_BoardDAO boardDAO;
	
	@Inject
	private SecurityCode securityCode;
	
	@Inject
	private CommonController commonController;
	
	//전역 홈페이지에서 스프링 진입 전에 발생하는 에러의 페이지 처리
	@RequestMapping(value="/home/error/404", method=RequestMethod.GET)
	public String error404() throws Exception {
		return "home/error/404";
	}
	
	@RequestMapping(value="/home/board/board_delete", method=RequestMethod.POST)
	public String board_delete(RedirectAttributes rdat, @RequestParam("bno") Integer bno, @RequestParam("page") Integer page) throws Exception {
		//부모 게시판에 참부파일이 있다면 첨부파일 삭제 처리 후 게시글 삭제(아래)
		List<AttachVO> delFiles = boardService.readAttach(bno);
		if(!delFiles.isEmpty()) {
			for(AttachVO file_name : delFiles) {
				File target = new File(commonController.getUploadPath(), file_name.getSave_file_name());
				if(target.exists()) {
					target.delete(); //실제파일 지우기
				}
			}
		}
		//DB에서 부모 게시판에 댓글이 있다면 댓글 삭제 처리 후 게시글 삭제 처리(아래)
		boardService.deleteBoard(bno);
		rdat.addFlashAttribute("msg", "삭제");
		return "redirect:/home/board/board_list?page="+page;
	}
	
	//사용자 홈페이지 게시판 뷰 매핑
	@RequestMapping(value="/home/board/board_view", method=RequestMethod.GET)
	public String board_view(@RequestParam("bno") Integer bno, @ModelAttribute("pageVO") PageVO pageVO, Model model) throws Exception {
		BoardVO boardVO = boardService.readBoard(bno);
		//내용에 대한 시큐어코딩(아래)
		String xssData = securityCode.unscript(boardVO.getContent());
		boardVO.setContent(xssData); //악성코드 제거한 결과를 다시 셋 저장
//===============================================================			
		//첨부파일 데이터 jsp 뷰단으로 보내기(아래)
		List<AttachVO> files = boardService.readAttach(bno);
		String[] save_file_names = new String[files.size()];
		String[] real_file_names = new String[files.size()];
		int cnt=0;
		for(AttachVO filename:files) {
			save_file_names[cnt] = filename.getSave_file_name();
			real_file_names[cnt] = filename.getReal_file_name();
			cnt=cnt+1;
		}
		boardVO.setSave_file_names(save_file_names);
		boardVO.setReal_file_names(real_file_names);
//===============================================================	
		model.addAttribute("boardVO", boardVO);
		
		//업로드한 내용이 이미지인지 일반문서인지 구분하는 역할을 jsp로 보낸다.
		model.addAttribute("checkImgArray", commonController.getCheckImgArray());
		return "home/board/board_view";
	}
	@RequestMapping(value="/home/board/board_update", method=RequestMethod.POST)
	public String board_update(RedirectAttributes rdat, @RequestParam("file") MultipartFile[] files, BoardVO boardVO, PageVO pageVO) throws Exception {
		//첨부파일 업로드
		List<AttachVO> delFiles = boardService.readAttach(boardVO.getBno());
		String[] save_file_names = new String[files.length];
		String[] real_file_names = new String[files.length];
		int index = 0;
		for(MultipartFile file:files) { // 여기의 file은 신규로 저장하는 파일 
			if(file.getOriginalFilename() !="") {
				int sun=0;
				for(AttachVO file_name:delFiles) { //실제 폴더에서 기존 첨부파일 삭제처리
					if(index==sun) {
						File target = new File(commonController.getUploadPath(), file_name.getSave_file_name()); //삭제할 파일 경로
						if(target.exists()) {
							target.delete(); //폴더에서 기존 첨부파일 지우기
							boardDAO.deleteAttach(file_name.getSave_file_name()); //DB에서 기존 첨부파일 지우기
						}
					}
					sun=sun+1;
				}	
				//신규파일 폴더에 업로드 처리
				save_file_names[index] = commonController.fileUpload(file); //신규 팡리 폴더에 업로드
				real_file_names[index] = file.getOriginalFilename(); //신규 파일 한글 파일명 저장
			}else {
				save_file_names[index]=null;
				real_file_names[index]=null;
			}
			index = index+1;
		}
		//게시판 테이블 업데이트 + 첨부파일 테이블 업데이트
		boardVO.setSave_file_names(save_file_names);
		boardVO.setReal_file_names(real_file_names);
		
		//시큐어코딩 촉가(아래)
		String xssData = boardVO.getContent();
		boardVO.setContent(securityCode.unscript(xssData));
				
		boardService.updateBoard(boardVO);
		rdat.addFlashAttribute("msg", "수정");
	
		return "redirect:/home/board/board_view?bno="+boardVO.getBno()+"&page="+pageVO.getPage();
	}
		
	@RequestMapping(value="/home/board/board_update", method=RequestMethod.GET)
	public String board_update(Model model, @ModelAttribute("pageVO") PageVO pageVO, @RequestParam("bno") Integer bno) throws Exception {
		BoardVO boardVO = boardService.readBoard(bno);
		//첨부파일 처리(아래)
		List<AttachVO> files = boardService.readAttach(bno);
		//아래 변수는 List<AttachVO> 세로배치를 가로배치로 변경할 때 필요
		String[] save_file_names = new String[files.size()];
		String[] real_file_names = new String[files.size()];
		int cnt = 0;
		//세로 데이터를 가로 데이터로 변경하는 로직
		for(AttachVO file_name:files) {
			save_file_names[cnt] = file_name.getSave_file_name();
			real_file_names[cnt] = file_name.getReal_file_name();
			cnt = cnt+1;
		}
		
		boardVO.setSave_file_names(save_file_names);
		boardVO.setReal_file_names(real_file_names);
		
		
		model.addAttribute("boardVO", boardVO);
		return "home/board/board_update";
	}
	//사용자 홈페이지 게시판 쓰기 매핑(POST), 오버로드 메소드 이용
	//jsp에서 board_write메소드를 호출 -> 호출할 때 폼의 필드값을 컨트롤러로 보낸다.
	//컨트롤러에서 받을 때 사용하는 매개변수 - BoardVO boardVO 
	//위에서 받은 boardVO를 DAO에서 받아서 DB테이블에 쿼리로 입력한다.
	@RequestMapping(value="/home/board/board_write", method=RequestMethod.POST)
	public String board_write( RedirectAttributes rdat, @RequestParam("file") MultipartFile[] files, BoardVO boardVO) throws Exception {
		//위에서 받은 boardVO를 서비스로 보내기
		//첨부파일 저장할 배열 변수 선언
		String[] save_file_names = new String[files.length];
		String[] real_file_names = new String[files.length];
		int index = 0;
		for(MultipartFile file:files) {
			if(file.getOriginalFilename() != "") {
				save_file_names[index] = commonController.fileUpload(file); // UUID 고유값
				real_file_names[index] = file.getOriginalFilename(); //진짜 파일명
			}
			index=index+1;
		}
		boardVO.setSave_file_names(save_file_names);
		boardVO.setReal_file_names(real_file_names);
		
		//보안코딩으로 script 제거(아래)
		String xssData =  boardVO.getContent();
		boardVO.setContent(securityCode.unscript(xssData));

		
		boardService.insertBoard(boardVO); //실제 DB에 insert
		rdat.addFlashAttribute("msg", "저장");
		
		return "redirect:/home/board/board_list";
	}
	
	//사용자 홈페이지 게시판 쓰기 매핑(GET)
	@RequestMapping(value="/home/board/board_write", method=RequestMethod.GET)
	public String board_write() throws Exception {
		return "home/board/board_write";
	}
	
	//사용자 홈페이지 게시판 리스트 매핑
	@RequestMapping(value="/home/board/board_list", method=RequestMethod.GET)
	public String board_list(@ModelAttribute("pageVO") PageVO pageVO, Model model) throws Exception {
		//페이징 처리 추가(아래)
		if(pageVO.getPage() == null) {
			pageVO.setPage(1);
		}
		pageVO.setQueryPerPageNum(10);
		pageVO.setPerPageNum(5);
		int totalCount = boardService.countBoard(pageVO); //페이징의 게시물 전체 개수 구하기
		pageVO.setTotalCount(totalCount);
		List<BoardVO> board_list = boardService.selectBoard(pageVO);
		model.addAttribute("board_list", board_list);
		return "home/board/board_list";
	}
	//사용자 홈페이지 회원 마이페이지 수정 매핑
	@RequestMapping(value="/member/mypage_update", method=RequestMethod.POST)
	public String mypage_update(HttpServletRequest request, MemberVO memberVO, RedirectAttributes rdat) throws Exception {
		//스프링 시큐리티에서 제공하는 passwordEncoder 암호화 처리(아래)
		if(memberVO.getUser_pw() != "") {
			BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
			String user_pw_encode = passwordEncoder.encode(memberVO.getUser_pw());
			memberVO.setUser_pw(user_pw_encode);
		}
		memberService.updateMember(memberVO);
		HttpSession session = request.getSession();
		session.setAttribute("session_username", memberVO.getUser_name()); //세션 재발생
		rdat.addFlashAttribute("msg", "회원 수정");
		return "redirect:/member/mypage";
	}
	
	//사용자 홈페이지 회원 마이페이지 접근 매핑
	@RequestMapping(value="/member/mypage", method=RequestMethod.GET)
	public String mypage(HttpServletRequest request, Model model) throws Exception {
		//마이페이지는 로그인 상태만 접근 가능하기 때문에, 로그인 세션변수를 로그인아이디 변수 session_userid
		HttpSession session = request.getSession();
		MemberVO memberVO = memberService.readMember((String)session.getAttribute("session_userid"));
		model.addAttribute("memberVO", memberVO);
		return "home/member/mypage";
	}
	//사용자 홈페이지 회원 탈퇴 접근 매핑
	@RequestMapping(value="/member/member_disabled", method=RequestMethod.POST)
	public String member_disabled(HttpServletRequest request, MemberVO memberVO,RedirectAttributes rdat) throws Exception {
		memberService.updateMember(memberVO);
		//세션값 invalidate() 삭제하기.
		request.getSession().invalidate();
		rdat.addFlashAttribute("msg", "회원 탈퇴");
		return "redirect:/" ;
	}
	//사용자 홈페이지 회원가입 처리 매핑
	@RequestMapping(value="/join",method=RequestMethod.POST)
	public String join(MemberVO memberVO, RedirectAttributes rdat) throws Exception {
		//아래 3줄이 스프링 시큐리티에서 제공하는 패스워드암호화 처리 
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String user_pw_encode = passwordEncoder.encode(memberVO.getUser_pw());
		memberVO.setUser_pw(user_pw_encode);

		memberService.insertMember(memberVO);
		System.out.println("디버그"+memberVO.toString());
		rdat.addFlashAttribute("msg", "회원가입");
		return "redirect:/login";
	}
	
	//사용자 홈페이지 회원가입 접근 매핑
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String join() throws Exception {
		return "home/join";
	}
	
	//사용자 홈페이지 접근 매핑
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String home(Model model) throws Exception {
		PageVO pageVO = new PageVO();
		pageVO.setPage(1);
		pageVO.setPerPageNum(5);
		pageVO.setQueryPerPageNum(5);
		
		//사용자홈 메인페이지에 출력할 게시판 지정. gallery / 쿼리 1
		pageVO.setBoard_type("gallery");		
		List<BoardVO> gallery_list = boardService.selectBoard(pageVO);
		
		//사용자홈 메인페이지 출력할 게시판 지정. notice / 쿼리 2
		pageVO.setBoard_type("notice");
		List<BoardVO> notice_list = boardService.selectBoard(pageVO);
		
		//System.out.println("디버그 "+board_list);
		model.addAttribute("gallery_list", gallery_list);
		model.addAttribute("notice_list", notice_list);
		
		//첨부파일 1개만 model클래스를 이용해서 home.jsp로 보낸다.
		String[] save_file_names = new String[gallery_list.size()];
		int cnt=0;
		for(BoardVO boardVO:gallery_list) {
			List<AttachVO> file_list = boardService.readAttach(boardVO.getBno());
			if(file_list.size() ==0) {	//첨부파일이 없을 때
				save_file_names[cnt] = "";
				System.out.println("디버그 ["+cnt+"] "+save_file_names[cnt]);
			}
			else {						//첨부파일이 있을 때
				for(AttachVO file_name : file_list) {
					String save_file_name = file_name.getSave_file_name();
					String extName = FilenameUtils.getExtension(save_file_name); 
					boolean imgCheck = commonController.getCheckImgArray().contains(extName.toLowerCase());
					
					if(imgCheck) { 		//첨부파일이 이미지일때
						save_file_names[cnt] = save_file_name;
						System.out.println("디버그 ["+cnt+"] "+save_file_names[cnt]);
						break;
					}
					else { 				//첨부파일이 있지만, 이미지파일이 아닐때
						save_file_names[cnt] = "";
						System.out.println("디버그 ["+cnt+"] "+save_file_names[cnt]);
					}
				}
			}
			cnt=cnt+1;
		}
		model.addAttribute("save_file_names", save_file_names);
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
