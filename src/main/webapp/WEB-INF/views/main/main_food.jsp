<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach var="i" begin="1" end="4">
	<a href="${foodList[i-1].url}"  class="food">
		<img class="foodImage" src="${foodList[i-1].thumbnail}">
		<div class="textContainer">
			<div class="foodText">${foodList[i-1].blogName}</div>
			<div class="foodText" style="font-weight: normal;">${foodList[i-1].title}</div>
		</div>
	</a>
</c:forEach>
