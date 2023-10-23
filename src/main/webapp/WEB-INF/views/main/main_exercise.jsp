<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<c:forEach var="exercise" items="${exercise}" varStatus="loop" begin="0" end="7">
    <div class="exerciseLeft">
	    <a href="https://www.youtube.com/watch?v=${exercise.videoId}">
	        <img src="${exercise.url}" class="exerciseImage" src="${pageContext.request.contextPath}/resources/img/exerciseimg.png">
	        <span class="exerciseText">${exercise.title}</span>
	    </a>
    </div>
</c:forEach>

