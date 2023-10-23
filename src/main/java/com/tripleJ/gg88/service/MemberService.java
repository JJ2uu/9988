package com.tripleJ.gg88.service;

import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.tripleJ.gg88.domain.Member;

public interface MemberService {

	String agreement();
	
	String enter();

	String completed(String nickname, Model model);
	
	String foundId(String email, Model model);
	
	String findPw(String userId, Model model);
	
	String checkEmail(String userId, String email);
	
	String changePw();
	
	void updatePw(Member memberVO, String newPw);
	
	void updateNick(String nickname, String newNick, HttpServletRequest request);
	
	String searchId(String userId);
	
	String searchNick(String nickname);
	
	String searchEmail(String email);
	
	int signUp(Member memberVO, String userbirth);
	
	String signIn(String id, String pw, boolean loginKeep, HttpServletRequest request, HttpServletResponse response);
	
	String autoSignIn(String sessionId);
	
	void keepLogin(String userId, String sessionId, Date sessionLimit);
	
	Member checkSessionKey(String sessionId);
	
	String signOut(HttpSession session, HttpServletRequest request, HttpServletResponse response);
	
	void withdraw(String nickname, HttpSession session, HttpServletRequest request, HttpServletResponse response);
	
	String myInfo(String nickname, Model model);
	
	Map<String, Integer> totalCnt(String nickname);
	
	String myQna(String nickname, int page, int pageSize, Model model);
	
	String myReply(String nickname, int page, int pageSize, Model model);
	
	String qnaKeywordSearch(String nickname, String keyword, int page, int pageSize, Model model);
	
	String replyKeywordSearch(String nickname, String keyword, int page, int pageSize, Model model);
	
	String profile(String nickname);
}