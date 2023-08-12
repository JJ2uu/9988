<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/default_sub.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/login.css" rel="stylesheet" type="text/css">
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
				<div id="login_wrap">
					<span style="font-size: 24px; font-weight: 700;">Login</span>
					<form>
						<input id="input_id" class="login_input" placeholder="ID">
						<input id="input_pw" class="login_input" placeholder="Password" type="password">
						<div id="login_save_wrap">
							<div class="check_wrap">
								<input type="checkbox" id="id_save" class="checkbox">
								<label for="id_save" class="on" style="display: flex; justify-content: center;"></label>
								<label for="id_save">
									<span style="cursor: pointer;">아이디 저장하기</span>
								</label>
							</div>
							<div class="check_wrap">
								<input type="checkbox" id="login_keep" class="checkbox">
								<label for="login_keep" class="on" style="display: flex; justify-content: center;"></label>
								<label for="login_keep">
									<span style="cursor: pointer;">로그인 상태 유지</span>
								</label>
							</div>
						</div>
						<button id="btn_login">로그인</button>
					</form>
					<div id="login_text_wrap">
						<span><a href="#">아이디·비밀번호 찾기</a></span>
						<span><a href="account.jsp" id="btn_signUp">회원이 아니신가요?</a></span>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="../default/footer.jsp" flush="true"/>
	</div>
</body>
</html>