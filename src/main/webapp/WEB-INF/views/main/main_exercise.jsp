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
.grid-container {
  display: grid;
  gap: 10px;
  place-items: center;
}

.grid-item {
  text-align: center;
  font-size: 14px;
}

.item1 {
  grid-column: 1 / span 2;
  grid-row: 1 / span 2;
}

.item2 {
  grid-column: 3;
  grid-row: 1;
}

.item4 {
  grid-column: 4;
  grid-row: 1;
}
.exerciseText {
    max-width: 240px; /* 원하는 최대 너비 설정 */
    white-space: nowrap; /* 글자 줄바꿈 방지 */
    overflow: hidden; /* 넘치는 내용 감춤 */
    text-overflow: ellipsis; /* 생략 부호 표시 */
    font-weight: bold;
    text-align: center;
}
.bigSizeText{
	max-width: 510px; /* 원하는 최대 너비 설정 */
    white-space: nowrap; /* 글자 줄바꿈 방지 */
    overflow: hidden; /* 넘치는 내용 감춤 */
    text-overflow: ellipsis; /* 생략 부호 표시 */
    font-weight: bold;
    text-align: center;
}
.exerciseImage{
	border-radius: 5px;
}
</style>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<body>
<div class="grid-container">
  <div class="grid-item item1 bigSize"><img class="exerciseImage bigImage" src="${pageContext.request.contextPath}/resources/img/exerciseimg.png" width="520px" height="380px">
<div class="bigSizeText">[ENG]딱 20분 하루 운동 끝장내는 전신운동과 올인원루틴</div></div>
  <div class="grid-item item2"><img class="exerciseImage" src="${pageContext.request.contextPath}/resources/img/exerciseimg.png" width="250px" height="180px">
		<div class="exerciseText">[ENG]딱 20분 하루 운동 끝장내는 전신운동과 올인원루틴</div></div>
  <div class="grid-item item3"><img class="exerciseImage" src="${pageContext.request.contextPath}/resources/img/exerciseimg.png" width="250px" height="180px">
		<div class="exerciseText">[ENG]딱 20분 하루 운동 끝장내는 전신운동과 올인원루틴</div></div>  
  <div class="grid-item item4"><img class="exerciseImage" src="${pageContext.request.contextPath}/resources/img/exerciseimg.png" width="250px" height="180px">
		<div class="exerciseText">[ENG]딱 20분 하루 운동 끝장내는 전신운동과 올인원루틴</div></div>
  <div class="grid-item item5"><img class="exerciseImage" src="${pageContext.request.contextPath}/resources/img/exerciseimg.png" width="250px" height="180px">
		<div class="exerciseText">[ENG]딱 20분 하루 운동 끝장내는 전신운동과 올인원루틴</div></div>
</div>
</body>
</html>