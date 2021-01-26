package org.edu.controller;

import java.io.File;
import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.edu.dao.IF_BoardDAO;
import org.edu.service.IF_BoardService;
import org.edu.service.IF_BoardTypeService;
import org.edu.service.IF_MemberService;
import org.edu.util.CommonController;
import org.edu.util.SecurityCode;
import org.edu.vo.AttachVO;
import org.edu.vo.BoardTypeVO;
import org.edu.vo.BoardVO;
import org.edu.vo.MemberVO;
import org.edu.vo.PageVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

// 스프링에서 사용가능한 클래스를 빈(bean)이라고 하고, @Controller 클래스를 사용하면 된다.
@Controller
public class AdminController {
	//@inject방식으로 외부 라이브러리(모듈, 클래스, 인스턴스) 가져와쓰기(아래)
	@Inject
	CommonController commonController;
	
	@Inject
	SecurityCode securityCode;
	
	@Inject
	IF_BoardService boardService; //게시판인터페이스를 주입받아서 boardService 오브젝트변수 생성
	
	@Inject
	IF_BoardDAO boardDAO;
	
	@Inject
	IF_MemberService memberService; //멤버인터페이스를 주입받아서 memberService 오브젝트변수 생성
	
	@Inject
	private IF_BoardTypeService boardTypeService;
	
	//게시판 타입 삭제 매핑(POST)
	@RequestMapping(value="/admin/bbs_type/bbs_type_delete", method=RequestMethod.POST)
	public String bbs_type_delete(RedirectAttributes rdat, BoardTypeVO boardTypeVO)throws Exception {
		String board_type = boardTypeVO.getBoard_type();
		PageVO pageVO = new PageVO();
		pageVO.setBoard_type(board_type);
		int board_count = boardService.countBoard(pageVO);
		if(board_count > 0) {
			rdat.addFlashAttribute("msg_fail", "해당 타입의 게시물이 존재합니다. 삭제");
			return "redirect:/admin/bbs_type/bbs_type_update?board_type="+board_type;
		}else {
			boardTypeService.delete_board_type(board_type);
			rdat.addFlashAttribute("msg", "삭제");
		}
		
		return "redirect:/admin/bbs_type/bbs_type_list";
	}
	
	//게시판 타입 신규 등록 매핑(POST)
	@RequestMapping(value="/admin/bbs_type/bbs_type_write", method=RequestMethod.POST)
	public String bbs_type_write(RedirectAttributes rdat, BoardTypeVO boardTypeVO) throws Exception {
		boardTypeService.insert_board_type(boardTypeVO);
		rdat.addFlashAttribute("msg", "등록");
		return "redirect:/admin/bbs_type/bbs_type_list";
	}
	
	//게시판 타입 신규 등록 매핑(GET)
	@RequestMapping(value="/admin/bbs_type/bbs_type_write", method=RequestMethod.GET)
	public String bbs_type_write() throws Exception {
		return "admin/bbs_type/bbs_type_write";
	}
	
	
	//게시판 타입 수정 매핑(POST)
	@RequestMapping(value="/admin/bbs_type/bbs_type_update", method=RequestMethod.POST)
	public String bbs_type_update(BoardTypeVO boardTypeVO, RedirectAttributes rdat) throws Exception {
		boardTypeService.update_board_type(boardTypeVO);
		rdat.addFlashAttribute("msg", "수정");
		return "redirect:/admin/bbs_type/bbs_type_update?board_type="+ boardTypeVO.getBoard_type();
	}
	
	//게시판 타입 수정 매핑(GET)
	@RequestMapping(value="/admin/bbs_type/bbs_type_update", method=RequestMethod.GET)
	public String bbs_type_update(@RequestParam("board_type") String board_type, Model model ) throws Exception {
		BoardTypeVO boardTypeVO = boardTypeService.view_board_type(board_type);
		model.addAttribute("boardTypeVO", boardTypeVO);
		return "admin/bbs_type/bbs_type_update";
	}
	//게시판 타입 리스트 매핑
	@RequestMapping(value="/admin/bbs_type/bbs_type_list", method=RequestMethod.GET)
	public String bbs_type_list() throws Exception{
		//여기는 model을 이용해서 jsp로 board_type_list오브젝트를 보낼 필요 없음.
		//-> ControllerAdvice클래스에서 만들었기 때문에.
		return "admin/bbs_type/bbs_type_list";
	}
//==============================================================================================================================
	
