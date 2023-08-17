package com.tripleJ.gg88.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {

	@RequestMapping("member/account/agreement")
	public String agreement() {
		return "account/agreement";
	}
	
	@RequestMapping("member/account/enter")
	public String enter() {
		return "account/enter";
	}
	
	@RequestMapping("member/account/completed")
	public String completed() {
		return "account/completed";
	}
	
	@RequestMapping("member/account/foundId")
	public String foundId() {
		return "account/foundId";
	}
	
	@RequestMapping("member/account/notFoundId")
	public String notFoundId() {
		return "account/notFoundId";
	}
	
	@RequestMapping("member/account/resetPw")
	public String resetPw() {
		return "account/resetPw";
	}
	
	@RequestMapping("member/account/changePw")
	public String changePw() {
		return "account/changePw";
	}
	
}
