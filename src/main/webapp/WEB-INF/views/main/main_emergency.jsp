<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<style>
    .slideshow-container {
        position: relative;
        max-width: 400px;
        margin: auto;
        display: inline-block;
    }

    .slideshow-container img {
        display: none;
        width: 100%;
        height: auto;
        border-radius: 10px;
        overflow: hidden;
    }
    .material-symbols-outlined {
    	margin-top: 10px;
    	position: absolute;
    	top: 50%;
    	transform: translateY(-50%);
    	cursor: pointer;
    	z-index: 1;
    }
    .prev {
            left: 10px; 
        }

    .next {
        right: 10px;
    }
</style>
<script>
    $(document).ready(function() {
        var slideIndex = 0;
        showSlides(slideIndex);
        
        $(".prev").click(function() {
            showSlides(slideIndex -= 1);
            console.log("-1");
        });
        
        $(".next").click(function() {
            showSlides(slideIndex += 1);
            console.log("1");
        });
        
        function showSlides(n) {
            var slides = $(".slideshow-container img");
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
    <c:forEach var="emergencyList" items="${emergencyList}" begin="1" end="4">
    	<a href="${pageContext.request.contextPath}/emergency/board?emergencyId=${emergencyList.emergencyId}">
			<img width="400px" height="250px" alt="응급상황 사진" align="left" src="${pageContext.request.contextPath}/resources/img/test_img.png"> 
		</a>
    </c:forEach>
	<span class="material-symbols-outlined prev">arrow_back_ios</span>
	<span class="material-symbols-outlined next">arrow_forward_ios</span>
</div>
