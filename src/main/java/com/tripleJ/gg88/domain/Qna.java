package com.tripleJ.gg88.domain;

import java.sql.Timestamp;

public class Qna {

	private int qnaId;
	private int memberNo;
	private String title;
	private String content;
	private Timestamp date;
	private int view;
	private String category;
	
	public int getQnaId() {
		return qnaId;
	}
	
	public void setQnaId(int qnaId) {
		this.qnaId = qnaId;
	}
	
	public int getMemberNo() {
		return memberNo;
	}
	
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
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

}