	@RequestMapping(value="/admin/board/board_update", method=RequestMethod.GET)
	public String board_update(@RequestParam("bno") Integer bno, @ModelAttribute("pageVO") PageVO pageVO, Model model) throws Exception {
		BoardVO boardVO = boardService.readBoard(bno);
		List<AttachVO> files = boardService.readAttach(bno);
	  //List<HashMap<String, Object>> files_notUse = boardService.readAttach_notUse(bno); // 리스트형 변수 생성
		String[] save_file_names = new String[files.size()];
		String[] real_file_names = new String[files.size()];
		int cnt = 0;
		for(AttachVO file_name:files) {
			save_file_names[cnt]= file_name.getSave_file_name(); //HashMap형태의 save_file_name을 뽑아와서 String으로 형변환
			real_file_names[cnt]= file_name.getReal_file_name();
			cnt = cnt+1;
		}
	 /*
	  * for(HashMap<String, Object> file_name:files_notUse) {
	  * 	save_file_names[cnt]=(String) file_name.get("save_file_name"); //HashMap형태의 save_file_name을 뽑아와서 String으로 형변환 
	  * 	real_file_names[cnt]=(String)file_name.get("real_file_name"); 
	  * 	cnt = cnt+1; 
	  * }
	  */
		
		//배열형 출력값(가로) {'save_file_name1','save_file_name2',...}
		boardVO.setSave_file_names(save_file_names);
		boardVO.setReal_file_names(real_file_names);
		//시큐어코딩 적용(아래). jsp에서 c:out으로 처리
		/*
		 * String xxs_data= boardVO.getContent();
		 * boardVO.setContent(securityCode.unscript(xxs_data));
		 */
		model.addAttribute("boardVO", boardVO);
		//model.addAttribute("board_type_list", "게시판 타입 리스트 오브젝트");
		//게시판 타입 리스트는 위처럼 개별 메소드에서 처리하지 않고, ControllerAdvice클래스로 대체한다.
		return "admin/board/board_update";
	}
	
	@RequestMapping(value="/admin/board/board_update", method=RequestMethod.POST)
	public String board_update(RedirectAttributes rdat, @RequestParam("file") MultipartFile[] files, BoardVO boardVO, PageVO pageVO) throws Exception {
		// 기존등록된 첨부파일 목록 구하기
		List<AttachVO> delFiles = boardService.readAttach(boardVO.getBno());
	  //List<HashMap<String,Object>> delFiles_notUse = boardService.readAttach_notUse(boardVO.getBno());
		//jsp에 보낼 save_file_names, real_file_names 배열변수 초기값 지정
		String[] save_file_names = new String[files.length];
		String[] real_file_names = new String[files.length];
		int index=0; //아래 향상된 for문에서 사용할 인덱스값
		//첨부파일 수정 미처리. 추가 예정: 수정할 때 수정. 부모부터 수정 후 자식 수정.
		for(MultipartFile file:files) {
			if(file.getOriginalFilename() != "") { // 첨부파일 있는 경우

				int sun = 0; //업데이트 jsp화면에서 첨부파일을 개별 삭제시 사용할 순서가 필요하기 때문
				//기존 파일을 폴더에서 삭제 처리
				for(AttachVO file_name:delFiles) {
					if(index == sun) {//index는 첨부파일개수 , sun삭제할 개별순서
						File target = new File(commonController.getUploadPath(), file_name.getSave_file_name());
						if(target.exists()) {
							target.delete();//폴더에서 기존첨부파일 지우기
							//서비스클래스에는 첨부파일DB를 지우는 메서드가 없음. DAO를 접근해서 tbl_attach를 지웁니다.
							boardDAO.deleteAttach(file_name.getSave_file_name());
						}
					}	
					sun=sun+1;
				}
				//신규 파일 폴더에 업로드 처리
				save_file_names[index] = commonController.fileUpload(file); // 폴더에 업로드 저장 완료.
				real_file_names[index] = file.getOriginalFilename(); //"한글파일명.jpg"		
			}else {
				save_file_names[index]=null;
				real_file_names[index]=null;
			}
			index=index+1;
		}
		boardVO.setSave_file_names(save_file_names); //UUID로 생성된 유니크한 파일명
		boardVO.setReal_file_names(real_file_names); //실제 사용자가 저장한 한글파일명
		boardService.updateBoard(boardVO);
		rdat.addFlashAttribute("msg", "수정");
		return "redirect:/admin/board/board_view?page="+pageVO.getPage()+"&bno="+boardVO.getBno();
	}
	
