<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<div class="exerciseContainer">
    <div class="bigContainer">
	    <a href="https://www.youtube.com/watch?v=${exercise[0].videoId}">
	        <img src="${exercise[0].url}" class="exerciseImage" src="${pageContext.request.contextPath}/resources/img/exerciseimg.png" width="500px">
	        <span class="bigSizeText">${exercise[0].title}</span>
        </a>
    </div>
    <div class="smallContainer">
        <c:forEach var="exercise" items="${exercise}" varStatus="loop" begin="1" end="4">
            <div class="exerciseLeft">
	            <a href="https://www.youtube.com/watch?v=${exercise.videoId}">
	                <img src="${exercise.url}" class="exerciseImage" src="${pageContext.request.contextPath}/resources/img/exerciseimg.png" width="200px">
	                <span class="exerciseText">${exercise.title}</span>
	            </a>
            </div>
        </c:forEach>
    </div>
</div>
