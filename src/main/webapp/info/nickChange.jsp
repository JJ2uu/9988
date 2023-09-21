<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap" rel="stylesheet">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/favicon.ico">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>9988 닉네임 변경</title>
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
    font-size: 14px;
    padding-left: 20px;
    padding-top: 5px;
}
</style>
<script type="text/javascript">
	$(function() {
		let nickCheck = false;
		
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
		
		/* 닉네임 띄어쓰기, 특수문자 포함 확인 */
		$("#confirm_nickname").click(function() {
			let nick = userNickname.value;
			let nickPattern = /^[^\s!@#$%^&*()_+{}\[\]:;<>,.?~\\|=]{1,8}$/;
			const nickError = document.getElementById("nick_error");
			
		    if (!nickPattern.test(nick)) {
		    	nickError.innerHTML = "유효하지 않은 닉네임입니다."
		    	nickError.style.display = "block";
		    } else {
		    	nickError.style.display = "none";
		    	$.ajax({
		    		url: '../member/account/searchNick',
		    		data: {
		    			nickname : nick
		    		},
		    		success: function(result) {
						if (result == 'notNull') {
							nickError.innerHTML = "이미 존재하는 닉네임입니다."
							nickError.style.display = "block";
						} else {
							nickError.innerHTML = "사용 가능한 닉네임입니다."
							nickError.style.display = "block";
							nickError.style.color = "green";
							nickCheck = true;
						}
					}
		    	})
			}
		})
		
		$("#nickChange").click(function() {
			let newNick = userNickname.value;
			if (nickCheck) {
				$.ajax({
					url: '../member/account/updateNick',
					data: {
						nickname : userNick,
						newNick : newNick
					},
					success: function(response) {
						alert('변경이 완료되었습니다.')
						opener.parent.location.reload();
						window.close();
					}
				})
			} else {
				console.log("안돼?")
			}
		})
		
		$("#cancel").click(function() {
			window.close();
		})
	})
</script>
</head>
<body>
<div id="wrap">
	<div>
		<span style="font-size: 24px; font-weight: 700;">닉네임 설정</span>
	</div>
	<div style="width: 100%; display: flex; gap: 5px; flex-direction: column;">
		<div class="input_title">
			닉네임<strong style="color: red;"></strong>
		</div>
		<div class="input_content">
			<input id="userNickname" placeholder="띄어쓰기, 특수문자는 허용되지 않습니다." class="input_field required">
			<button id="confirm_nickname" class="btn_confirm">중복 확인</button>
		</div>
		<div id="nick_error" class="error_message" style="display: none;"></div>
		<span class="sub_text">닉네임은 한글,영문,숫자로 최대 8자까지 입력 가능합니다.</span>
	</div>
	<div class="btn_wrap">
		<button class="btn before" id="cancel" disabled>취소하기</button>
		<button class="btn" id="nickChange">변경하기</button>
	</div>
</div>
</body>
</html>