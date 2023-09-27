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
<script type="text/javascript">
$(function(){
	let userNick = '<%= session.getAttribute("userNick") %>';
	if (userNick == 'null') {
		let cookieName = "loginCookie";
		let cookieString = document.cookie;
		let cookieArray = cookieString.split(';');
		
		for (var i = 0; i < cookieArray.length; i++) {
		    var cookie = cookieArray[i].trim();
		    if (cookie.indexOf(cookieName + '=') === 0) {
		        let cookieValue = cookie.substring(cookieName.length + 1);
		        $.ajax({
		        	url: '${pageContext.request.contextPath}/member/autoSignIn',
		        	data: {
		        		sessionId : cookieValue
		        	},
		        	contentType : "application/text; charset:UTF-8",
		        	success: function(nickname) {
		        		console.log(nickName);
		    			userNick = nickname;
					}
		        })
		        break;
		    }
		}
	}
})

$(document).ready(function(){
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
			
			var first = data.firstPageNoOnPageList;
			var last = data.lastPageNoOnPageList;
			
			for(i = first; i < last+1; i++){
				$('#paganation').append('<button type="button" class="page_btn uncheck_btn" onclick="doAction(' + i + ')" id="btn_' + i + '">'+ i +'</button>')
			} 
			
			var recordCountPerPage = data.recordCountPerPage;
			
			if(data.xnext){
				$('#paganation').append('<button type="button">></button>') 
			}
			
			$('#btn_1').removeClass("uncheck_btn");
			$('#btn_1').addClass("check_btn");
			
		},
		error : function(error) {
			console.error('Error:', error);
		} 
	})//ajax
	
}) 
	
function doAction(seq){
	var checkPageNum = seq;
	var btn = '#btn_' + checkPageNum;
	
	$.ajax({
		type: 'post',
		url: '${pageContext.request.contextPath}/emergency/getPage',
		data: {
			currentNum: checkPageNum
		}, 
		success: function(data){
			$('#paganation').empty();
			
			var firstRecord = data.firstRecordIndex;
			var lastRecord = data.lastRecordIndex;
			
			getList(firstRecord, lastRecord);
			
			if(data.xprev){
				$('#paganation').append('<button type="button"><</button>')
			}
			
			var first = data.firstPageNoOnPageList;
			var last = data.lastPageNoOnPageList;
			
			for(i = first; i < last+1; i++){
				$('#paganation').append('<button type="button" class="page_btn uncheck_btn" onclick="doAction(' + i + ')" id="btn_' + i + '">'+ i +'</button>')
			} 
			
			var recordCountPerPage = data.recordCountPerPage;
			
			if(data.xnext){
				$('#paganation').append('<button type="button">></button>') 
			}
			
			$(btn).removeClass("uncheck_btn");
			$(btn).addClass("check_btn");
		}, 
		error: function(e){
			console.log('Error', e);
		}
	})
	
}

function getList(first, last){
	console.log('성공')
	
	var f = first;
	var l = last;
	
	$.ajax({
		type: 'post',
		url: '${pageContext.request.contextPath}/emergency/getList',
		data: {
			firstRecordIndex: f,
			lastRecordIndex: l
		}, 
		success: function(data){
			$('#contents').empty();
			
			$.each(data, function(index, item) { // 데이터 =item
				$("#contents").append(
						'<div class="img_box"><a href="${pageContext.request.contextPath}/emergency/board?emergencyId=' + item.emergencyId + '">'
								+'<img alt="응급상황 사진" align="left" src="' + item.imgFile + '"><span>'
						+ item.title + '</span></a></div>'); // index가 끝날때까지 
			});
		}, 
		error: function(e){
			console.log('Error', e);
		}
	})
}

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
				<div class="subheading" style="margin-bottom: 20px;">
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
					<c:if test="${not empty memberNo}">
						<form action="createBoard">
							<button type="submit" class="contetn_btn">응급상황 추가하기</button>
						</form>
					</c:if>
				</div>
				
				<div id="contents" style="width: 880px; display: flex; gap: 10px; flex-wrap: wrap;">
					<c:forEach var="emergencyList" items="${emergencyList}">
						<div class="img_box">
						<a href="${pageContext.request.contextPath}/emergency/board?emergencyId=${emergencyList.emergencyId}">
							<img alt="응급상황 사진" align="left" src="${emergencyList.imgFile}"> 
							<span>${emergencyList.title}</span>
						</a>
						</div>
					</c:forEach>
				</div>
			<div class="paging" id="paganation" style="margin: 20px;">
			</div>
		</div><!-- content div -->
		</div>
		<jsp:include page="/default/footer.jsp" flush="true" />
	</div>
</body>
</html>