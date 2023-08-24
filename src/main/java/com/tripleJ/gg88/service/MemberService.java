package com.tripleJ.gg88.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.tripleJ.gg88.domain.MemberVO;

public interface MemberService {

	String agreement();
	
	String enter();

	String completed(String nickname, Model model);
	
	String foundId();
	
	String notFoundId();
	
	String resetPw();
	
	String changePw();
	
	String searchId(String userId);
	
	String searchNick(String nickname);
	
	int signUp(MemberVO memberVO, String userbirth);
	
	String signIn(String id, String pw, boolean loginKeep, HttpServletRequest request, HttpServletResponse response);
	
	String signOut(HttpSession session);
	
	String myInfo();
	
	String myHistory();
}
