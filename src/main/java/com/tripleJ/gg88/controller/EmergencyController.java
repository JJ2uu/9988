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
import org.springframework.web.multipart.MultipartFile;

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
	public void emergencyPath(Model model, HttpServletRequest request) {
		String userId = String.valueOf(request.getSession().getAttribute("userId"));
		
		model.addAttribute("emergencyList", service.getList(0, 12));
		model.addAttribute("userId", userId);
	}
	
	@RequestMapping(value = "/createBoard", method = RequestMethod.GET)
	public void createBoard() {
	}
	
	@RequestMapping(value = "/saveBoard", method = RequestMethod.POST)
	public String saveBoard(Emergency emergency, HttpServletRequest request, MultipartFile file) throws Exception {
		service.saveBoard(emergency, (int) request.getSession().getAttribute("memberNo"));
		return "redirect:/emergency/main";
	}
	
	@RequestMapping(value = "/board", method = RequestMethod.GET)
	public String getBoard(int emergencyId, Model model) {
		model.addAttribute("emergency", service.findById(emergencyId));
		return "emergency/board";
	}
	
	@RequestMapping(value = "/getPage", method = RequestMethod.POST)
	@ResponseBody
	public PagingDto getPage(@RequestParam int currentNum) {
		return service.paganation(currentNum);
	}
	
	@RequestMapping(value = "/updateBoard", method = RequestMethod.GET)
	public void updatePath(int emergencyId, Model model) {
		model.addAttribute("emergency", service.findById(emergencyId));
	}
	
	@RequestMapping(value = "/updateBoard", method = RequestMethod.POST)
	public String updateBoard(Emergency emergency, HttpServletRequest request) {
		service.updateBoard(emergency, request);
		return "redirect:/emergency/main";
		
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String deleteBoard(int emergencyId) {
		service.deleteBoard(emergencyId);
		return "redirect:/emergency/main";
	}
	
	@RequestMapping(value = "/getList", method = RequestMethod.POST)
	@ResponseBody
	public List<Emergency> getList(@RequestParam int firstRecordIndex, @RequestParam int lastRecordIndex) {
		return service.getList(firstRecordIndex, lastRecordIndex);
	}
	
	@RequestMapping(value="getMemberNo", method = RequestMethod.POST)
	@ResponseBody
	public Object getMemberNo(@RequestParam String userNickName, HttpSession session) {
		int memberNo = service.getMemberNo(userNickName);
		session.setAttribute("memberNo", memberNo);
		return session.getAttribute("memberNo");
	}
}