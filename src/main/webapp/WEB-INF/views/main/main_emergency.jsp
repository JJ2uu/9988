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
	});

</script>
<div class="slideshow-container">
    <c:forEach var="emergency" items="${emergencyList}" varStatus="status">
        <div class="slide">
            <a href="${pageContext.request.contextPath}/emergency/board?emergencyId=${emergency.emergencyId}">
                <img alt="응급상황 사진" align="left" src="http://zdvkzxzhpbmk19765281.cdn.ntruss.com/070b44a0-d59e-483c-ba7c-10ec07b3026b_test_newsImg.jpg?type=f&w=480&h=200">
                <span class="emergencyTitle">${emergency.title}</span>
            </a>
        </div>
    </c:forEach>
    <span class="material-symbols-outlined prev">arrow_back_ios</span>
    <span class="material-symbols-outlined next">arrow_forward_ios</span>
</div>
