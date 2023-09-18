package com.tripleJ.gg88.repository;

import java.util.Map;

import com.tripleJ.gg88.domain.Member;

public interface MemberRepository {
	
	Member searchId(String id);
	
	Member searchNick(String nickname);
	
	int signUp(Member memberVO);
	
	Member signIn(Member memberVO);
	
	Member checkEmail(Map<String, Object> userDataMap);
	
	void keepLogin(Map<String, Object> userDataMap);
	
	Member checkSessionKey(String sessionId);
	
	Member searchEmail(String email);
	
	void updatePw(Map<String, Object> userDataMap);
	
	void profileUpload(Map<String, Object> userDataMap);
	
	void updateNick(Map<String, Object> userDataMap);
}