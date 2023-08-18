<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/default_sub.css" rel="stylesheet" type="text/css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/favicon.ico">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/search_box.css" type="text/css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>99팔팔</title>
</head>
<style>
.food {
    position: relative;
    display: inline-block;
    margin: 10px;
    cursor: pointer;
    background: #000;
    border-radius: 5px;
}

.foodImage {
    width: 250px;
    border-radius: 5px;
}

.foodImage:hover {
    opacity: 30%;
}

.textContainer {
    position: absolute;
    top: 50%; /* 부모 요소의 중앙에 배치 */
    left: 50%; /* 부모 요소의 중앙에 배치 */
    transform: translate(-50%, -50%); /* 요소의 중앙 정렬을 위한 이동 */
    padding: 10px;
    text-align: center;
    pointer-events: none; /* 이벤트를 요소에 적용하지 않도록 설정 */
    display: none; /* 초기에는 표시하지 않음 */
}
.food:hover .textContainer {
    display: block; /* 호버 시 텍스트를 표시 */
}
.foodText {
    color: white;
    font-weight: bold;
    font-size: 16px;
}
#foodMain {
    display: flex;
    flex-direction: column;
    align-items: center;
}
.paging button {
	background-color: white;
	color: #000000;
	border: 1px solid;
	width: 40px;
	height: 40px;
	margin-top: 70px;
}

.paging {
	display: flex;
	justify-content: center;
	margin-left: 88px;
}
</style>
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
					<div class="subheading" style="margin-bottom: 10px;">
						<span style="font-size: 24px; font-weight: bolder; margin-bottom: 20px">뭐 먹을까요?</span>
					</div>
					<div class="search" style="">
						<input type="text" placeholder="증상에 대한 검색어를 입력하세요."> <a href="#"> 
						<img alt="돋보기 아이콘" src="${pageContext.request.contextPath}/resources/img/Vector.png">
						</a>
					</div>
					<div style="margin-top: 50px;">
						<c:forEach var="i" begin="1" end="6">
							<div class="food">
								<img class="foodImage" src="${pageContext.request.contextPath}/resources/img/foodimg.png">
								<div class="textContainer">
									<div class="foodText">행복한 주방</div>
									<div class="foodText" style="font-weight: normal;">맛있는 떡볶이</div>
								</div>
							</div>
						</c:forEach>
					</div>
					<div class="paging">
						<button type="button">1</button>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="/default/footer.jsp" flush="true" />
	</div>
</body>
</html>