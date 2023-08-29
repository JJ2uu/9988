package com.tripleJ.gg88.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tripleJ.gg88.service.EmergencyService;
import com.tripleJ.gg88.domain.Emergency;

@Controller
@RequestMapping("emergency/*")
public class EmergencyController {
	private EmergencyService service;
	
	@Autowired
	public EmergencyController(EmergencyService service) {
		this.service = service;
	}

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void emergencyPath() {
		service.findAllBoard();
	}

	@RequestMapping(value = "/createBoard", method = RequestMethod.GET)
	public void createBoard() {
		
	}
	
	@RequestMapping(value = "/saveBoard", method = RequestMethod.GET)
	public String saveBoard(Emergency emergency, HttpServletRequest request) {
		service.saveBoard(emergency, request);
		return "redirect:/emergency/main";
	}
	
	@RequestMapping(value = "/temporarySave", method = RequestMethod.GET)
	public void temporarySave(Emergency emergency) {
		service.temporarySave(emergency);
	}
	
	@RequestMapping(value = "/board", method = RequestMethod.GET)
	public void separateBoard(Emergency emergency) {
		service.findById(emergency.getEmergencyId());
	}
}
