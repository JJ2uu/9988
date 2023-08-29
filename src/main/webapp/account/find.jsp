<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/default_sub.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/find.css" rel="stylesheet" type="text/css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/favicon.ico">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

	$(function() {
		/* 회원정보 찾기 탭 메뉴 이벤트 */
		$("ul.tabs li").click(function() {
			const tab_id = $(this).attr('data-tab');
			
	        const url = new URL(window.location);
	        url.searchParams.set('tab', tab_id);
	        window.location.href = url;
		})
		
	    const urlParams = new URLSearchParams(window.location.search);
	    const activeTab = urlParams.get('tab');
	    
	    if (activeTab !== null) {
	        $("ul.tabs li").removeClass('current');
	        $(".tab_content").removeClass('current');
	        
	        $("ul.tabs li[data-tab=" + activeTab + "]").addClass('current');
	        $("#" + activeTab).addClass('current');
	    }
	    
	    /* 이메일 */
		const domainListSelect = document.getElementById("domain_list");
		const userEmail = document.getElementById("input_email");
		const userEmailAddressInput = document.getElementById("userEmailAddress");
		const inputAuthNumber = document.getElementById("input_authNumber");
		const authError = document.getElementById("auth_error");

		domainListSelect.addEventListener("change", function() {
			const selectedDomain = domainListSelect.value;
			userEmailAddressInput.value = selectedDomain;
		});
		
		let authNumber;
		let email;
	    
	    /* 아이디 찾기 - 인증번호 받기 */
	    $("#btn_authNumber").click(function() {
	    	if (userEmail.value != '' && userEmailAddressInput.value != '') {
	    		email = userEmail.value + "@" + userEmailAddressInput.value;
		    	
		    	$.ajax({
		    		url: '../auth/joinEmail',
		    		data: {
		    			email : email,
		    			type : 'findId'
		    		},
		    		success: function(result) {
		    			authNumber = result;
		    			alert('인증번호가 전송되었습니다.')
		    			inputAuthNumber.value = authNumber;
					},
					error : function(e) {
						console.log(e)
					}
		    	})
			} else {
				alert('이메일을 입력해 주세요.')
				userEmail.focus();
			}
		})
		
	    /* 아이디 찾기 */
		$("#btn_findId").click(function() {
			if (authNumber != null && inputAuthNumber.value != '') {
				if (authNumber == inputAuthNumber.value) {
					$.ajax({
						url: '../member/account/foundId',
						data: {
							email : email
						},
						success: function(foundId) {
							$("#tab_findId").empty();
							$("#tab_findId").append(foundId);
							
							$("#btn_login").click(function() {
								location.href = "login.jsp"
							})
							
							$("#btn_signUp").click(function() {
								location.href = "account.jsp"
							})
						}
					})
				} else {
					authError.innerHTML = "인증번호가 일치하지 않습니다."
					authError.style.display = "block";
				}
			} else {
				alert('이메일 인증이 필요합니다.')
			}
		})
		
		/* 비밀번호 찾기 */
		$("#btn_next").click(function() {
			let pwConfirm = confirm("존재하는 아이디인가?");
			
			if (pwConfirm) {
				$.ajax({
					url: '../member/account/resetPw',
					success: function(resetPw) {
						$("#tab_2").empty();
						$("#tab_2").append(resetPw);
						
						$("#btn_changePw").click(function() {
							$.ajax({
								url: '../member/account/changePw',
								success: function(changePw) {
									$("#tab_2").empty();
									$("#tab_2").append(changePw);
									
									$("#btn_completed").click(function() {
										alert('비밀번호 변경이 완료되었습니다.')
										location.reload();
									})
								}
							})
						})
					}
				})
			} else {
				const notIdSpan = document.getElementById("notExistId");
				
				notIdSpan.innerHTML = "존재하지 않는 아이디입니다. 다시 확인해 주세요."
			}
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
				<div id="find_wrap">
					<span style="font-size: 24px; font-weight: 700;">회원정보 찾기</span>
					<div id="tab_wrap">
						<ul class="tabs">
							<li class="tab_menu current" data-tab="tab_findId">아이디 찾기</li>
							<li class="tab_menu" data-tab="tab_findPw">비밀번호 찾기</li>
						</ul>
						<div id="tab_findId" class="tab_content current">
							<div style="display: flex; flex-flow: column; gap: 10px;">
								<span class="tab_title">아이디 찾기</span>
								<span>회원가입시 입력하신 이메일로 인증번호를 보내 드립니다.</span>
							</div>
							<div style="display: flex; flex-flow: column; gap: 10px; margin: 30px 0;">
								<div class="input_wrap">
									<input id="input_email" class="input_field" placeholder="이메일">
									@
									<input id="userEmailAddress" class="input_field required">
									<select class="box" id="domain_list">
										<option value="">직접 입력</option>
										<option value="naver.com">naver.com</option>
										<option value="gmail.com">gmail.com</option>
										<option value="hanmail.net">hanmail.net</option>
										<option value="daum.net">nate.com</option>
									</select>
									<button class="btn_confirm" id="btn_authNumber">인증번호 받기</button>
								</div>
								<input id="input_authNumber" class="input_field" placeholder="인증번호 입력">
								<div id="auth_error" class="error_message" style="display: none;"></div>
							</div>
							<button id="btn_findId" class="btn">확인</button>
						</div>
						<div id="tab_findPw" class="tab_content">
							<div style="display: flex; flex-flow: column; gap: 10px;">
								<span class="tab_title">비밀번호 찾기</span>
								<span>비밀번호를 찾고자 하는 아이디를 입력해 주세요.</span>
							</div>
							<div style="display: flex; flex-flow: column; margin: 30px 0;">
								<input id="" class="input_field" placeholder="아이디">
								<span id="notExistId" style="color: red;"></span>
							</div>
							<button id="btn_next" class="btn">다음</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="../default/footer.jsp" flush="true"/>
	</div>
</body>
</html>