package com.zerock.persistence;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.zerock.domain.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	//private static final String namespace = "com.zerock.mappers.memberMapper";

	@Override
	public String getTime() {
		
		return sqlSession.selectOne("mappers.memberMapper.getTime");
		//return sqlSession.selectOne(namespace+".getTime");
	}

	@Override
	public void insertMember(MemberVO vo) {
		sqlSession.insert("mappers.memberMapper.insertMember", vo);
		//sqlSession.insert(namespace+".insertMember", vo);
	}

	@Override
	public MemberVO readMember(String userid) throws Exception {
		
		return (MemberVO) sqlSession.selectOne("mappers.memberMapper.selectMember", userid); 
	}

	@Override
	public MemberVO readWithPw(String userid, String userpw) throws Exception {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("userid", userid);
		paramMap.put("userpw", userpw);
		
		return sqlSession.selectOne("mappers.memberMapper.readWithPw", paramMap);
	}
	
	
	
	
}
