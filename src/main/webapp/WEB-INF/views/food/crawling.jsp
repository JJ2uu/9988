<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<c:forEach var="i" begin="1" end="${fn:length(foodList)}">
	<a href="${foodList[i-1].url}" class="food" target="_blank">
	    <img class="foodImage" src="${foodList[i-1].thumbnail}">
	    <span class="textContainer">
	        <span class="userWrap">
	            <span class="foodText" style="color: #407FBA;">${foodList[i-1].blogName}</span>
	            <span class="foodText" style="font-weight: 400; color: #407FBA;">${foodList[i-1].job}</span>
	        </span>
	        <span class="foodText" style="font-size: 18px;">${foodList[i-1].title}</span>
	        <span class="foodText" style="font-weight: 400; overflow-wrap: break-word;">${foodList[i-1].simpleContent}</span>
	    </span>
	</a>
</c:forEach>
