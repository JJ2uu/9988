package com.tripleJ.gg88.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	public void mainPath() throws Exception{
		String test = service.search("운동");
//		System.out.println(test);
	}
	
	
}
