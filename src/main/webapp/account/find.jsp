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
		
		$("#btn_findId").click(function() {
			$.ajax({
				url: '../member/account/foundId',
				success: function(foundId) {
					$("#tab_1").empty();
					$("#tab_1").append(foundId);
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
				<div id="find_wrap">
					<span style="font-size: 24px; font-weight: 700;">회원정보 찾기</span>
					<div id="tab_wrap">
						<ul class="tabs">
							<li class="tab_menu current" data-tab="tab_1">아이디 찾기</li>
							<li class="tab_menu" data-tab="tab_2">비밀번호 찾기</li>
						</ul>
						<div id="tab_1" class="tab_content current">
							<div style="display: flex; flex-flow: column; gap: 10px;">
								<span class="tab_title">아이디 찾기</span>
								<span>가입 시 입력하신 이메일로 인증번호를 보내 드립니다.</span>
							</div>
							<div style="display: flex; flex-flow: column; gap: 10px; margin: 30px 0;">
								<div class="input_wrap">
									<input id="input_email" class="input_field" placeholder="이메일">
									<button class="btn_confirm">인증번호 받기</button>
								</div>
								<input id="" class="input_field" placeholder="인증번호 입력">
							</div>
							<button id="btn_findId" class="btn">확인</button>
						</div>
						<div id="tab_2" class="tab_content">
							<div style="display: flex; flex-flow: column; gap: 10px;">
								<span class="tab_title">비밀번호 찾기</span>
								<span>가입 시 입력하신 이메일로 인증번호를 보내 드립니다.</span>
							</div>
							<div style="display: flex; flex-flow: column; gap: 10px; margin: 30px 0;">
								<input id="" class="input_field" placeholder="아이디">
								<div class="input_wrap">
									<input id="input_email" class="input_field" placeholder="이메일">
									<button class="btn_confirm">인증번호 받기</button>
								</div>
								<input id="" class="input_field" placeholder="인증번호 입력">
							</div>
							<button id="btn_findPw" class="btn">확인</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="../default/footer.jsp" flush="true"/>
	</div>
</body>
</html>