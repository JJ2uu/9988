package com.tripleJ.gg88.domain;

import java.util.Date;

public class EmergencyVO {

	private int emergencyId;
	private int memberNo;
	private String title;
	private String content;
	private int commendCount;
	private Date regdate;
	private Date updatedate;
	private int isYn;
	
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
	
	public int getCommendCount() {
		return commendCount;
	}
	
	public void setCommendCount(int commendCount) {
		this.commendCount = commendCount;
	}
	
	public Date getRegdate() {
		return regdate;
	}
	
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	public Date getUpdatedate() {
		return updatedate;
	}
	
	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}
	
	public int getIsYn() {
		return isYn;
	}
	
	public void setIsYn(int isYn) {
		this.isYn = isYn;
	}
	
}