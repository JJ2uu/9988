<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
.exerciseText {
    max-width: 200px; /* 원하는 최대 너비 설정 */
    white-space: nowrap; /* 글자 줄바꿈 방지 */
    overflow: hidden; /* 넘치는 내용 감춤 */
    text-overflow: ellipsis; /* 생략 부호 표시 */
    font-weight: bold;
    text-align: center;
}
.bigSizeText{
	max-width: 500px; /* 원하는 최대 너비 설정 */
    white-space: nowrap; /* 글자 줄바꿈 방지 */
    overflow: hidden; /* 넘치는 내용 감춤 */
    text-overflow: ellipsis; /* 생략 부호 표시 */
    font-weight: bold;
    text-align: center;
    font-size: 18px;
}
.exerciseImage{
	border-radius: 5px;
}
.exerciseContainer{
    display: flex;
    justify-content: space-around;
    gap: 50px;
    align-items: center;
}
.bigContainer{
    margin-left: 20px;
}
.smallContainer{
    display: flex;
    flex-wrap: wrap;
    gap: 30px;
    justify-content: space-around;
    width: 500px;
}
</style>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<div class="exerciseContainer">
    <div class="bigContainer">
	    <a href="https://www.youtube.com/watch?v=${exercise[0].videoId}">
	        <img src="${exercise[0].url}" class="exerciseImage" src="${pageContext.request.contextPath}/resources/img/exerciseimg.png" width="500px">
	        <div class="bigSizeText">${exercise[0].title}</div>
        </a>
    </div>
    <div class="smallContainer">
        <c:forEach var="exercise" items="${exercise}" varStatus="loop" begin="1" end="4">
            <div class="exerciseLeft">
	            <a href="https://www.youtube.com/watch?v=${exercise.videoId}">
	                <img src="${exercise.url}" class="exerciseImage" src="${pageContext.request.contextPath}/resources/img/exerciseimg.png" width="200px">
	                <div class="exerciseText">${exercise.title}</div>
	            </a>
            </div>
        </c:forEach>
    </div>
</div>
