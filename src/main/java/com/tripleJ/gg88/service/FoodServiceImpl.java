package com.tripleJ.gg88.service;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.tripleJ.gg88.domain.Food;

@Service
public class FoodServiceImpl implements FoodService{
	
	public List<Food> crawling(String Search, Model model)throws Exception {
		
		String url = "https://search.naver.com/search.naver?query=" + URLEncoder.encode(Search+"식단","UTF-8") + "&sm=tab_nmr&where=influencer";
		Document doc = Jsoup.connect(url).get();
		
		Elements ele = doc.select("ul.keyword_challenge_list li");
		
		List<Food> foodList = new ArrayList<>();
		for (Element element : ele) {
	        String title = element.select("a.name_link").text();
	        String blogName = element.select("a.name span.txt").text();
	        String job = element.select("span.etc.highlight").text();	        
	        String simpleContent = element.select("p.dsc").text();
	        String urlValue = element.select("a.name_link").attr("href");
	        String imageUrl = element.select("img.bg_nimg").attr("src");
	        if (imageUrl.contains("data:image/gif")) {
				String thumbnail = element.select("div.detail_box div").first().select("a").first().html();
				imageUrl = extractImageUrl(thumbnail);
	        }
	        
	        if (title != "" && blogName != "" && urlValue != "" && imageUrl != "") {
	            Food food = new Food.Builder()
	                    .title(title)
	                    .blogName(blogName)
	                    .job(job)
	                    .simpleContent(simpleContent)
	                    .url(urlValue)
	                    .thumbnail(imageUrl)
	                    .build();
	            foodList.add(food);
	        }
	    }
		
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
	        String job = element.select("span.etc.highlight").text();	        
	        String simpleContent = element.select("p.dsc").text();
	        String urlValue = element.select("a.name_link").attr("href");
	        String imageUrl = element.select("img.bg_nimg").attr("src");
	        if (imageUrl.contains("data:image/gif")) {
				String thumbnail = element.select("div.detail_box div").first().select("a").first().html();
				imageUrl = extractImageUrl(thumbnail);
	        }
	        
	        if (title != "" && blogName != "" && urlValue != "" && imageUrl != "") {
	            Food food = new Food.Builder()
	                    .title(title)
	                    .blogName(blogName)
	                    .job(job)
	                    .simpleContent(simpleContent)
	                    .url(urlValue)
	                    .thumbnail(imageUrl)
	                    .build();
	            foodList.add(food);
	        }
	    }
		
		return foodList;
		
	}
	
	public String extractImageUrl(String html) {
       
        // data-lazysrc 속성의 값을 추출
        String regex = "data-lazysrc=\"([^\"]+)\"";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(html);
        
        if (matcher.find()) {
            return matcher.group(1);
        }
        
        return null;
	}

}
