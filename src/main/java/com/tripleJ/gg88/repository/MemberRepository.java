package com.tripleJ.gg88.repository;

import java.util.Map;

import com.tripleJ.gg88.domain.MemberVO;

public interface MemberRepository {
	
	MemberVO searchId(String id);
	
	MemberVO searchNick(String nickname);
	
	int signUp(MemberVO memberVO);
	
	MemberVO signIn(MemberVO memberVO);
	
	MemberVO checkEmail(Map<String, Object> userDataMap);
	
	void keepLogin(Map<String, Object> userDataMap);
	
	MemberVO checkSessionKey(String sessionId);
	
	MemberVO searchEmail(String email);
	
	void updatePw(Map<String, Object> userDataMap);

}