package com.tripleJ.gg88.service;

import java.util.List;

import org.springframework.ui.Model;

import com.tripleJ.gg88.domain.Daily;

public interface DailyService {
	
	int articleCnt();

	List<Daily> articleList(int page, Model model);
	
	void articleDetail(String newsUrl, Model model);
	
	void mainArticle(int page, Model model);
}
