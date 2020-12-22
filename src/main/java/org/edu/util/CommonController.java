package org.edu.util;

import javax.inject.Inject;

import org.edu.service.IF_MemberService;
import org.edu.vo.MemberVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * CommonController 공통 사용(Admin, Home) 컨트롤러
 * @author 이시은
 *
 */

@Controller
public class CommonController {
	@Inject
	IF_MemberService memberService;
	
	//REST-API서비스로 사용할 때, @ResponseBody 어노테이션으로 json텍스트데이터를 반환함 (아래)
	//아래는 RestAPI백엔드단, Ajax(jsp)부분은 Rest-API의 프론트 엔드단.
	@RequestMapping(value="/id_check", method=RequestMethod.GET)
	@ResponseBody
	public String id_check(@RequestParam("user_id") String user_id) {
		String result="0"; // 아이디 중복값을 체크하는 변수. 기본값은 중복값 없음(0)
		//Rest-API 서비스에서는 스프링을 통해 Ajax로 에러메세지를 받을 수 없기 때문에, 여기서 예외처리해야한다
		//throws Exception 사용하지 않고 try-catch문 사용하는 이유(위)
		try {
			MemberVO memberVO = memberService.readMember(user_id);
			if(memberVO != null) {result="1";} // 아이디 중복값이 있을 경우
			else {result="0";} // 아이디 중복값이 없을 경우
		} catch (Exception e) {
			//위 readMember 메소드에서 에러발생시
			result=e.toString();
		}
		return result; // 결과값은 0, 1, 또는 에러메세지 중 한가지
	}
}
