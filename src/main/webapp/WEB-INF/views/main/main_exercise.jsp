<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
.exerciseText {
    max-width: 220px; /* 원하는 최대 너비 설정 */
    white-space: nowrap; /* 글자 줄바꿈 방지 */
    overflow: hidden; /* 넘치는 내용 감춤 */
    text-overflow: ellipsis; /* 생략 부호 표시 */
    font-weight: bold;
    text-align: center;
}
.bigSizeText{
	max-width: 520px; /* 원하는 최대 너비 설정 */
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
    margin-left: 10px;
}
.smallContainer{
    display: flex;
    flex-wrap: wrap;
    gap: 35px;
    justify-content: space-evenly;
}
</style>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<div class="exerciseContainer">
	<div class="bigContainer">
	  	<img class="exerciseImage bigImage" src="${pageContext.request.contextPath}/resources/img/exerciseimg.png" width="520px">
		<div class="bigSizeText">[ENG]딱 20분 하루 운동 끝장내는 전신운동과 올인원루틴</div>
	</div>
	<div class="smallContainer">
		<c:forEach var="i" begin="1" end="4">
			<div class="exerciseLeft">
				<img class="exerciseImage" src="${pageContext.request.contextPath}/resources/img/exerciseimg.png" width="220px">
				<div class="exerciseText">[ENG]딱 20분 하루 운동 끝장내는 전신운동과 올인원루틴</div></div>
		</c:forEach>
	</div>
</div>
