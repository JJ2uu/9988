package com.tripleJ.gg88.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tripleJ.gg88.domain.Food;
import com.tripleJ.gg88.service.FoodService;

@Controller
public class FoodController {
	@Autowired
	FoodService service;
	
	@RequestMapping("food/foodMain")
	public String foodMain(Model model) throws Exception {
		List<Food> foodList = service.foodMainCrawling(model);
		model.addAttribute("foodList",foodList);
		return "food/foodMain";
	}
	
	@RequestMapping("food/crawling")
	public void crawling(String Search, Model model) throws Exception {
		List<Food> foodList = service.crawling(Search, model);
		model.addAttribute("foodList",foodList);
	}
	
}