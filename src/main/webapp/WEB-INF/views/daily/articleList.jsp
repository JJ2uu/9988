<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach items="${newsList}" var="list">
	<div class="article">
		<div class="article_thumbnail">
			<a href="${list.newsUrl}">
				<img src="${list.imgUrl}">
			</a>
		</div>
		<div class="article_info">
			<div style="display: flex; flex-flow: column; gap: 5px;">
				<a href="${list.newsUrl}">
					<span class="article_title">${list.title}</span>
					<span class="article_content">${list.content}</span>
				</a>
			</div>
			<div style="display: flex; margin-top: 10px; gap: 5px;">
				<span class="article_writer">${list.writing}</span>
				<span class="article_time">${list.date}</span>
			</div>
		</div>
	</div>
</c:forEach>