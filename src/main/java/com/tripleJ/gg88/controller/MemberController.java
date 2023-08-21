package com.tripleJ.gg88.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("member/*")
public class MemberController {

	@RequestMapping("account/agreement")
	public String agreement() {
		return "account/agreement";
	}
	
	@RequestMapping("account/enter")
	public String enter() {
		return "account/enter";
	}
	
	@RequestMapping("account/completed")
	public String completed() {
		return "account/completed";
	}
	
	@RequestMapping("account/foundId")
	public String foundId() {
		return "account/foundId";
	}
	
	@RequestMapping("account/notFoundId")
	public String notFoundId() {
		return "account/notFoundId";
	}
	
	@RequestMapping("account/resetPw")
	public String resetPw() {
		return "account/resetPw";
	}
	
	@RequestMapping("account/changePw")
	public String changePw() {
		return "account/changePw";
	}
	
	@RequestMapping("info/myInfo")
	public String myInfo() {
		return "info/myInfo";
	}
	
	@RequestMapping("info/myHistory")
	public String myHistory() {
		return "info/myHistory";
	}
	
}
