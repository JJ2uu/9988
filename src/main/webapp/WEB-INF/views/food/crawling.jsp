<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<c:forEach var="i" begin="1" end="${fn:length(foodList)}">
	<a href="${foodList[i-1].url}" class="food">
	    <img class="foodImage" src="${foodList[i-1].thumbnail}">
	    <div class="textContainer">
	        <div class="userWrap">
	            <div class="foodText" style="color: #407FBA;">${foodList[i-1].blogName}</div>
	            <div class="foodText" style="font-weight: 300; color: #407FBA;">${foodList[i-1].job}</div>
	        </div>
	        <div class="foodText" style="font-size: 18px;">${foodList[i-1].title}</div>
	        <div class="foodText" style="font-weight: 300; overflow-wrap: break-word;">${foodList[i-1].simpleContent}</div>
	    </div>
	</a>
</c:forEach>
