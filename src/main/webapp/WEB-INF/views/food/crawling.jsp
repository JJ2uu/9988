<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>

<c:forEach var="i" begin="1" end="${fn:length(foodList)}">
	<div class="food">
	<a href="${foodList[i-1].url}">
		<img class="foodImage" src="${foodList[i-1].thumbnail}"></a>
		<div class="textContainer">
			<div class="foodText">${foodList[i-1].blogName}</div>
			<div class="foodText" style="font-weight: normal;">${foodList[i-1].title}</div>
		</div>
	</div>
</c:forEach>
