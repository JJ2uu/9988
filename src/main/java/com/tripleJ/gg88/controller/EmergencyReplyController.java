package com.tripleJ.gg88.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tripleJ.gg88.domain.EmergencyReply;
import com.tripleJ.gg88.service.EmergencyReplyServiceImpl;

@Controller
@RequestMapping("emergency/reply/*")
public class EmergencyReplyController {
	
	private final EmergencyReplyServiceImpl service;
	@Autowired
	public EmergencyReplyController(EmergencyReplyServiceImpl service) {
		this.service = service;
	}
	
	@RequestMapping(value = "/getAllReply", method = RequestMethod.POST)
	@ResponseBody
	public List<EmergencyReply> getAllReply(@RequestParam int emergencyId) {
		return service.getAllReplay(emergencyId);
	}
	
	@RequestMapping(value = "/regist", method = RequestMethod.POST)
	public String regist(int emergencyId, String comment, HttpServletRequest request){
		service.insertComment(emergencyId, comment, request);
		return "redirect:/emergency/board?emergencyId=" + emergencyId;
	}

}