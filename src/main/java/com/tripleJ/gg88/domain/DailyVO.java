package com.tripleJ.gg88.domain;

import java.sql.Timestamp;

public class DailyVO {

	private int dailyNo;
	private String company;
	private String title;
	private String content;
	private Timestamp date;
	private int view;
	private String img;
	
	public int getDailyNo() {
		return dailyNo;
	}
	
	public void setDailyNo(int dailyNo) {
		this.dailyNo = dailyNo;
	}
	
	public String getCompany() {
		return company;
	}
	
	public void setCompany(String company) {
		this.company = company;
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
	
	public String getImg() {
		return img;
	}
	
	public void setImg(String img) {
		this.img = img;
	}
	
}