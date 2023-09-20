<%@page import="com.tripleJ.gg88.domain.Daily"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(function() {
		$(".article").click(function() {
			let newsUrl = $(this).data("newsurl");
			
			window.location.href = "${pageContext.request.contextPath}/daily/articleDetail.jsp?newsUrl=" + newsUrl;
		})
	})
</script>
<c:forEach items="${newsList}" var="list">
	<div class="article" data-newsurl="${list.newsUrl}">
		<c:if test="${not empty list.imgUrl}">
			<div class="article_thumbnail">
				<img src="${list.imgUrl}">
			</div>
		</c:if>
		<div class="article_info">
			<div style="display: flex; flex-flow: column; gap: 5px;">
				<span class="article_title">${list.title}</span>
				<span class="article_content">${list.content}</span>
			</div>
			<div style="display: flex; margin-top: 10px; gap: 5px;">
				<span class="article_writer">${list.writing}</span>
				<span class="article_time">${list.date}</span>
			</div>
		</div>
	</div>
</c:forEach>