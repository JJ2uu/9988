<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<script>
	$(document).ready(function() {
	    var slideIndex = 0;
	    showSlides(slideIndex);
	    
	    $(".prev").click(function() {
	        showSlides(slideIndex -= 1);
	        console.log(slideIndex);
	    });
	    
	    $(".next").click(function() {
	        showSlides(slideIndex += 1);
	        console.log(slideIndex);
	    });
	    
	    function showSlides(n) {
	        var slides = $(".slideshow-container .slide");
	        if (n < 0) {
	            slideIndex = slides.length - 1;
	        } else if (n >= slides.length) {
	            slideIndex = 0;
	        }
	        slides.hide();
	        slides.eq(slideIndex).show();
	    }
	    var slideIndex = 0;
        showSlides(slideIndex);
        
	    $(".slide img").each(function(index, element) {
            var imgElement = $(element);
            var currentSrc = imgElement.attr("src");
            var newSrc = getImageUrl(currentSrc); // getImageUrl 함수를 사용하여 URL을 수정합니다.
            imgElement.attr("src", newSrc); // 수정된 URL을 이미지에 설정합니다.
        });
	});
	
	function getImageUrl(fullUrl) {
        const questionMarkIndex = fullUrl.indexOf('?');
        if (questionMarkIndex !== -1) {
            return fullUrl.substring(0, questionMarkIndex)+"?type=f&w=480&h=200";
        } else {
            return "${pageContext.request.contextPath}/resources/img/logo.svg?type=f&w=480&h=200";
        }
    }

</script>
<div class="slideshow-container">
    <c:forEach var="emergency" items="${emergencyList}" varStatus="status">
        <div class="slide">
            <a href="${pageContext.request.contextPath}/emergency/board?emergencyId=${emergency.emergencyId}">
                <img alt="응급상황 사진" align="left" src="${emergency.imgFile}" width="480px;" height="200px;" onerror="this.src='${pageContext.request.contextPath}/resources/img/logo.svg'">
                <span class="emergencyTitle">${emergency.title}</span>
            </a>
        </div>
    </c:forEach>
    <span class="material-symbols-outlined prev">arrow_back_ios</span>
    <span class="material-symbols-outlined next">arrow_forward_ios</span>
</div>
