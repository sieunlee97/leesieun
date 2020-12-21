package org.edu.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.edu.vo.MemberVO;
import org.edu.vo.PageVO;
import org.springframework.stereotype.Repository;


// Service나 DAO라고 어노테이션명이 되어있는 것이 아니라 Repository는 어노테이션 사용

@Repository
public class MemberDAOImpl implements IF_MemberDAO {
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<MemberVO> selectMember(PageVO pageVO) throws Exception {
		// mapper.xml에 접근하는 방법(아래)
		// 매개변수(파라미터) 한 개로 만들어서, 값을 두 개 집어넣는 방식 - 해시데이터타입 만들어서 구현
		/*
		 * Map<String,Object> paramMap = new HashMap<String, Object>();
		 * paramMap.put("search_type", search_type); paramMap.put("search_keyword",
		 * search_keyword);
		 */
		 return sqlSession.selectList("memberMapper.selectMember", pageVO);
		//sqlSession템플릿의 selectList메소드를 실행하면,
		//memberMapper.selectMember 쿼리 실행
	}

	@Override
	public void insertMember(MemberVO memberVO) throws Exception {
		// mapper.xml에 접근하는 방법(아래)
		sqlSession.insert("memberMapper.insertMember", memberVO);
		
	}

	@Override
	public void deleteMember(String user_id) throws Exception {
		// mapper.xml에 접근하는 방법(아래)
		sqlSession.delete("memberMapper.deleteMember", user_id);
		
	}

	@Override
	public MemberVO readMember(String user_id) throws Exception {
		// mapper.xml에 접근하는 방법(아래)
		return sqlSession.selectOne("memberMapper.readMember", user_id);
		// sqlSession.selectOne(statement, parameter) parameter를 statement에 전달한다. 
		// 즉 위의  return 뜻은, sqlSession 클래스의 selectOne 메소드를 사용하여 값을 반환한다. (값을 하나만  반환)
		// 파라미터값으로  user_id값을 받아 그 값을 memberMapper클래스의 readMember메소드에 전달(호출)
		// memberMapper.xml에 저장 되어있던 쿼리 실행 
		
	}

	@Override
	public void updateMember(MemberVO memberVO) throws Exception {
		// mapper.xml에 접근하는 방법(아래)
		sqlSession.update("memberMapper.updateMember", memberVO);
	}

	@Override
	public int countMember(PageVO pageVO) throws Exception {
		// mapper.xml에 접근하는 방법(아래)
		return sqlSession.selectOne("memberMapper.countMember", pageVO);
	}
	
	
}
