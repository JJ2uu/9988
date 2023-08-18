package com.tripleJ.gg88.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("exercise/*")
public class ExerciseController {
	@RequestMapping(value = "/doExercise", method = RequestMethod.GET)
	public void mainPath(){
		
	}
}
