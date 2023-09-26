package com.tripleJ.gg88.domain;

import java.util.Date;

public class Emergency {

	private int emergencyId;
	private int memberNo; 
	private String title; //게시판 제목
	private String content; //내용
	private int commendCount; //추천수
	private Date regdate; //작성일자
	private Date updatedate; //수정일자
	private String imgFile;
	
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
	
	public String getImgFile() {
		return imgFile;
	}

	public void setImgFile(String imgFile) {
		this.imgFile = imgFile;
	}

	@Override
	public String toString() {
		return "Emergency [emergencyId=" + emergencyId + ", memberNo=" + memberNo + ", title=" + title + ", content="
				+ content + ", commendCount=" + commendCount + ", regdate=" + regdate + ", updatedate=" + updatedate
				+ ", imgFile=" + imgFile + "]";
	}

}