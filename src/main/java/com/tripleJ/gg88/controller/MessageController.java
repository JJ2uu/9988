package com.tripleJ.gg88.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tripleJ.gg88.service.MessageService;

@Controller
@RequestMapping("message/*")
public class MessageController {

	@Autowired
	MessageService messageService;
	
	@RequestMapping("sendTo")
	@ResponseBody
	public String sendTo(String phoneNumber) {
		return messageService.sendTo(phoneNumber);
	}
	
}