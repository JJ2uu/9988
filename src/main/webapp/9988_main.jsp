<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/default.css" rel="stylesheet" type="text/css">
<link rel="shortcut icon" href="resources/favicon.ico">
<script src="http://code.jquery.com/jquery-latest.min.js">
</script>
<title>99팔팔</title>
<style type="text/css">
.menu{
    font-size: x-large;
    font-weight: 600;
    padding-bottom: 30px;
}
</style>
<script type="text/javascript">
$(function() {
    $.ajax({
        url: 'main/main_qna',
        success: function(x) {
        	$('#mainQnaWrap').html(x)
        }
    });
    
    $.ajax({
        url: 'main/main_food',
        success: function(x) {
        	$('#mainFoodWrap').html(x)
        }
    });
        
});
</script>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<jsp:include page="/default/header.jsp" flush="true">
				<jsp:param name="mode" value="1"/>
			</jsp:include>
		</div>
		<div id="main_banner">
			<div id="banner_text">
				<p style="color: #fff; font-weight: 100;">
					<b style="color: #fff; font-weight: 500;">건강정보</b>부터
					<b style="color: #fff; font-weight: 500;">식단</b>까지
				</p>
				<img src="${pageContext.request.contextPath}/resources/img/logo_white.svg" width="160px">
				<p style="color: #fff; font-weight: 100;">증상별 맞춤 케어 및 건강 정보를 제공합니다.</p>
			</div>
			<img src="${pageContext.request.contextPath}/resources/img/health.png" width="400px">
		</div>
		<div id="content_wrap">
			<div id="content" style="display: flex; gap: 80px; flex-direction: column;">
				<div id="main_daily"><div class="menu">오늘떴어요</div>
					<div style="display: flex; justify-content: space-around;">
						<jsp:include page="WEB-INF/views/main/main_daily.jsp" flush="true">
							<jsp:param name="mode" value="1"/>
						</jsp:include></div></div>
				<div style="display: flex; justify-content: space-around;">
					<div id="main_qna"><div class="menu">질문있어요</div>
					<div id="mainQnaWrap"></div></div>
					<div id="main_emergency"><div class="menu">응급이에요</div>
					<div><jsp:include page="WEB-INF/views/main/main_emergency.jsp" flush="true">
							<jsp:param name="mode" value="1"/>
						</jsp:include></div></div></div>
				<div id="main_food"><div class="menu">뭐먹을까요?</div>
					<div style="display: flex; justify-content: space-around;">
						<div id="mainFoodWrap"></div></div></div>
				<div id="main_exercise"><div class="menu">운동해요</div>
				<div><jsp:include page="WEB-INF/views/main/main_exercise.jsp" flush="true">
							<jsp:param name="mode" value="1"/>
						</jsp:include></div></div>
				
			</div>
		</div>
		<jsp:include page="/default/footer.jsp" flush="true"/>
	</div>
</body>
</html>