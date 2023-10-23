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
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

	$(function() {
		
		const inputId = document.getElementById("input_id");
		const inputPw = document.getElementById("input_pw");
		const idSave = document.getElementById("id_save");
		const loginKeep = document.getElementById("login_keep");
		const errorMessage = document.getElementById("login_error");
		
		/* 페이지 로드시 아이디 입력창 포커스 */
		$("#input_id").focus();
		
		let idSaveCheck = false; /* 아이디 저장 여부 */
		let loginKeepCheck = false; /* 로그인 저장 여부 */
		
		/* 저장된 아이디값 가져오기 */
		getId();
		
		if (idSave.checked) {
			idSaveCheck = true;
		}
		
		/* 아이디 저장 체크박스 */
		idSave.addEventListener("change", function() {
			if (idSave.checked){ 
				idSaveCheck = true;
				console.log(idSaveCheck)
			} else { 
				idSaveCheck = false;
				console.log(idSaveCheck)
			}
		})
		
		/* 로그인 저장 체크박스 */
		loginKeep.addEventListener("change", function() {
			if (loginKeep.checked){ 
				loginKeepCheck = true;
				console.log(loginKeepCheck)
			} else { 
				loginKeepCheck = false;
				console.log(loginKeepCheck)
			}
		})
		
		/* 저장된 아이디값 가져오기 */
		function getId() {
			const savedId = localStorage.getItem("idSave");
			
			if (savedId) {
				inputId.value = savedId;
				idSave.checked = true;
			}
		}
		
		/* 로그인 */
		$("#btn_login").click(function() {
			event.preventDefault();
			
			let id = inputId.value;
			let pw = inputPw.value;
			
			if (idSaveCheck) {
				localStorage.setItem("idSave", id);
			} else {
				localStorage.removeItem("idSave");
			}
			
			$.ajax({
				url: '../member/signIn',
				type : 'post',
				data: {
					id : id,
					pw : pw,
					loginKeep : loginKeepCheck
				},
				success : function(result) {
					console.log(result)
					if (result == "success") {
						location.href = "../9988_main.jsp"
					} else if (result == "failure") {
						errorMessage.innerHTML = "아이디나 비밀번호를 다시 확인하세요.";
						errorMessage.style.display = "block";
					} else {
						errorMessage.innerHTML = "존재하지 않는 아이디입니다.";
						errorMessage.style.display = "block";
					}
				}
			})
		})
	})

</script>
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
						<input id="input_id" class="login_input" placeholder="ID" autocomplete="username">
						<input id="input_pw" class="login_input" placeholder="Password" type="password" autocomplete="current-password">
						<div id="login_error" class="error_message" style="display: none;"></div>
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
						<span><a href="find.jsp">아이디·비밀번호 찾기</a></span>
						<span><a href="account.jsp" id="btn_signUp">회원이 아니신가요?</a></span>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="../default/footer.jsp" flush="true"/>
	</div>
</body>
</html>