package com.tripleJ.gg88.domain;

public class Exercise {
	private String uploadDate;
	private String title;
	private String description;
	private String videoId;
	private String category;
	private int width;
	private int height;
	private String url;
	
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getUploadDate() {
		return uploadDate;
	}
	public void setUploadDate(String uploadDate) {
		this.uploadDate = uploadDate;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getVideoId() {
		return videoId;
	}
	public void setVideoId(String videoId) {
		this.videoId = videoId;
	}
	public int getWidth() {
		return width;
	}
	public void setWidth(int width) {
		this.width = width;
	}
	public int getHeight() {
		return height;
	}
	public void setHeight(int height) {
		this.height = height;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
	@Override
	public String toString() {
		return "Exercise [uploadDate=" + uploadDate + ", title=" + title + ", description="
				+ description + ", videoId=" + videoId + ", category=" + category + ", width=" + width + ", height="
				+ height + ", url=" + url + "]";
	}
	
}
