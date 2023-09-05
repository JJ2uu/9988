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
		    		success: function(response) {
		    			authNumber = response;
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
						success: function(response) {
							$("#tab_findId").empty();
							$("#tab_findId").append(response);
							
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
			const inputId = document.getElementById("input_id");
			const notExistId = document.getElementById("notExistId");
			
			if (inputId.value != '') {
				$.ajax({
					url: '../member/account/findPw',
					data: {
						userId : inputId.value
					},
					success: function(response) {
						$("#tab_findPw").empty();
						$("#tab_findPw").append(response);
						
						const domainListSelect2 = document.getElementById("domain_list2");
						const userEmail2 = document.getElementById("input_email2");
						const userEmailAddressInput2 = document.getElementById("userEmailAddress2");
						const inputAuthNumber2 = document.getElementById("input_authNumber2");
						const authError2 = document.getElementById("auth_error2");
						const userId = document.getElementById("userId");

						domainListSelect2.addEventListener("change", function() {
							const selectedDomain = domainListSelect2.value;
							userEmailAddressInput2.value = selectedDomain;
						});
						
						let authNumber2;
						let email2;
					    
					    /* 비밀번호 찾기 - 인증번호 받기 */
					    $("#btn_authNumber2").click(function() {
					    	if (userEmail2.value != '' && userEmailAddressInput2.value != '') {
					    		email2 = userEmail2.value + "@" + userEmailAddressInput2.value;
						    	$.ajax({
						    		url: '../member/account/checkEmail',
						    		data: {
						    			userId : userId.value,
						    			email : email2
						    		},
						    		success: function(response) {
						    			authError2.style.display = "none";
						    			if (response == 'notNull') {
						    				$.ajax({
									    		url: '../auth/joinEmail',
									    		data: {
									    			email : email2,
									    			type : 'findPw'
									    		},
									    		success: function(response) {
									    			authNumber2 = response;
									    			alert('인증번호가 전송되었습니다.')
									    			inputAuthNumber2.value = authNumber2;
									    			
													$("#btn_changePw").click(function() {
														if (authNumber2 == inputAuthNumber2.value) {
															$.ajax({
																url: '../member/account/changePw',
																success: function(response) {
																	$("#tab_findPw").empty();
																	$("#tab_findPw").append(response);
																	
																	const inputPw = document.getElementById("input_pw");
																	const inputPwCheck = document.getElementById("input_pw_check");
																	
																	let pwPatternCheck = false;
																	let pwCheck = false;
																	
																	/* 패스워드 8글자, 특수문자 포함 확인 */
																	inputPw.addEventListener("input", function() {
																		let pw = inputPw.value;
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
																	inputPwCheck.addEventListener("input", function() {
																		let pw = inputPw.value;
																		if (pw === "") {
																			alert("비밀번호를 먼저 입력해주세요.")
																			inputPw.focus();
																		} else {
																			let pwCheckInput = inputPwCheck.value;
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
																	
																	$("#btn_completed").click(function() {
																		if (pwPatternCheck && pwCheck) {
																			$.ajax({
																				url: '../member/account/updatePw',
																				data: {
																					email : email2,
																					newPw : inputPw.value
																				},
																				success : function(response) {
																					alert('비밀번호 변경이 완료되었습니다.')
																					location.reload();
																				}
																			})
																		} else {
																			alert('비밀번호를 다시 확인해 주세요.')
																		}
																	})
																}
															})
														} else {
															authError2.innerHTML = "인증번호가 일치하지 않습니다."
															authError2.style.display = "block";
														}
													})
												},
												error : function(e) {
													console.log(e)
												}
									    	})
										} else {
											authError2.innerHTML = "가입시 입력하신 이메일 인증만 가능합니다."
											authError2.style.display = "block";
										}
									}
						    	})
							} else {
								alert('이메일을 입력해 주세요.')
								userEmail2.focus();
							}
						})
					}
				})
			} else {
				notExistId.innerHTML = "아이디를 입력해주세요."
				notExistId.style.display = "block";
				inputId.focus();
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
								<input id="input_id" class="input_field" placeholder="아이디">
								<div id="notExistId" class="error_message" style="display: none;"></div>
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