<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/default_sub.css" rel="stylesheet" type="text/css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/favicon.ico">
<style type="text/css">
hr {
    background:#E9E9E9;
    color: #E9E9E9; 
    border: 300; 
    width: 85%
}

#commend_div{
	display: inline-block; 
	padding: 5px; 
	border: solid 1px #ccc; 
	background-color: transparent;; 
	font-size: 9pt; 
	width: 70%;
    border-radius: 15px;
}

.commend{
	 background-color: transparent; 
	 width: 90%;
	 padding: 3px; 
	 border: 0; 
	 font-size: 9pt; 
}

.send_btn{ 
	background-color: transparent;
	width: 50px; 
	padding: 3px; 
	border: none;
	font-size: 9pt; 
	float: right;
}
</style>
<title>99팔팔</title>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<jsp:include page="/default/header.jsp" flush="true">
				<jsp:param name="mode" value="1"/>
			</jsp:include>
		</div>
		<div id="content_wrap">
			<div id="content">
				<!-- 이 content div 안에서  작업 시작-->
				<div style="width: 1000px">
				<div style="width: 80%; display: flex; margin: auto;">
					<p style="font-weight: 700; font-size: 24px; padding-bottom: 10px;">${emergency.title}</p>&emsp;<p style="color: #A1A4A8; font-size: 24px; padding-bottom: 10px; font-weight: 500;">이렇게 대처하세요!</p>
				</div>
					<hr>
				<div style="width: 80%; display: flex; margin: auto; flex-direction: column;">
					<img alt="응급상황 사진" style="display: block; width: 350px; height: 240px; border-radius: 10px; overflow: hidden;" align="left" src="${pageContext.request.contextPath}/resources/img/test_img.png"> 
					<span style="text-align: left; margin: 10px 15px">
						${emergency.content}
					</span>
				</div>
					<hr>
					<div id="commend_main">
					<span>댓글 달기</span>&emsp;
					<div id="commend_div" style="margin-top: 20px;">
					<input type="text" class="commend">
					<input type="submit" value="등록" class="send_btn">
				</div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="/default/footer.jsp" flush="true"/>
	</div>
</body>
</html>