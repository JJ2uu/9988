package com.tripleJ.gg88.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tripleJ.gg88.service.MailAuthService;

@Controller
@RequestMapping("auth/*")
public class MailAuthController {
	
	@Autowired
	MailAuthService authService;

	@RequestMapping("joinEmail")
	@ResponseBody
	public String joinEmail(String email, String type) {
		return authService.joinEmail(email, type);
	}
	
}