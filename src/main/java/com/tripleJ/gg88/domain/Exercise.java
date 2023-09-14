package com.tripleJ.gg88.domain;

public class Exercise {
	private String uploadDate;
	private Thumbnail thumbnail;
	private String title;
	private String description;
	private String videoId;
	
	public String getUploadDate() {
		return uploadDate;
	}
	public void setUploadDate(String uploadDate) {
		this.uploadDate = uploadDate;
	}
	public Thumbnail getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(Thumbnail thumbnail) {
		this.thumbnail = thumbnail;
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

	@Override
	public String toString() {
		return "Exercise [uploadDate=" + uploadDate + ", thumbnail=" + thumbnail + ", title=" + title + ", description="
				+ description + ", videoId=" + videoId + "]";
	}

	public static class Thumbnail{
		private int width;
		private int heigth;
		private String url;
		
		public int getWidth() {
			return width;
		}
		public void setWidth(int width) {
			this.width = width;
		}
		public int getHeigth() {
			return heigth;
		}
		public void setHeigth(int heigth) {
			this.heigth = heigth;
		}
		public String getUrl() {
			return url;
		}
		public void setUrl(String url) {
			this.url = url;
		}
		
		@Override
		public String toString() {
			return "Thumbnail [width=" + width + ", heigth=" + heigth + ", url=" + url + "]";
		}
		
	}
}
