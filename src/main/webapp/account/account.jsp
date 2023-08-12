<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/default_sub.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/account.css" rel="stylesheet" type="text/css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/favicon.ico">
<title>99팔팔</title>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<jsp:include page="../default/header.jsp" flush="true">
				<jsp:param name="mode" value="1"/>
			</jsp:include>
		</div>
		<div id="content_wrap">
			<div id="content">
				<div id="ac_wrap">
					<span style="font-size: 24px; font-weight: 700;">회원가입</span>
					<div id="step_wrap">
						<div class="progressBar" id="progress"></div>
						<div class="step">
							<div class="circle active">1</div>
							<span class="stepText textActive">약관 동의</span>
						</div>
						<div class="step">
							<div class="circle">2</div>
							<span class="stepText">회원정보 입력</span>
						</div>
						<div class="step">
							<div class="circle">3</div>
							<span class="stepText">가입완료</span>
						</div>
					</div>
					<div id="ac_content"></div>
					<div class="btn_wrap">
						<button class="btn before" id="before" disabled>이전</button>
						<button class="btn" id="next">다음</button>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="../default/footer.jsp" flush="true"/>
	</div>
</body>
</html>