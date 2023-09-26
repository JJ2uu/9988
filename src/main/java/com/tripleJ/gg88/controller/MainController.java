package com.tripleJ.gg88.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tripleJ.gg88.domain.Emergency;
import com.tripleJ.gg88.domain.Exercise;
import com.tripleJ.gg88.domain.Food;
import com.tripleJ.gg88.domain.Page;
import com.tripleJ.gg88.model.PagingDto;
import com.tripleJ.gg88.service.DailyService;
import com.tripleJ.gg88.service.EmergencyService;
import com.tripleJ.gg88.service.ExerciseService;
import com.tripleJ.gg88.service.FoodService;
import com.tripleJ.gg88.service.QnaService;

@Controller
public class MainController {
	
	@Autowired
	QnaService qnaService;
	
	@Autowired
	FoodService foodService;
	
	@Autowired
	ExerciseService exerciseService;
	
	@Autowired
	DailyService dailyService;
	
	@Autowired
	EmergencyService emergencyService;

	@RequestMapping("main/main_qna")
	public void mainQna(Page page, Model model) {
		qnaService.mainQna(page, model);
		
	}

	@RequestMapping("main/main_food")
	public void mainFood(Model model) throws Exception {
		List<Food> foodList = foodService.foodMainCrawling(model);
		model.addAttribute("foodList",foodList);
	}
	
	@RequestMapping("main/main_exercise")
	public void mainExercise(@RequestParam(defaultValue = "1", name = "seq") int currentNum, Model model) throws Exception{
		PagingDto page = exerciseService.paganation(currentNum, "운동");
		List<Exercise> exercise = exerciseService.search("운동", page);
		model.addAttribute("exercise", exercise);
	}
	
	@RequestMapping("main/main_daily")
	public void mainDaily(@RequestParam(defaultValue = "1") int page, Model model) {
		dailyService.articleList(page, model);
	}
	
	@RequestMapping("main/main_emergency")
	public void mainEmergency(@RequestParam(defaultValue = "1") int currentNum, Model model) {
		PagingDto page = emergencyService.paganation(currentNum);
		List<Emergency> emergency = emergencyService.getList(page);
		model.addAttribute("emergencyList", emergency);
	}
	
	

}
