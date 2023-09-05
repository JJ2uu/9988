package com.tripleJ.gg88.domain;

import java.sql.Timestamp;

public class Food {

	private int foodId;
	private String title;
	private String content;
	private Timestamp date;
	private int view;
	private String category;
	private String link;
	
	public int getFoodId() {
		return foodId;
	}
	
	public void setFoodId(int foodId) {
		this.foodId = foodId;
	}
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
	
	public Timestamp getDate() {
		return date;
	}
	
	public void setDate(Timestamp date) {
		this.date = date;
	}
	
	public int getView() {
		return view;
	}
	
	public void setView(int view) {
		this.view = view;
	}
	
	public String getCategory() {
		return category;
	}
	
	public void setCategory(String category) {
		this.category = category;
	}
	
	public String getLink() {
		return link;
	}
	
	public void setLink(String link) {
		this.link = link;
	}

}