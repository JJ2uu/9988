package com.tripleJ.gg88.domain;

import java.sql.Timestamp;

public class QnaReplyVO {

	private int replyId;
	private int memberNo;
	private int qnaId;
	private String content;
	private Timestamp date;
	private int replyClass;
	private int groupId;
	
	public int getReplyId() {
		return replyId;
	}
	
	public int getReplyClass() {
		return replyClass;
	}

	public void setReplyClass(int replyClass) {
		this.replyClass = replyClass;
	}

	public int getGroupId() {
		return groupId;
	}

	public void setGroupId(int groupId) {
		this.groupId = groupId;
	}

	public void setReplyId(int replyId) {
		this.replyId = replyId;
	}
	
	public int getMemberNo() {
		return memberNo;
	}
	
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	
	public int getQnaId() {
		return qnaId;
	}
	
	public void setQnaId(int qnaId) {
		this.qnaId = qnaId;
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
	
}