<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap" rel="stylesheet">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/favicon.ico">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>9988 비밀번호 변경</title>
<style type="text/css">
#wrap {
	padding: 50px 20px;
	display: flex;
    flex-direction: column;
    align-items: center;
    gap: 30px;
}

.input_wrap {
	text-align: left;
}

.input_title {
	font-size: 18px;
	font-weight: 400;
}

.input_content {
	display: flex;
	gap: 10px;
	align-items: center;
	margin-top: 10px;
}

.input_field {
	width: 100%;
    height: 50px;
    background: #F2F6FA;
    border-style: none;
    border-radius: 5px;
    outline: none;
    padding: 0 20px;
    box-sizing: border-box;
    cursor: auto;
    font-size: 14px;
    font-weight: 400;
}

.input_field:focus {
	outline: none;
	box-shadow: 0 0 0 1px #B5C2CF;
}

.btn_confirm {
	width: 30%;
	background: #2C343D;
	border-radius: 5px;
	color: #fff;
	height: 52px;
	cursor: pointer;
}

.sub_text {
	margin-top: 10px;
    font-size: 14px;
    color: #B5C2CF;
}

.btn_wrap {
	display: flex;
	justify-content: center;
	gap: 10px;
	width: 100%;
}

.btn {
	color: #fff;
	font-size: 16px;
	width: 100%;
	height: 50px;
	background: #407FBA;
	border-radius: 5px;
	border-style: none;
	cursor: pointer;
}

.before {
	background: #717A84;
}

.error_message {
	color: red;
    font-size: 12px;
    padding-top: 5px;
}
</style>
<script type="text/javascript">
	$(function() {
		let pwPatternCheck = false;
		let pwCheck = false;
		
		/* 유저 닉네임 */
	    let userNick = '<%= session.getAttribute("userNick") %>';
		if (userNick == 'null') {
			let cookieName = "loginCookie";
			let cookieString = document.cookie;
			let cookieArray = cookieString.split(';');
			
			for (var i = 0; i < cookieArray.length; i++) {
			    var cookie = cookieArray[i].trim();
			    if (cookie.indexOf(cookieName + '=') === 0) {
			        let cookieValue = cookie.substring(cookieName.length + 1);
			        $.ajax({
			        	url: '${pageContext.request.contextPath}/member/autoSignIn',
			        	data: {
			        		sessionId : cookieValue
			        	},
			        	contentType : "application/text; charset:UTF-8",
			        	success: function(nickname) {
			    			userNick = nickname;
						}
			        })
			        break;
			    }
			}
		}
		
		/* 패스워드 8글자, 특수문자 포함 확인 */
		userPw.addEventListener("input", function() {
			let pw = userPw.value;
			let pwPattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&#])[A-Za-z\d@$!%*?&#]{8,}$/;
			const pwError = document.getElementById("pw_error");
			
	        if (!pwPattern.test(pw)) {
	            pwError.style.display = "block";
	        } else {
	        	pwError.style.display = "none";
	        	pwPatternCheck = true;
			}
		})
		
		/* 비밀번호 체크 */
		userPwCheck.addEventListener("input", function() {
			let pw = userPw.value;
			if (pw === "") {
				alert("비밀번호를 먼저 입력해주세요.")
				userPw.focus();
			} else {
				let pwCheckInput = userPwCheck.value;
				const pwError = document.getElementById("pwCheck");
				
				if (pw == pwCheckInput && pwPatternCheck) {
					pwError.style.color = "green";
					pwError.style.display = "block";
					pwError.innerHTML = "비밀번호가 일치합니다."
					pwCheck = true;
				} else {
					pwError.style.display = "block";
					pwError.innerHTML = "비밀번호가 일치하지 않습니다. 다시 입력해 주세요."
				}
			}
		})
		
		$("#cancel").click(function() {
			event.preventDefault();
			window.close();
		})
		
		$("#pwChange").click(function() {
			event.preventDefault();
			if (pwPatternCheck && pwCheck) {
				let pw = userPw.value;
				
				$.ajax({
					url: '../member/account/updatePw',
					data: {
						nickname : userNick,
						newPw : pw
					},
					success : function(response) {
						alert('변경이 완료되었습니다. 다시 로그인해 주시기 바랍니다.')
						$.ajax({
							url: '../member/signOut',
							success: function(response) {
								opener.parent.location.href ="../9988_main.jsp"
								window.close();
							}
						})
					}
				})
			} else {
				alert("비밀번호를 확인해 주세요.")
				userPw.focus();
			}
		})
	})
	
</script>
</head>
<body>
<div id="wrap">
	<div>
		<span style="font-size: 24px; font-weight: 700;">비밀번호 변경</span>
	</div>
	<form style="width: 100%;">
	<div style="width: 100%; display: flex; gap: 5px; flex-direction: column;">
		<div class="input_title">
			새로운 비밀번호<strong style="color: red;">*</strong>
		</div>
		<div class="input_content">
			<input id="userPw" placeholder="8글자 이상, 특수문자를 포함하여 입력하세요." class="input_field required" type="password" autocomplete="new-password">
		</div>
		<div id="pw_error" class="error_message" style="display: none;">비밀번호는 8글자 이상이어야 하며, 특수문자를 포함해야 합니다.</div>
		<div class="input_title" style="margin-top: 20px;">
			비밀번호 확인<strong style="color: red;">*</strong>
		</div>
		<div class="input_content">
			<input id="userPwCheck" placeholder="다시 한 번 입력하세요." class="input_field required" type="password" autocomplete="new-password">
		</div>
		<div id="pwCheck" class="error_message" style="display: none;"></div>
	</div>
	</form>
	<div class="btn_wrap">
		<button class="btn before" id="cancel" disabled>취소하기</button>
		<button class="btn" id="pwChange">변경하기</button>
	</div>
</div>
</body>
</html>