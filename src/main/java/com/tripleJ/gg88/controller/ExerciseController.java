package com.tripleJ.gg88.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tripleJ.gg88.domain.Exercise;
import com.tripleJ.gg88.model.PagingDto;
import com.tripleJ.gg88.service.ExerciseService;

@Controller
@RequestMapping("exercise/*")
public class ExerciseController {
	private ExerciseService service;
	
	@Autowired
	public ExerciseController(ExerciseService service) {
		super();
		this.service = service;
	}

	@RequestMapping(value = "/doExercise", method = RequestMethod.GET)
	public void mainPath(@RequestParam(defaultValue = "1", name = "seq") int currentNum, Model model) throws Exception{
		PagingDto page = service.paganation(currentNum, "운동");
		List<Exercise> exercise = service.getList(page);
		model.addAttribute("exercise", exercise);
	}
	
	@RequestMapping(value = "/getPage", method = RequestMethod.POST)
	@ResponseBody
	public PagingDto getPage(@RequestParam(defaultValue = "1", name = "seq") int currentNum, @RequestParam(defaultValue = "운동", required = false) String category, Model model) {
		return service.paganation(currentNum, category);
	}
	
	@RequestMapping(value = "/serach", method = RequestMethod.GET)
	public void search(String search, Model model) throws Exception {
		List<Exercise> exercise = service.search(search);
		model.addAttribute("exercise", exercise);
	}
	
}
