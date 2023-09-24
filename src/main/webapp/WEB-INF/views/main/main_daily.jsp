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
<style type="text/css">
.article{
	align-content: center;
	cursor: pointer;
}

.articleImage {
    border-radius: 5px;
}
.articleTitle {
    max-width: 250px; /* 원하는 최대 너비 설정 */
    white-space: nowrap; /* 글자 줄바꿈 방지 */
    overflow: hidden; /* 넘치는 내용 감춤 */
    text-overflow: ellipsis; /* 생략 부호 표시 */
    font-weight: bold;
}
.articleContent {
    max-width: 250px; /* 원하는 최대 너비 설정 */
    white-space: nowrap; /* 글자 줄바꿈 방지 */
    overflow: hidden; /* 넘치는 내용 감춤 */
    text-overflow: ellipsis; /* 생략 부호 표시 */
}
.articleCompany {
    color: #407FBA;
    font-weight: 500;
    text-align: left;
    padding-bottom: 5px;
    padding-top: 5px;
}
</style>
<c:forEach begin="1" end="4" items="${newsList}" var="list">
	<div class="article" data-newsurl="${list.newsUrl}">
		<c:if test="${not empty list.imgUrl}">
			<div class="articleImage">
				<img src="${list.imgUrl}" width="230px" style="border-radius: 5px">
			</div>
		</c:if>
		<div class="articleCompany">${list.writing}</div>
		<div class="articleTitle">${list.title}</div>
		<div class="articleContent">${list.content}</div>
	</div>
</c:forEach>
