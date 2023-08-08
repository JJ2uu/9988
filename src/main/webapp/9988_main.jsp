<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap" rel="stylesheet">
<link href="resources/css/default.css" rel="stylesheet" type="text/css">
<link rel="shortcut icon" href="resources/favicon.ico">
<title>99팔팔</title>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<jsp:include page="default/header.jsp" flush="true">
				<jsp:param name="mode" value="1"/>
			</jsp:include>
		</div>
		<div id="main_banner">
			<div id="banner_text">
				<p style="color: #fff; font-weight: 100;">
					<b style="color: #fff; font-weight: 500;">건강정보</b>부터
					<b style="color: #fff; font-weight: 500;">식단</b>까지
				</p>
				<img src="resources/img/logo_white.svg" width="160px">
				<p style="color: #fff; font-weight: 100;">증상별 맞춤 케어 및 건강 정보를 제공합니다.</p>
			</div>
			<img src="resources/img/health.png" width="400px">
		</div>
		<div id="content_wrap">
			<div id="content">
				<!-- 이 content div 안에서  작업 시작-->
			</div>
		</div>
		<jsp:include page="default/footer.jsp" flush="true"/>
	</div>
</body>
</html>