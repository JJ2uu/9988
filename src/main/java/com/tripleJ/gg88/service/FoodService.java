package com.tripleJ.gg88.service;

import java.util.List;

import org.springframework.ui.Model;

import com.tripleJ.gg88.domain.Food;

public interface FoodService {
	
	List<Food> crawling(String Search, Model model)throws Exception;
	
	List<Food> foodMainCrawling(Model model)throws Exception;
	
	String extractImageUrl(String html);

}
