package com.tripleJ.gg88.domain;

import java.util.Date;

public class EmergencyReply {

	private int replyId;
	private int emergencyId;
	private int memberNo;
	private String content;
	private int commend_count;
	private Date regdate;
	
	public int getReplyId() {
		return replyId;
	}
	
	public void setReplyId(int replyId) {
		this.replyId = replyId;
	}
	
	public int getEmergencyId() {
		return emergencyId;
	}
	
	public void setEmergencyId(int emergencyId) {
		this.emergencyId = emergencyId;
	}
	
	public int getMemberNo() {
		return memberNo;
	}
	
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	
	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
	
	public int getCommend_count() {
		return commend_count;
	}
	
	public void setCommend_count(int commend_count) {
		this.commend_count = commend_count;
	}
	
	public Date getRegdate() {
		return regdate;
	}
	
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
}