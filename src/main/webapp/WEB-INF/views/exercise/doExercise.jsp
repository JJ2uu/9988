<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/default_sub.css"
	rel="stylesheet" type="text/css">
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/favicon.ico">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/search_box.css" type="text/css">
<title>99팔팔</title>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<jsp:include page="/default/header.jsp" flush="true">
				<jsp:param name="mode" value="1" />
			</jsp:include>
		</div>
		<div id="content_wrap">
			<div id="content">
				<!-- 이 content div 안에서  작업 시작-->
				<div class="subheading" style="margin-bottom: 30px;">
					<span style="font-size: 24px; font-weight: bolder; margin-bottom: 20px">운동해요</span>
					<img src="${pageContext.request.contextPath}/resources/img/stretching.png" width="16px">
				</div>
				<div class="search"
					style="">
					<input type="text" placeholder="증상에 대한 검색어를 입력하세요."> 
					<a href="#"> <img alt="돋보기 아이콘"
						src="${pageContext.request.contextPath}/resources/img/Vector.png">
					</a>
				</div>
			</div>
		</div>
		<jsp:include page="/default/footer.jsp" flush="true" />
	</div>
</body>
</html>