	// GET은 URL전송방식(아무 브라우저 주소에 적으면 실행가능), POST는 폼 전송방식(해당페이지에서만 작동 가능)
	@RequestMapping(value="/admin/board/board_delete", method=RequestMethod.POST)
	public String board_delete(RedirectAttributes rdat, PageVO pageVO, @RequestParam("bno") Integer bno) throws Exception {
		// 기존 등록된 첨부파일 폴더에서 삭제할 UUID 파일명 구하기(아래)
		List<AttachVO> delFiles = boardService.readAttach(bno);
		//List<HashMap<String, Object>> delFiles_notUse = boardService.readAttach_notUse(bno);
		for(AttachVO file_name:delFiles) { //실제파일 삭제 로직(아래)
			//실제파일 삭제 로직(아래 File클래스(폴더경루, 파일명))
			File target = new File(commonController.getUploadPath(), file_name.getSave_file_name());
			if(target.exists()) {
				target.delete(); //실제 지워짐.
			}
		}
	 /*
	  * for(HashMap<String, Object> file_name:delFiles_notUse) { 
	  * 	//실제파일 삭제 로직(아래 File클래스(폴더경루, 파일명))
	  * 	File클래스(폴더경루, 파일명)) File target = new File(commonController.getUploadPath(), (String)file_name.get("save_file_name")); 
	  * 	if(target.exists()) {
	  * 		target.delete(); //실제 지워짐. 
	  * 	} 
	  * }
	  */
		boardService.deleteBoard(bno);
		// 첨부파일 삭제 : DB부터 먼저 삭제 후  폴더에서 첨부파일 삭제
		rdat.addFlashAttribute("msg", "삭제");
		return "redirect:/admin/board/board_list?page=" + pageVO.getPage();
	}
	
