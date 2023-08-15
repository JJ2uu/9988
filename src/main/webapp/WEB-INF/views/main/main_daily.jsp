<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap" rel="stylesheet">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/favicon.ico">
<style type="text/css">
.article{
	align-content: center;
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
}
</style>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<c:forEach var="i" begin="1" end="4">
	<div class="article">
		<img class="articleImage" alt="기사썸네일" src="${pageContext.request.contextPath}/resources/img/articleimg.jpg" width="250px" height="200px">
		<div class="articleCompany">한국경제 TV</div>
		<div class="articleTitle">열나면서 고개 숙이기 어렵다면? 감기 아닌 '뇌수막염'</div>
		<div class="articleContent">38도 이상의 고열, 두통, 오한 증상이 나타나면 대부분의 사람들은 ...</div>
	</div>
</c:forEach>
</html>