<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/default_sub.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/search_box.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/emergency_main.css" rel="stylesheet" type="text/css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/favicon.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<style type="text/css">
.paging button{
	width: 40px;
	height: 40px;
	margin: 0px 5px;
}

.uncheck_btn{
	background-color: white; 
	color: #000000;
	border: 1px solid;
}

.check_btn{
	background-color: #407FBA; 
	color: #fff; 
	border-style: none
}
</style>
<!-- 전체 숫자 -->
<script type="text/javascript">
$(function() {
	$.ajax({
		type : 'POST',
		url : "${pageContext.request.contextPath}/emergency/getPage",
		data: {
			currentNum: 1
		},
		traditional: true,
		success : function(data) {
			if(data.xprev){
				$('#paganation').append('<button type="button"><</button>')
			}
			
			console.log(data)
			
			var first = data.firstPageNoOnPageList;
			var last = data.lastPageNoOnPageList;
			
			for(i = first; i <= last; i++){
				$('#paganation').append('<button type="button" class="page_btn uncheck_btn" onclick="doAction()" id="btn_' + i + '" value="' + i + '">'+ i +'</button>')
			} 
			
			var recordCountPerPage = data.recordCountPerPage;
			
			if(data.xnext){
				$('#paganation').append('<button type="button">></button>') 
			}
			
			if(data.currentPageNo == 1){
				$('#btn_1').removeClass("uncheck_btn");
				$('#btn_1').addClass("check_btn");
			}
			
		},
		error : function(error) {
			console.error('Error:', error);
		} 
	})//ajax
}) 

function doAction(){
	var currentCount = $('.page_btn').val();
	console.log(currentCount)
}

/* function getId(id){
	var idx = $("")
} */


</script>
<title>99팔팔</title>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<jsp:include page="/default/header.jsp" flush="true">
				<jsp:param name="mode" value="1" />
			</jsp:include>
		</div>
		<div id="content_wrap">
			<div id="content" style="width: 1000px; display: flex; flex-direction: column; align-items: center;">
				<!-- 이 content div 안에서  작업 시작-->
				<div class="subheading" style="margin-bottom: 30px;">
				<span style="font-size: 24px; font-weight: bolder;">응급이에요</span>
				</div>
				<div class="search"
					style="">
					<input type="text" placeholder="증상에 대한 검색어를 입력하세요."> 
					<a href="#"> <img alt="돋보기 아이콘"
						src="${pageContext.request.contextPath}/resources/img/Vector.png">
					</a>
				</div>

				<div id="plus_content" style="display: flex; justify-content: flex-end;">
					<form action="createBoard">
						<button type="submit" class="contetn_btn">응급상황 추가하기</button>
					</form>
				</div>
				
				<div style="width: 880px; display: flex; gap: 10px; justify-content: space-between; flex-wrap: wrap;">
					<c:forEach var="emergencyList" items="${emergencyList}">
						<div class="img_box">
						<a href="${pageContext.request.contextPath}/emergency/board?emergencyId=${emergencyList.emergencyId}">
							<img alt="응급상황 사진" align="left" src="${pageContext.request.contextPath}/resources/img/test_img.png"> 
							<span>${emergencyList.title}</span>
						</a>
						</div>
					</c:forEach>
					<div class="paging" id="paganation" style="margin: 20px;">
					</div>
				</div>
		</div><!-- content div -->
		</div>
		<jsp:include page="/default/footer.jsp" flush="true" />
	</div>
</body>
</html>