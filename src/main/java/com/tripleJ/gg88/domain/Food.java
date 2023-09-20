package com.tripleJ.gg88.domain;

import java.sql.Timestamp;

public class Food {
    private int foodId;
    private String title;
    private String blogName;
    private Timestamp date;
    private String url;
    private String thumbnail;

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

    public String getBlogName() {
        return blogName;
    }

    public void setBlogName(String blogName) {
        this.blogName = blogName;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    // Builder 클래스 추가
    public static class Builder {
        private int foodId;
        private String title;
        private String blogName;
        private Timestamp date;
        private String url;
        private String thumbnail;

        public Builder foodId(int foodId) {
            this.foodId = foodId;
            return this;
        }

        public Builder title(String title) {
            this.title = title;
            return this;
        }

        public Builder blogName(String blogName) {
            this.blogName = blogName;
            return this;
        }

        public Builder date(Timestamp date) {
            this.date = date;
            return this;
        }

        public Builder url(String url) {
            this.url = url;
            return this;
        }

        public Builder thumbnail(String thumbnail) {
            this.thumbnail = thumbnail;
            return this;
        }

        public Food build() {
            Food food = new Food();
            food.setFoodId(this.foodId);
            food.setTitle(this.title);
            food.setBlogName(this.blogName);
            food.setDate(this.date);
            food.setUrl(this.url);
            food.setThumbnail(this.thumbnail);
            return food;
        }
    }
}