	@RequestMapping(value="/admin/board/board_write", method=RequestMethod.GET) //url경로
	public String board_write() throws Exception {
		return "admin/board/board_write";//파일경로
	}
	@RequestMapping(value="/admin/board/board_write", method=RequestMethod.POST)
	public String board_write(RedirectAttributes rdat, @RequestParam("file") MultipartFile[] files, BoardVO boardVO) throws Exception {
		//POST로 받은 boardVO내용을 DB서비스에 입력하면 된다.
		String[] save_file_names=new String[files.length];
		String[] real_file_names=new String[files.length];
		//첨부파일 존재 여부에 따른 저장 
		//첨부파일 없으면 게시물만 저장 , 첨부파일있으면 첨부파일 업로드 처리 후 게시물DB저장 + 첨부파일DB저장
		int index=0;
		for(MultipartFile file:files) {
			if(file.getOriginalFilename() != "") { // 첨부파일 있는 경우
				save_file_names[index] = commonController.fileUpload(file); // 폴더에 업로드 저장 완료.
				real_file_names[index] = file.getOriginalFilename(); //"한글파일명.jpg"				
			}
			index=index+1;
		}
		boardVO.setSave_file_names(save_file_names); //UUID로 생성된 유니크한 파일명
		boardVO.setReal_file_names(real_file_names); //실제 사용자가 저장한 한글파일명
		boardService.insertBoard(boardVO);
		rdat.addFlashAttribute("msg", "저장");
		//DB에 입력 후 새로고침 명령으로 게시물테러를 당하지 않으려면 redirect로 이동 처리한다.(아래)
		return "redirect:/admin/board/board_list";
	}
	@RequestMapping(value="/admin/board/board_view", method=RequestMethod.GET)
	public String board_view(@ModelAttribute("pageVO") PageVO pageVO, @RequestParam("bno") Integer bno, Model model) throws Exception {
		//jsp로 보낼 더미데이터 memberVO에 담아서 보낸다.
		// 실제로는 아래처럼 더미데이터를 만드는 것이 아닌, 쿼리스트링(질의문자열)로 받아온 bno(게시물고유번호)를 이용해서
		// DB에서  SELECT * FROM tbl_board WHERE bno=? 실행이 된 결과값을 BoardVO형으로 받아서 jsp로 보내줌
		/*
		 * BoardVO boardVO = new BoardVO(); boardVO.setBno(1);
		 * boardVO.setTitle("첫번째 게시물입니다."); String
		 * xss_data="첫번째 내용입니다.<br>줄바꿈 자리입니다.<script>alert('메롱')</script>";
		 * boardVO.setContent(securityCode.unscript(xss_data));
		 * boardVO.setWriter("admin"); Date reg_date = new Date();
		 * boardVO.setReg_date(reg_date); boardVO.setView_count(2);
		 * boardVO.setReply_count(0);
		 */
		BoardVO boardVO = boardService.readBoard(bno);
		//시큐어코딩 시작
		String xss_data = boardVO.getContent();
		boardVO.setContent(securityCode.unscript(xss_data));
		//시큐어코딩 끝
		//첨부파일 리스트 값을 가져와서 
		//세로데이터(jsp에서는 forEach문사용)를 가로데이터(jsp에서 배열사용)로 바꾸기
		// -> 첨부파일을 1개만 올리기 때문에 리스트형 데이터를 일반 배열로 변경
		// 리스트형 입력값(세로) [
		//	{'save_file_name1'},
		//	{'save_file_name2'},
		//	...
		// ]
		List<AttachVO> files = boardService.readAttach(bno);
	  //List<HashMap<String, Object>> files = boardService.readAttach_notUse(bno); // 리스트형 변수 생성
		String[] save_file_names = new String[files.size()];
		String[] real_file_names = new String[files.size()];
		int cnt = 0;
		for(AttachVO file_name:files) {
			save_file_names[cnt]=file_name.getSave_file_name(); //HashMap형태의 save_file_name을 뽑아와서 String으로 형변환
			real_file_names[cnt]=file_name.getReal_file_name();
			cnt = cnt+1;
		}
	 /*
	  * for(HashMap<String, Object> file_name:files_notUse) { save_file_names[cnt]=(String)
	  * file_name.get("save_file_name"); //HashMap형태의 save_file_name을 뽑아와서 String으로
	  * 형변환 real_file_names[cnt]= (String)file_name.get("real_file_name"); cnt =
	  * cnt+1; }
	  */
	
		//배열형 출력값(가로) {'save_file_name1','save_file_name2',...}
		boardVO.setSave_file_names(save_file_names);
		boardVO.setReal_file_names(real_file_names);
		//위처럼 첨부파일을 세로배치 ->가로배치 변환하고, get/set하는 이유는 attachVO를 만들지 않았기 때문이다.
		//만약 위처럼 복잡하게 세로배치->가로배치로 바꾸는 것이 이상하면, 아래처럼 처리
		//model.addAttribute("save_file_names", files);
		model.addAttribute("boardVO", boardVO);
		model.addAttribute("checkImgArray", commonController.getCheckImgArray());
		return "admin/board/board_view";
	}
	@RequestMapping(value="/admin/board/board_list", method=RequestMethod.GET)
	public String board_list(@ModelAttribute("pageVO") PageVO pageVO, Model model) throws Exception {
		
		//게시판 타입을 세션변수로 저장(아래)
		/* AOP기능으로 대체(아래)
		 HttpServletRequest request, 
		 @RequestParam(value="board_type", required=false) String board_type
		HttpSession session = request.getSession();
		if(board_type != null) {
			session.setAttribute("session_board_type", board_type);
		}
		// pageVO와 BoardVO에서 세션 변수로 get/set 하기 때문에 
	    if(session.getAttribute("session_board_type") != null ) { board_type =
	    (String) session.getAttribute("session_board_type");
	    pageVO.setBoard_type(board_type);//다중게시판 쿼리때문에 추가 }
	    }
		 */
		//테스트용 더미 게시판 데이터 만들기
		/*
		 * BoardVO board_input = new BoardVO(); board_input.setBno(1);
		 * board_input.setTitle("첫번째 게시물입니다.");
		 * board_input.setContent("첫번째 게시물 내용입니다.<br>줄바꿈했습니다.");
		 * board_input.setWriter("admin"); Date reg_date = new Date();
		 * board_input.setReg_date(reg_date); board_input.setView_count(2);
		 * board_input.setReply_count(0);
		 * 
		 * BoardVO[] board_array = new BoardVO[2]; board_array[0] = board_input; //
		 * ---------------------------------------------- BoardVO board_input2 = new
		 * BoardVO(); board_input2.setBno(2); board_input2.setTitle("두번째 게시물입니다.");
		 * board_input2.setContent("두번째 게시물 내용입니다.<br>줄바꿈했습니다.");
		 * board_input2.setWriter("user02"); board_input2.setReg_date(reg_date);
		 * board_input2.setView_count(2); board_input2.setReply_count(0); //
		 * board_input.setBno(2); // 게시물번호만 2로 변경, 나머지값들은 변경없이 board_array[1]에 저장
		 * board_array[1] = board_input2;
		 * 
		 * List<BoardVO> board_list = Arrays.asList(board_array); //배열타입을 List타입으로 변경
		 * 절차.
		 */		
		// selecBoard 마이바티스 쿼리를 실행하기 전에, set이 빌생해야 변수값이 할당된다.(아래)
		// PageVO의 queryStartNo 구하는 계산석이 먼저 실행되어서, 변수값이 발생되어야 한다.
		if(pageVO.getPage()==null) { // int일때 null체크 에러가 나서, pageVO의 page변수형을 Integer로 변경
			pageVO.setPage(1);
		}
		pageVO.setPerPageNum(8); // 페이지 리스트 단위 5페이지씩 
		pageVO.setQueryPerPageNum(10); //한페이지당 보여줄 게시물 수 10개
		// 검색된 전체 화면 게시물 개수 구하기 서비스 호출
		int countBoard = 0;
		countBoard = boardService.countBoard(pageVO);
		pageVO.setTotalCount(countBoard); //전체 게시물 수를 구한 변수값을 매개변수로 입력
		//전체 회원 수 입력하는 순간 calcpage()메소드 실행.
		
		List<BoardVO> board_list = boardService.selectBoard(pageVO);
		model.addAttribute("board_list", board_list);
		// model.addAttribute("pageVO", pageVO);
		return "admin/board/board_list";
	}
	
//==============================================================================================================================
	
