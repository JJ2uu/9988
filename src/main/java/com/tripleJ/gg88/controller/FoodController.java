package com.tripleJ.gg88.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FoodController {
	@RequestMapping("food/foodMain")
	public String foodMain() {
		return "food/foodMain";
	}
	
}
