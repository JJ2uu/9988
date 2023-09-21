package com.tripleJ.gg88.service;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.tripleJ.gg88.domain.Food;

@Service
public class FoodService {
	
	public List<Food> crawling(String Search, Model model)throws Exception {
		
		String url = "https://search.naver.com/search.naver?query=" + URLEncoder.encode(Search+"식단","UTF-8") + "&sm=tab_nmr&where=influencer";
		Document doc = Jsoup.connect(url).get();
		
		Elements ele = doc.select("ul.keyword_challenge_list li");
		
		List<Food> foodList = new ArrayList<>();
		for (Element element : ele) {
	        String title = element.select("a.name_link").text();
	        String blogName = element.select("a.name span.txt").text();
	        String urlValue = element.select("a.name_link").attr("href");
	        String thumbnail = element.select("img.img.api_get, img.bg_nimg").attr("src");

	        if (title != "" && blogName != "" && urlValue != "" && thumbnail != "") {
	            Food food = new Food.Builder()
	                    .title(title)
	                    .blogName(blogName)
	                    .url(urlValue)
	                    .thumbnail(thumbnail)
	                    .build();
	            foodList.add(food);
	            System.out.println(food);
	        }
	    }
		System.out.println(ele.toString()); // 선택한 요소들의 HTML 내용 출력
		System.out.println(foodList);
		
		return foodList;
		
	}
	
	public List<Food> foodMainCrawling(Model model)throws Exception {
		
		String url = "https://search.naver.com/search.naver?query=" + URLEncoder.encode("건강한식단","UTF-8") + "&sm=tab_nmr&where=influencer";
		Document doc = Jsoup.connect(url).get();
		
		Elements ele = doc.select("ul.keyword_challenge_list li");
		
		List<Food> foodList = new ArrayList<>();
		for (Element element : ele) {
	        String title = element.select("a.name_link").text();
	        String blogName = element.select("a.name span.txt").text();
	        String urlValue = element.select("a.name_link").attr("href");
	        String thumbnail = element.select("img.img.api_get, img.bg_nimg").attr("src");


	        if (title != "" && blogName != "" && urlValue != "" && thumbnail != "") {
	            Food food = new Food.Builder()
	                    .title(title)
	                    .blogName(blogName)
	                    .url(urlValue)
	                    .thumbnail(thumbnail)
	                    .build();
	            foodList.add(food);
	            System.out.println(food);
	        }
	    }
		System.out.println(ele.toString()); // 선택한 요소들의 HTML 내용 출력
		System.out.println(foodList);
		
		return foodList;
		
	}

}
