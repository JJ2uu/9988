package com.tripleJ.gg88.service;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.tripleJ.gg88.domain.MemberVO;

public interface MemberService {

	String agreement();
	
	String enter();

	String completed(String nickname, Model model);
	
	String foundId(String email, Model model);
	
	String findPw(String userId, Model model);
	
	String checkEmail(String userId, String email);
	
	String changePw();
	
	void updatePw(String email, String newPw);
	
	String searchId(String userId);
	
	String searchNick(String nickname);
	
	int signUp(MemberVO memberVO, String userbirth);
	
	String signIn(String id, String pw, boolean loginKeep, HttpServletRequest request, HttpServletResponse response);
	
	String autoSignIn(String sessionId);
	
	void keepLogin(String userId, String sessionId, Date sessionLimit);
	
	MemberVO checkSessionKey(String sessionId);
	
	String signOut(HttpSession session, HttpServletRequest request, HttpServletResponse response);
	
	String myInfo();
	
	String myHistory();
}
