package com.tripleJ.gg88.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tripleJ.gg88.domain.Member;
import com.tripleJ.gg88.service.MemberService;

@Controller
@RequestMapping("member/*")
public class MemberController {
	
	@Autowired
	MemberService memberService;

	@RequestMapping("account/agreement")
	public String agreement() {
		return memberService.agreement();
	}
	
	@RequestMapping("account/enter")
	public String enter() {
		return memberService.enter();
	}
	
	@RequestMapping("account/completed")
	public String completed(String nickname, Model model) {
		return memberService.completed(nickname, model);
	}
	
	@RequestMapping("account/foundId")
	public String foundId(String email, Model model) {
		return memberService.foundId(email, model);
	}
	
	@RequestMapping("account/findPw")
	public String findPw(String userId, Model model) {
		return memberService.findPw(userId, model);
	}
	
	@RequestMapping("account/checkEmail")
	@ResponseBody
	public String checkEmail(String userId, String email) {
		return memberService.checkEmail(userId, email);
	}
	
	@RequestMapping("account/changePw")
	public String changePw() {
		return "account/changePw";
	}
	
	@RequestMapping("account/updatePw")
	@ResponseBody
	public void updatePw(String email, String newPw) {
		memberService.updatePw(email, newPw);
	}
	
	@RequestMapping("account/searchId")
	@ResponseBody
	public String searchId(String userId) {
		return memberService.searchId(userId);
	}
	
	@RequestMapping("account/searchNick")
	@ResponseBody
	public String searchNick(String nickname) {
		return memberService.searchNick(nickname);
	}
	
	@RequestMapping("account/signUp")
	@ResponseBody
	public int signUp(Member memberVO, String userbirth) {
		return memberService.signUp(memberVO, userbirth);
	}
	
	@RequestMapping("signIn")
	@ResponseBody
	public String signIn(String id, String pw, boolean loginKeep, HttpServletRequest request, HttpServletResponse response) {
		return memberService.signIn(id, pw, loginKeep, request, response);
	}
	
	@RequestMapping(value ="autoSignIn", produces = "application/text; charset=utf8")
	@ResponseBody
	public String autoSignIn(String sessionId) {
		return memberService.autoSignIn(sessionId);
	}
	
	@RequestMapping("signOut")
	public String signOut(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		return memberService.signOut(session, request, response);
	}
	
	@RequestMapping("info/myInfo")
	public String myInfo(String nickname, Model model) {
		return memberService.myInfo(nickname, model);
	}
	
	@RequestMapping("info/totalCnt")
	@ResponseBody
	public Map<String, Integer> totalCnt(String nickname) {
		return memberService.totalCnt(nickname);
	}
	
	@RequestMapping("info/myQna")
	public String myQna(String nickname, int page, int pageSize, Model model) {
		return memberService.myQna(nickname, page, pageSize, model);
	}
	
	
	@RequestMapping("info/profile")
	@ResponseBody
	public String profile(String nickname) {
		return memberService.profile(nickname);
	}
	
}
