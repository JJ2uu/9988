<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/default_sub.css" rel="stylesheet" type="text/css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/favicon.ico">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/search_box.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/food.css" type="text/css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>99팔팔</title>
</head>
<script type="text/javascript">
function sendAjaxRequest() {
    $.ajax({
        url: "crawling",
        data: {
            Search: $("#foodSearchTitle").val()
        },
        success: function(x) {
            $("#contentWrap").html(x);
        }
    });
}

$(function() {

	$("#foodSearch").click(function() {
	    sendAjaxRequest();
	});

	$("#foodSearchTitle").on("keydown", function(event) {
	    if (event.keyCode === 13) { // Enter 키를 눌렀을 때
	        sendAjaxRequest();
	    }
	});

	
});
</script>
<body>
	<div id="wrap">
		<div id="header">
			<jsp:include page="/default/header.jsp" flush="true">
				<jsp:param name="mode" value="1" />
			</jsp:include>
		</div>
		<div id="content_wrap">
			<div id="content">
				<div id="foodMain">
					<div class="subheading" style="margin-bottom: 20px;">
						<span style="font-size: 24px; font-weight: bolder; margin-bottom: 30px">뭐 먹을까요? <img alt="!" src="${pageContext.request.contextPath}/resources/img/food.svg" width="30px"></span>
					</div>
					<div class="search">
						<input id="foodSearchTitle" type="text" placeholder="식재료, 가지고 있는 질병, 예방하고 싶은 질병 등으로 검색">
						<img alt="돋보기 아이콘" id="foodSearch" src="${pageContext.request.contextPath}/resources/img/Vector.png">
					</div>
					<div style="margin-top: 50px;" id="contentWrap">
						<c:forEach var="i" begin="1" end="${fn:length(foodList)}">
							<a href="${foodList[i-1].url}" class="food">
							    <img class="foodImage" src="${foodList[i-1].thumbnail}">
							    <span class="textContainer">
							        <span class="userWrap">
							            <span class="foodText" style="color: #407FBA;">${foodList[i-1].blogName}</span>
							            <span class="foodText" style="font-weight: 300; color: #407FBA;">${foodList[i-1].job}</span>
							        </span>
							        <span class="foodText" style="font-size: 18px;">${foodList[i-1].title}</span>
							        <span class="foodText" style="font-weight: 300; overflow-wrap: break-word;">${foodList[i-1].simpleContent}</span>
							    </span>
							</a>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="/default/footer.jsp" flush="true" />
	</div>
</body>
</html>