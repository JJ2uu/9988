package com.tripleJ.gg88.service;

import org.springframework.ui.Model;

public interface DailyService {
	
	int articleCnt();

	void articleList(int page, Model model);
	
	void articleDetail(String newsUrl, Model model);
}
