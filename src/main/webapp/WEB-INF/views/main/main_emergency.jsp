<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/favicon.ico">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
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
        border-radius: 50px;
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
</head>
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
<body>
	<div class="slideshow-container">
	    <c:forEach var="i" begin="1" end="4">
	        <img width="400px" height="250px" src="${pageContext.request.contextPath}/resources/img/emergency.png">
	    </c:forEach>
		 <span class="material-symbols-outlined prev">arrow_back_ios</span>
		 <span class="material-symbols-outlined next">arrow_forward_ios</span>
 	</div>
</body>
</html>