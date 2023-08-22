package com.tripleJ.gg88.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tripleJ.gg88.domain.MemberVO;
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
	public String foundId() {
		return memberService.foundId();
	}
	
	@RequestMapping("account/notFoundId")
	public String notFoundId() {
		return memberService.notFoundId();
	}
	
	@RequestMapping("account/resetPw")
	public String resetPw() {
		return memberService.resetPw();
	}
	
	@RequestMapping("account/changePw")
	public String changePw() {
		return "account/changePw";
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
	public int signUp(MemberVO memberVO, String userbirth) {
		return memberService.signUp(memberVO, userbirth);
	}
	
	@RequestMapping("info/myInfo")
	public String myInfo() {
		return memberService.myInfo();
	}
	
	@RequestMapping("info/myHistory")
	public String myHistory() {
		return memberService.myHistory();
	}
	
}