	// 메소드 오버로딩(ex. 동영상 로딩중.., 로딩된 매개변수가 다르면, 메소드 이름 중복가능하다. 대표적인 다형성 구현)
	@RequestMapping(value="/admin/member/member_write", method=RequestMethod.POST)
	public String member_write(@Valid MemberVO memberVO) throws Exception{
		// POST방식으로 넘어온 user_pw값을 BCryptPasswordEncoder클래스로 암호화시킴
		if(memberVO.getUser_pw() != null) {
			BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
			String userPWEncoder = passwordEncoder.encode(memberVO.getUser_pw()); 
			memberVO.setUser_pw(userPWEncoder);
		}
		// 아래 GET방식의 폼 출력화면에서 데이터 전송받은 내용을 처리하는 바인딩
		// DB 입력/출력/삭제/수정 처리
		memberService.insertMember(memberVO);
		return "redirect:/admin/member/member_list";//절대경로로 처리된 이후에 이동할 URL주소 입력
	}
	
	@RequestMapping(value="/admin/member/member_write", method=RequestMethod.GET)
	public String member_write() throws Exception {
		return "admin/member/member_write";
	}
	
	@RequestMapping(value="/admin/member/member_update", method=RequestMethod.GET)
	public String member_update(@RequestParam("user_id") String user_id, @ModelAttribute("pageVO") PageVO pageVO, Model model ) throws Exception {
		//선택한 user_id에 해당하는 정보들을 읽어들여서 그 정보들을 memberVO에 저장
		MemberVO memberVO = memberService.readMember(user_id);
		//기존에 입력되어있던 값들을 보여줘야한다.
		model.addAttribute("memberVO", memberVO); //memberVO : "GET으로 받은 user_id에 해당하는 셀렉트 조회값_readMember"
		//get방식으로 업데이트 폼(파일)만 보여준다.
		return "admin/member/member_update";
	}
	@RequestMapping(value="/admin/member/member_update", method=RequestMethod.POST)
	public String member_update(@ModelAttribute("pageVO") PageVO pageVO, @Valid MemberVO memberVO) throws Exception {
		// POST방식으로 넘어온 user_pw값을 BCryptPasswordEncoder클래스로 암호화시킴
		if(memberVO.getUser_pw() != null || memberVO.getUser_pw() != "") {
		
		}
		else {
			BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
			String userPWEncoder = passwordEncoder.encode(memberVO.getUser_pw()); 
			memberVO.setUser_pw(userPWEncoder);
		}
		
		// POST방식으로 넘어온 값을 DB 수정 처리하는 역할
		memberService.updateMember(memberVO);
		// member_view.jsp에 페이지번호 정보와 수정한 정보의 user_id 값을 전송
		// redirect를 사용하는 목적 : 새로고침했을 떄, 위 updateMember() 재실행 방지
		return "redirect:/admin/member/member_view?page="+pageVO.getPage()+"&user_id="+ memberVO.getUser_id();
	}
	
