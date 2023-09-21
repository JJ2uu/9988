<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/default_sub.css"
	rel="stylesheet" type="text/css">
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/favicon.ico">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/search_box.css" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	$.ajax({
		type : 'POST',
		url : "${pageContext.request.contextPath}/exercise/getPage",
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
			
			for(i = first; i <= last+1; i++){
				$('#paganation').append('<button type="button" class="page_btn uncheck_btn" onclick="doAction(' + i + ')" id="btn_' + i + '">'+ i +'</button>')
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

function doAction(seq){
	var currentCount = seq;
	
	let f = document.createElement('form');
	let obj;
	obj = document.createElement('input');
    obj.setAttribute('type', 'hidden');
    obj.setAttribute('value', currentCount);
    
    f.appendChild(obj);
    f.setAttribute('method', 'post');
    f.setAttribute('action', 'getPage');
    
    document.body.appendChild(f);
    f.submit();
}
</script>
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
			<div id="content">
				<!-- 이 content div 안에서  작업 시작-->
				<div class="subheading" style="margin-bottom: 30px;">
					<span style="font-size: 24px; font-weight: bolder; margin-bottom: 20px">운동해요</span>
					<img src="${pageContext.request.contextPath}/resources/img/stretching.png" width="16px">
				</div>
				<div class="search" style="margin: auto; margin-bottom: 40px;">
					<input type="text" placeholder="증상에 대한 검색어를 입력하세요."> 
					<a href="#"> <img alt="돋보기 아이콘"
						src="${pageContext.request.contextPath}/resources/img/Vector.png">
					</a>
				</div>
				<div style="width: 1000px; height: 800px; display: flex; flex-wrap: wrap; gap: 10px; justify-content: center;">
					<c:forEach var="exercise" items="${exercise}">
					<div style="width: 320px; margin-bottom: 20px;">
						<a href="https://www.youtube.com/watch?v=${exercise.videoId}">
							<img src="${exercise.url}" width="${exercise.width}" height="${exercise.height}">
							<span style="width: 323px; margin: auto;">${exercise.title}</span>
						</a>
					</div>
					</c:forEach>
				</div>
				<div class="paging" id="paganation" style="margin-top: 20px;">
				</div>
			</div>
		</div>
		<jsp:include page="/default/footer.jsp" flush="true" />
	</div>
</body>
</html>