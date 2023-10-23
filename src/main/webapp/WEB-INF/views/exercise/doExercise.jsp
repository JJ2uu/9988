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
function searchWithKeyword(searchKeyword) {
	
	if(searchKeyword){
		var keyword = searchKeyword;
	} else{
	 	var keyword = document.getElementById("keyword").value;		
	}
 	
 	if(keyword){
	 	$.ajax({
	 		type: 'post', 
	 		url: '${pageContext.request.contextPath}/exercise/search',
	 		data: {
	 			keyword: keyword
	 		},
	 		success: function(data){
			 	$('#main_div').empty();
	 			
	 			$.each(data, function(index, item) { // 데이터 =item
					$("#main_div").append(
							'<div id="separate_div" style="width: 320px; margin-bottom: 20px;">' 
							+ '<a href="https://www.youtube.com/watch?v=' + item.videoId + '"><img src="' + item.url + '" width="' + item.width + '" heigth="' + item.height 
							+ '"><span style="width: 323px; margin: auto;">' 
							+ item.title + '</span></a></div>'); 
				});
	 		},
	 		error: function(e){
	 			console.error('Error', e)
	 		}
	 	})
 	} else {
 		alert("검색어를 입력해 주세요.");
 	}
}

function show_name(){
	if(window.event.keyCode == 13){
		window.event.preventDefault();
		var searchKeyword = document.getElementById("keyword").value;
		searchWithKeyword(searchKeyword);
    }
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
				<div class="subheading" style="margin-bottom: 20px;">
					<span style="font-size: 24px; font-weight: bolder; margin-bottom: 20px">운동해요</span>
					<img src="${pageContext.request.contextPath}/resources/img/stretching.svg" width="20px" style="cursor:pointer;">
				</div>
				<form action="exercise/search" id="search_frm" method="get">
				<div class="search" style="margin: auto; margin-bottom: 40px;">
					<input id="keyword" type="text" placeholder="검색어를 입력해 주세요." onkeypress="show_name();"> 
					<a href="javascript:void(0);" id="searchA" onclick="searchWithKeyword();">
					<img alt="돋보기 아이콘" src="${pageContext.request.contextPath}/resources/img/Vector.png">
					</a>
				</div>
				</form>
				<div id="main_div" style="width: 1000px; display: flex; flex-wrap: wrap; gap: 10px; justify-content: center;">
					<c:forEach var="exercise" items="${exercise}">
					<div id="separate_div" style="width: 320px; margin-bottom: 20px;">
						<a href="https://www.youtube.com/watch?v=${exercise.videoId}">
							<img src="${exercise.url}" width="${exercise.width}" height="${exercise.height}">
							<span style="width: 323px; margin: auto;">${exercise.title}</span>
						</a>
					</div>
					</c:forEach>
				</div>
			</div>
		</div>
		<jsp:include page="/default/footer.jsp" flush="true" />
	</div>
</body>
</html>