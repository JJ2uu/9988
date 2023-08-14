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
		const acDiv = document.getElementById("ac_content");
		
		let currentActive = 1;
		
		step1();
		
		function step1() {
			$.ajax({
				url: '../member/account/agreement',
				success: function(result) {
					acDiv.innerHTML = result;
					
					const allAgreeCheckbox = document.getElementById("all_agree");
					const serviceCheckbox = document.getElementById("service_agree");
					const privacyCheckbox = document.getElementById("privacy_agree");
			        const otherCheckboxes = document.querySelectorAll(".checkbox:not(#reception_agree)");

			        allAgreeCheckbox.addEventListener("change", () => {
			            const isChecked = allAgreeCheckbox.checked;

			            otherCheckboxes.forEach(checkbox => {
			                checkbox.checked = isChecked;
			            });
			        });
			        
			        next.addEventListener("click", () => {
			        	console.log(currentActive);
						if (serviceCheckbox.checked && privacyCheckbox.checked) {
							currentActive++;
						  	update();
						  	step2();
						} else {
							alert('필수 항목을 동의해 주세요.')
						}
					});
			        
				}
			})
		}
		
		function step2() {
			acDiv.innerHTML = null;
			next.addEventListener("click", step3);
			
			$(window).on("beforeunload", callback);
			 
			function callback(){
			    return "changes will be lost!";
			}
			
			before.addEventListener("click", () => {
				const delConfirm = confirm("이전으로 돌아갈 시 입력 정보가 초기화됩니다.")
				if (delConfirm) {
					location.reload();
				}
			});
		}
		
		function step3() {
			acDiv.innerHTML = null;
			console.log("step3")
		}
		
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
				next.textContent = "로그인";
				next.style.width = "50%";
				next.addEventListener("click", () => {
			        window.location.href = "login.jsp";
			    });
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