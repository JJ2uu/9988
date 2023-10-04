package com.tripleJ.gg88.service;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.jsoup.select.Evaluator.IsEmpty;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.tripleJ.gg88.domain.Daily;

@Service
public class DailyServiceImpl implements DailyService{
	
	public int articleCnt() {
		try {
			Date currentDate = new Date();
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
			String formattedDate = dateFormat.format(currentDate);
			
			String url = "https://news.naver.com/main/list.naver?mode=LS2D&sid2=241&mid=shm&sid1=103&date=" + formattedDate + "&page=";
			
			Document doc = Jsoup.connect(url+"1").get();
			
			Element pageNavigation = doc.select(".paging").first();
			Elements pageLinks = pageNavigation.select("a");
			
			int maxPage = 1;
			for (Element pageLink : pageLinks) {
			    try {
			        int pageCnt = Integer.parseInt(pageLink.text());
			        maxPage = Math.max(maxPage, pageCnt);
			    } catch (NumberFormatException e) {
			    	
			    }
			}
			return maxPage;
		} catch (IOException e) {
			e.printStackTrace();
			return 0;
		}
	}

	public List<Daily> articleList(int page, Model model) {
		List<Daily> currentPageNews = new ArrayList<Daily>();
		try {
			Date currentDate = new Date();
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
	        String formattedDate = dateFormat.format(currentDate);
			
			String url = "https://news.naver.com/main/list.naver?mode=LS2D&sid2=241&mid=shm&sid1=103&date=" + formattedDate + "&page=";
			
			Document doc = Jsoup.connect(url+page).get();
			Elements newsLinks = doc.select(".list_body ul li");
			int index = 0;
			for (Element link : newsLinks) {
				Element titleElement = link.select("dt a").first();
				Element contentElement = link.select("dd").first();
				Element imageElement = titleElement.select("img").first();
				String title = "";
				String imgUrl = "";
				if (imageElement != null) {
					title = imageElement.attr("alt");
					imgUrl = imageElement.attr("src");
				} else {
					title = titleElement.text();
				}
				String newsUrl = titleElement.attr("href");
				String content = contentElement.select("span.lede").text();
				String writing = contentElement.select("span.writing").text();
				String date = contentElement.select("span.date").text();
				
				Daily daily = new Daily();
				daily.setTitle(title);
				daily.setContent(content);
				daily.setWriting(writing);
				daily.setNewsUrl(newsUrl);
				daily.setImgUrl(imgUrl);
				daily.setDate(date);
				
				currentPageNews.add(index, daily);
				index++;
			}
			model.addAttribute("newsList", currentPageNews);
			return currentPageNews;
		} catch (IOException e) {
			e.printStackTrace();
			return currentPageNews;
		}
	}
	
	public void articleDetail(String newsUrl, Model model) {
		try {
			Document doc = Jsoup.connect(newsUrl).get();
			Element media = doc.select("a.media_end_head_top_logo img").first();
			String mediaLogo = "";
			if (media != null) {
				mediaLogo = media.attr("src");
			}
			
			Element headLine = doc.select("h2.media_end_head_headline span").first();
			String title = headLine.text();
			
			Element dateStamp = doc.select("span.media_end_head_info_datestamp_time").first();
			String date = dateStamp.text();
			
			Element article = doc.select("div#newsct_article").first();
			String content = article.html();
			String modifiedContent = content.replace("data-src", "src");
			
			Element write = doc.select("div.byline p span.byline_s").first();
			String wrtier = "";
			if (write != null) {
				wrtier = write.text();
			}
			
			model.addAttribute("newsUrl", newsUrl);
			model.addAttribute("mediaLogo", mediaLogo);
			model.addAttribute("title", title);
			model.addAttribute("date", date);
			model.addAttribute("content", modifiedContent);
			model.addAttribute("wrtier", wrtier);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public void mainArticle(int page, Model model) {
		List<Daily> news = articleList(page, model);
		List<Daily> mainNews = new ArrayList<Daily>();
		for (Daily list : news) {
			if (list.getImgUrl()!= "") {
				String imgUrl = list.getImgUrl();
				int idx = imgUrl.indexOf("?");
				String thumbUrl = imgUrl.substring(0, idx);
				list.setImgUrl(thumbUrl);
				mainNews.add(list);
			}
		}
		model.addAttribute("mainNews", mainNews);
	}
}