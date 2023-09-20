package com.tripleJ.gg88.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tripleJ.gg88.service.DailyService;

@Controller
@RequestMapping("daily/*")
public class DailyController {
	
	@Autowired
	DailyService dailyService;
	
	@RequestMapping("articleCnt")
	@ResponseBody
	public int articleCnt() {
		return dailyService.articleCnt();
	}

	@RequestMapping("articleList")
	public void articleList(int page, Model model) {
		dailyService.articleList(page, model);
	}
	
	@RequestMapping("articleDetail")
	public void articleDetail(String newsUrl, Model model) {
		dailyService.articleDetail(newsUrl, model);
	}
}
