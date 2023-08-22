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
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

	$(function() {
		const progress = document.getElementById("progress");
		const before = document.getElementById("before");
		const next = document.getElementById("next");
		const circles = document.querySelectorAll(".circle");
		const steps = document.querySelectorAll(".stepText");
		
		let currentActive = 1;
		
		step1();
		
		/* 회원가입 - 약관 동의 */
		function step1() {
			$.ajax({
				url: '../member/account/agreement',
				success: function(step1) {
					$('#ac_content').empty();
					$('#ac_content').append(step1);
					
					const allAgreeCheckbox = document.getElementById("all_agree");
			        const otherCheckboxes = document.querySelectorAll(".checkbox:not(#reception_agree)");

			        allAgreeCheckbox.addEventListener("change", () => {
			            const isChecked = allAgreeCheckbox.checked;

			            otherCheckboxes.forEach(checkbox => {
			                checkbox.checked = isChecked;
			            });
			        });
			        
			        next.addEventListener("click", firstNext);

				}
			})
		}
		
		/* 필수 항목 동의 */
        function firstNext() {
			const serviceCheckbox = document.getElementById("service_agree");
			const privacyCheckbox = document.getElementById("privacy_agree");
        	
			if (serviceCheckbox.checked && privacyCheckbox.checked) {
				currentActive++;
				update();
				step2();
			} else {
				alert('필수 항목을 동의해 주세요.')
			}
		}
		
		/* 회원가입 - 회원정보 입력 */
		function step2() {
			$.ajax({
				url: '../member/account/enter',
				success: function(stpe2) {
					$('#ac_content').empty();
					$('#ac_content').append(stpe2);
					window.scrollTo(0, 0);
					
					/* 출생연도 */
					const birthYearEl = document.querySelector('#birth-year')
					
					isYearOptionExisted = false;
					birthYearEl.addEventListener('focus', function () {
					  
					  if(!isYearOptionExisted) {
					    isYearOptionExisted = true
					    for(var i = 1940; i <= 2022; i++) {
					      
					      const YearOption = document.createElement('option')
					      YearOption.setAttribute('value', i)
					      YearOption.innerText = i
					      
					      this.appendChild(YearOption);
					    }
					  }
					});
					
					/* 월 */
					const birthMonthEl = document.querySelector('#birth-month')
					
					isMonthOptionExisted = false;
					birthMonthEl.addEventListener('focus', function () {
					  
					  if(!isMonthOptionExisted) {
						isMonthOptionExisted = true
					    for(var i = 1; i <= 12; i++) {
					      
					      const monthOption = document.createElement('option')
					      monthOption.setAttribute('value', i)
					      monthOption.innerText = i
					      
					      this.appendChild(monthOption);
					    }
					  }
					});
					
					/* 일 */
					const birthDayEl = document.querySelector('#birth-day')
					
					isDayOptionExisted = false;
					birthDayEl.addEventListener('focus', function () {
					  
					  if(!isDayOptionExisted) {
						isDayOptionExisted = true
					    for(var i = 1; i <= 31; i++) {
					      
					      const dayOption = document.createElement('option')
					      dayOption.setAttribute('value', i)
					      dayOption.innerText = i
					      
					      this.appendChild(dayOption);
					    }
					  }
					});
					
					/* [이전]버튼 클릭 시 안내 */
					before.addEventListener("click", () => {
						const delConfirm = confirm("이전으로 돌아갈 시 입력 정보가 초기화됩니다.")
						if (delConfirm) {
							location.reload();
						}
					});
					
					const userId = document.getElementById("userId");
					const userPw = document.getElementById("userPw");
					const userPwCheck = document.getElementById("userPwCheck");
					const userName = document.getElementById("userName");
					const userNickname = document.getElementById("userNickname");
					const birthYearSelect = document.getElementById("birth-year");
					const birthMonthSelect = document.getElementById("birth-month");
					const birthDaySelect = document.getElementById("birth-day");
					const userEmail = document.getElementById("userEmail");
					const userEmailAddressInput = document.getElementById("userEmailAddress");
					const userPhone = document.getElementById("userPhone");
					
					/* 유효성 체크 */
					let idCheck = false;
					let pwCheck = false;
					let nickCheck = false;
					
					/* 아이디 중복 확인 */
					$("#confirm_id").click(function() {
						event.preventDefault();
						
						const errorDiv = document.getElementById("id_error");
						let id = userId.value;
						
					    if (id.length >= 6) {
					    	errorDiv.style.display = "none";
					    	
					    	$.ajax({
								url: '../member/account/searchId',
								data: {
									userId : id
								},
								success: function(result) {
									if (result == 'notNull') {
										errorDiv.style.display = "block";
									} else {
										errorDiv.style.display = "none";
										idCheck = true;
									}
								}
							})
					    } else {
					    	const errorDiv = document.getElementById("id_error");
					    	errorDiv.innerHTML = "아이디는 6글자 이상이어야 합니다.";
							errorDiv.style.display = "block";
						}
					})
					
					/* 패스워드 8글자, 특수문자 포함 확인 */
					userPw.addEventListener("input", function() {
						let pw = userPw.value;
						let pwPattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&#])[A-Za-z\d@$!%*?&#]{8,}$/;
						const pwError = document.getElementById("pw_error");
						
				        if (!pwPattern.test(pw)) {
				            pwError.style.display = "block";
				        } else {
				        	pwError.style.display = "none";
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
							
							if (pw == pwCheckInput) {
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
					
					/* 생년월일 */
					let year = null;
					let month = null;
					let day = null;
					let userBirth = null;
					
					birthYearSelect.addEventListener("change", function() {
						let selectedYear = birthYearSelect.value;
						year = selectedYear
						birth();
					})
					
					birthMonthSelect.addEventListener("change", function() {
						let selectedMonth = birthMonthSelect.value;
						month = selectedMonth
						birth();
					})
					
					birthDaySelect.addEventListener("change", function() {
						let selectedDay = birthDaySelect.value;
						day = selectedDay
						birth();
					})
					
					function birth() {
						userBirth = year + "-" + month + "-" + day;
						console.log(userBirth)
					}
					
					/* 성별 */
					const radioButtons = document.querySelectorAll('input[name="gender"]');
					let gender = null;

					radioButtons.forEach(function(radioButton) {
					    radioButton.addEventListener('change', function() {
					        if (this.checked) {
					            gender = this.value;
					        }
					    });
					});
					
					/* 이메일 */
					const domainListSelect = document.getElementById("domain_list");
					let email = null;

					domainListSelect.addEventListener("change", function() {
					    const selectedDomain = domainListSelect.value;
					    userEmailAddressInput.value = selectedDomain;
					    email = userEmail.value + "@" + selectedDomain;
					});
					
					/* 닉네임 띄어쓰기, 특수문자 포함 확인 */
					$("#confirm_nickname").click(function() {
						event.preventDefault();
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
										nickError.style.display = "none";
										nickCheck = true;
									}
								}
				        	})
						}
					})

					next.removeEventListener("click", firstNext);
					next.addEventListener("click", function() {
						const requiredFields = document.querySelectorAll(".required");
						let isEmptyFieldFound = false;
						let isEmptyBirth = false;

						requiredFields.forEach(function(field) {
						    if (field.value.trim() === "") {
						        isEmptyFieldFound = true;
						        field.focus(); // 비어 있는 입력란에 포커스 설정
						        return;
						    }
						});
						
						if (year == null || month == null || day == null) {
							isEmptyBirth = true;
						}
						
						if (isEmptyFieldFound || isEmptyBirth) {
						    alert("필수항목을 모두 입력해주세요.");
						    
						    if (!isEmptyFieldFound && isEmptyBirth) {
								if (year == null) {
									birthYearSelect.focus();
								} else if (month == null) {
									birthMonthSelect.focus();
								} else {
									birthDaySelect.focus();
								}
							}
						} else {
							if (idCheck && pwCheck && nickCheck) {
								$.ajax({
									url: '../member/account/signUp',
									type: 'post',
									data: {
										id : userId.value,
										pw : userPw.value,
										name : userName.value,
										userbirth : userBirth,
										gender : gender,
										email : email,
										tel : userPhone.value,
										nickname : userNickname.value
									},
									success : function() {
										step3(userNickname.value);
									}
								})
							} else {
								if (!idCheck) {
									alert("아이디 중복을 확인해 주세요.")
								} else if (!pwCheck) {
									alert("비밀번호를 확인해 주세요.")
								} else {
									alert("닉네임을 확인해 주세요.")
								}
							}
						}
					});
				}
			})
		}
		
		/* 마이페이지 - 가입 완료 */
		function step3(nickname) {
			currentActive++;
			update();
			
			$.ajax({
				url: '../member/account/completed',
				data: {
					nickname : nickname
				},
				success: function(step3) {
					$('#ac_content').empty();
					$('#ac_content').append(step3)
					window.scrollTo(0, 0);
					
					const btnLogin = document.getElementById("btn_login");
					
					btnLogin.addEventListener("click", () => {
						location.href = "login.jsp";
					})
				}
			})
		}
		
		/* 회원가입 페이지 progress bar */
		function update() {
			steps.forEach((stepText, idx) => {
				if (idx < currentActive) {
					stepText.classList.add("textActive");
			    } else {
			    	stepText.classList.remove("textActive");
			    }
			});
			
			circles.forEach((circle, idx) => {
				if (idx < currentActive) {
			    	circle.classList.add("active");
			    } else {
			    	circle.classList.remove("active");
			    }
			});

			const actives = document.querySelectorAll(".active");

			progress.style.width = ((actives.length - 1) / (circles.length - 1)) * 90 + "%";

			if (currentActive === 1) {
				before.disabled = true;
			} else if (currentActive === circles.length) {
				before.disabled = true;
				next.disabled = true;
			} else {
				before.disabled = false;
			    next.disabled = false;
			}
		}
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