	@RequestMapping(value="/admin/member/member_delete", method=RequestMethod.POST)
	public String member_delete(RedirectAttributes rdat, @RequestParam("user_id") String user_id) throws Exception{
		memberService.deleteMember(user_id);
		//Redirect로 페이지 이동 시 전송값을 숨겨서 보내는 역할을 하는 클래스 : RedirectAttributes
		rdat.addFlashAttribute("msg", "삭제");
		return "redirect:/admin/member/member_list"; //?success=OK
	}
	//member_list.jsp에서 받은 데이터를 수신하는 역할  @RequestParam("키값") 리퀘스트파라미터 클래스 사용
	//현재 컨트롤러 클래스에서 member_view.jsp로 데이터를 보내는 역할, Model 클래스 사용
	//자료 흐름 : member_list.jsp -> (@RequestParam("user_id")-수신, Model-송신 -> member_view.jsp
	@RequestMapping(value="/admin/member/member_view", method=RequestMethod.GET)
	public String member_view(@ModelAttribute("pageVO") PageVO pageVO, @RequestParam("user_id") String user_ID, Model model ) throws Exception {
		//member_list.jsp에서 받은 "user_id"를 user_ID에 저장한다. -> user_ID값을 user_id2에 넣어서 출력.
		//위에서 수신한 user_id를 member_view.jsp로 보낸다(아래)
		MemberVO memberVO =memberService.readMember(user_ID);
		model.addAttribute("memberVO", memberVO);
		//아래는 초창기에 jsp로 정보를 어떻게 보내는지 확인하기 위한 것.
		//model.addAttribute("user_id2", user_ID + "<script>alert('메롱');</script> 님");
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

		// selectMember 마이바티스 쿼리를 실행하기 전에, set이 빌생해야 변수값이 할당된다.(아래)
		if(pageVO.getPage()==null) { // int일때 null체크 에러가 나서, pageVO의 page변수형을 Integer로 변경
			pageVO.setPage(1);
		}
		pageVO.setPerPageNum(8); // 페이지 리스트 단위 5페이지씩 
		pageVO.setQueryPerPageNum(10); //한페이지당 보여줄 회원 수 10명
		// 검색된 전체 화면 명수 구하기 서비스 호출
		int countMember = 0;
		countMember = memberService.countMember(pageVO);
		pageVO.setTotalCount(countMember); //전체 회원 수를 구한 변수값을 매개변수로 입력
		//전체 회원 수 입력하는 순간 calcpage()메소드 실행.
		
		List<MemberVO> members_list = memberService.selectMember(pageVO);
		model.addAttribute("memberss", members_list);//members 2차원 배열을 members_array 클래스 오브젝트로 변경	
		
		//상단의 @ModelAttribute("pageVO")는 jsp로 PageVO클래스 결과를 보내주는 역할
		//@ModelAttribute를 사용한다면, 아래 model.~("pageVO", pageVO)없어도 됨.
		/*
		 * @ModelAttribute 자체가 수행하는 기능이, 수행한 pageVO 결과를 pageVO라는 이름으로 jsp에 보내는 것. 따라서
		 * pageVO를 "pageVO"의 이름으로 보내겠다는 model.addAttribute("pageVO", pageVO); 없어도 됨.
		 */
		//model.addAttribute("pageVO", pageVO);
		return "admin/member/member_list";//member_list.jsp로 members 변수명으로 데이터를 전송
	}
	
	//bind:묶는다는 의미, /admin 요청경로와 admin/home.jsp를 묶는다.
	@RequestMapping(value="/admin",method=RequestMethod.GET)
	public String admin() throws Exception {
		return "admin/home";
	}
}
