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
.symptom {
	width: 1001px;
	height: 60px;
	margin-top: 30px;
}

.symptom input {
	width: 904px;
	height: 100%;
	border-radius: 10px;
	border: 1px solid #000000;
	padding-left: 20px;
	margin-left: 30px;
}

.solution {
	width: 1001px;
	height: 444px;
	margin-top: 20px;
}

.solution input {
	width: 904px;
	height: 100%;
	border-radius: 10px;
	border: 1px solid #000000;
	padding-left: 20px;
	margin-left: 5px;
}
.complete_btn{
	width: 904px;
	height: 70px;
	margin-left: 80px;
	margin-top: 20px;
}

.complete_btn button{
	width: 45%;
	height: 100%;
	background-color: #407FBA;
	color: #FFFFFF;
	border-radius: 5px;
	font-size: 18px;
	margin-left: 20px;
	margin-right: 20px;
}
</style>
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
				<div class="subheading" style="margin-bottom: 10px;">
				<span style="font-size: 24px; font-weight: bolder;">응급이에요</span>
				</div>
				<!-- form태그는 컨트롤러랑 연결 -->
				<div class="symptom">
					증상 <input placeholder="응급상황을 적어주세요.">
				</div>
				<div class="solution">
					대처방안 <input placeholder="응급 상황 시 대처방안을 적어주세요.">
				</div>
				<div class="complete_btn">
					<a href="${pageContext.request.contextPath}/emergency/temporarySave">
					<button id="temSave" type="button">글 임시 저장</button>
					</a>
					<a href="${pageContext.request.contextPath}/emergency/saveBoard">
					<button id="sava" type="submit">글 작성 완료</button>
					</a>
				</div>
			</div>
		</div>
		<jsp:include page="/default/footer.jsp" flush="true" />
	</div>
</body>
</html>