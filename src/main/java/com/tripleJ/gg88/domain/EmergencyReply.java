package com.tripleJ.gg88.domain;

public class EmergencyReply {

	private int replyId;
	private int emergencyId;
	private int memberNo;
	private String userId;
	private String nickName;
	private String content;
	private int commend_count;
	private String regdate;
	
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
	
	public String getRegdate() {
		return regdate;
	}
	
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	@Override
	public String toString() {
		return "EmergencyReply [replyId=" + replyId + ", emergencyId=" + emergencyId + ", memberNo=" + memberNo
				+ ", userId=" + userId + ", nickName=" + nickName + ", content=" + content + ", commend_count="
				+ commend_count + ", regdate=" + regdate + "]";
	}

}