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
					
					next.removeEventListener("click", firstNext);
					next.addEventListener("click", step3);
					
					/* [이전]버튼 클릭 시 안내 */
					before.addEventListener("click", () => {
						const delConfirm = confirm("이전으로 돌아갈 시 입력 정보가 초기화됩니다.")
						if (delConfirm) {
							location.reload();
						}
					});
				}
			})
		}
		
		/* 마이페이지 - 가입 완료 */
		function step3() {
			currentActive++;
			update();
			
			$.ajax({
				url: '../member/account/completed',
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