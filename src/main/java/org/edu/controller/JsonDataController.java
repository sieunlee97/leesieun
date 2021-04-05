package org.edu.controller;



import java.util.List;

import javax.inject.Inject;

import org.edu.dao.IF_MemberDAO;
import org.edu.vo.MemberVO;
import org.edu.vo.PageVO;
import org.hsqldb.lib.SimpleLog;
import org.jboss.logging.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class JsonDataController {
	@Inject
	private IF_MemberDAO memberDAO;
	private Logger logger = Logger.getLogger(SimpleLog.class);
	//RestAPI서버 (아래) - 인증 서버
	@RequestMapping(value="/android/login", method=RequestMethod.POST)
	public ResponseEntity<MemberVO> androidLogin(@RequestParam("txtUsername") String user_id, @RequestParam("txtPassword") String user_pw) {
		ResponseEntity<MemberVO> entity = null;
		try {
			MemberVO memberVO = memberDAO.readMember(user_id);
			String bcryptPassword = memberVO.getUser_pw();
			//스프링시큐리티 4.x BCryptPasswordEncoder로 암호화된 값을 비교
			BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder(10); //매개변수 10 = 암호화 강도
			if(passwordEncoder.matches(user_pw, bcryptPassword)) {
				logger.debug("계정정보 일치");
				entity = new ResponseEntity<>(memberVO, HttpStatus.OK); //200
			} else {
				logger.debug("계정정보 불일치");
				entity = new ResponseEntity<>(HttpStatus.NO_CONTENT); //204
			}
		} catch (Exception e) {
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity; //json데이터(Key:Value,..)로 리턴
	}
	//RestAPI서버 (아래) - 회원목록 출력 기능
	@RequestMapping(value="/android/list", method=RequestMethod.POST)
	public ResponseEntity<List<MemberVO>> androidMember() {
		ResponseEntity<List<MemberVO>> entity = null;
		PageVO pageVO = new PageVO();
		pageVO.setPage(1);
		pageVO.setPerPageNum(10);
		pageVO.setQueryPerPageNum(100); //1회 쿼리에서 100명 허용
		try {
			entity = new ResponseEntity<>(memberDAO.selectMember(pageVO), HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
