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
<c:forEach begin="1" end="4" items="${mainNews}" var="list">
	<div class="article" data-newsurl="${list.newsUrl}">
		<c:if test="${not empty list.imgUrl}">
			<div class="articleImage">
				<img src="${list.imgUrl}" width="230px" style="border-radius: 5px" class="newsThumbnail">
			</div>
		</c:if>
		<div class="articleCompany">${list.writing}</div>
		<div class="articleTitle">${list.title}</div>
		<div class="articleContent">${list.content}</div>
	</div>
</c:forEach>
