package com.tripleJ.gg88.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tripleJ.gg88.service.EmergencyService;
import com.tripleJ.gg88.domain.Emergency;
import com.tripleJ.gg88.model.PagingDto;

@Controller
@RequestMapping("emergency/*")
public class EmergencyController {
	private EmergencyService service;
	
	@Autowired
	public EmergencyController(EmergencyService service) {
		this.service = service;
	}

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void emergencyPath(@RequestParam(defaultValue = "1") int currentNum, Model model) {
		PagingDto page = service.paganation(currentNum);
		List<Emergency> emergency = service.getList(page);
		model.addAttribute("emergencyList", emergency);
	}
	
	@RequestMapping(value = "/createBoard", method = RequestMethod.GET)
	public void createBoard() {
	}
	
	@RequestMapping(value = "/saveBoard", method = RequestMethod.POST)
	public String saveBoard(Emergency emergency, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String memberId = String.valueOf(session.getAttribute(""));
		service.saveBoard(emergency, 1);
		return "redirect:/emergency/main";
	}
	
	@RequestMapping(value = "/temporarySave", method = RequestMethod.GET)
	public void temporarySave(Emergency emergency, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String memberId = String.valueOf(session.getAttribute(""));
		service.temporarySave(emergency, 1);
	}
	
	@RequestMapping(value = "/board", method = RequestMethod.GET)
	public String getBoard(int emergencyId, Model model) {
		model.addAttribute("emergency", service.findById(emergencyId));
		return "emergency/board";
	}
	
	@RequestMapping(value = "/getPage", method = RequestMethod.POST)
	@ResponseBody
	public PagingDto getPage(@RequestParam(defaultValue = "1") int currentNum, Model model) {
		return service.paganation(currentNum);
	}
	
}
