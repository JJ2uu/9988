package com.tripleJ.gg88.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("daily/*")
public class DailyController {

	@RequestMapping("articleList")
	public String articleList() {
		return "daily/articleList";
	}
}
