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
	public void mainPath(Model model) throws Throwable{
		List<Exercise> exercise = service.search("운동");
		model.addAttribute("exercise", exercise);
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.POST)
	@ResponseBody
	public List<Exercise> search(@RequestParam String keyword, Model model) throws Throwable{
		return service.search(keyword);
	}
	
}
