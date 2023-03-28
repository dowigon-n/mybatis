package com.zerock.persistence;

import com.zerock.domain.MemberVO;

public interface MemberDAO {
	
	// DB의 현재 시간
	public String getTime();
	
	// insert member
	public void insertMember(MemberVO vo);
	
	// member read
	public MemberVO readMember(String userid) throws Exception;
	
	// member update
	public MemberVO readWithPw(String userid, String userpw) throws Exception;

}
