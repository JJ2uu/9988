package com.tripleJ.gg88.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("emergency/*")
public class EmergencyController {
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void emergencyPath() {
		
	}

	@RequestMapping(value = "/createBoard", method = RequestMethod.GET)
	public void createBoard() {
		
	}
	
	@RequestMapping(value = "/board", method = RequestMethod.GET)
	public void separateBoard() {
		
	}
}
