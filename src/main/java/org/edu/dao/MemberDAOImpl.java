package org.edu.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.edu.vo.MemberVO;
import org.springframework.stereotype.Repository;


// Service나 DAO라고 어노테이션명이 되어있는 것이 아니라 Repository는 어노테이션 사용

@Repository
public class MemberDAOImpl implements IF_MemberDAO {
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<MemberVO> selectMember() throws Exception {
		// mapper.xml에 접근하는 방법(아래)
		return sqlSession.selectList("memberMapper.selectMember");
		//sqlSession템플릿의 selectList메소드를 실행하면,
		//memberMapper.selectMember 쿼리 실행
	}

}
