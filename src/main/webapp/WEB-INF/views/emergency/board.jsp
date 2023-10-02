<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/default_sub.css" rel="stylesheet" type="text/css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/favicon.ico">
<style type="text/css">
hr {
    background:#E9E9E9;
    color: #E9E9E9; 
    border: 300; 
    width: 85%
}

#comment_div{
	display: inline-block; 
	padding: 5px; 
	border: solid 1px #ccc; 
	background-color: transparent;; 
	font-size: 9pt; 
	width: 70%;
    border-radius: 15px;
}

#comment_div input:focus{
	outline: none;
}

.comment{
	 background-color: transparent; 
	 width: 90%;
	 padding: 3px; 
	 border: none; 
	 font-size: 9pt; 
}

.send_btn{ 
	background-color: transparent;
	width: 50px; 
	padding: 3px; 
	border: none;
	font-size: 14px; 
	font-weight: 600;
}
.board_btn{
	width: 904px;
	height: 70px;
	margin-top: 50px;
}

.board_btn button{
	width: 120px;
	height: 50%;
	border-radius: 5px;
	font-size: 12px;
	margin-right: 10px;
	float: right;
	border-style: none;
	cursor: pointer;
}

#comments{
	width: 80%; 
	margin: auto; 
}

#cmt{
	width: 100%;
	display: block;
	padding: 0 20px;
	text-align: left;
}
</style>

<script type="text/javascript">
$(document).ready(function(){
	var id = ${emergency.emergencyId};
	
	$.ajax({
		type : 'POST',
		url : "${pageContext.request.contextPath}/emergency/reply/getAllReply",
		data: {
			emergencyId : id
		},
		success : function(data) {
			$.each(data, function(index, item) { // 데이터 =item
					$("#comments").append('<span id="cmt"><span style="font-weight: 700;">' + item.nickName + '&emsp;<span>'
							+ item.content + '</span><span style="float: right;">' + item.regdate + '</span>'); // index가 끝날때까지 
				});
			 
		},
		error : function(error) {
			console.error('Error:', error);
		} 
	}) //ajax
	
})

function register(){
	var comment = document.getElementById("comment").value;
	var userId = document.getElementById("userId").value;
	
	if(userId == '' || userId == null){
		alert('로그인이 필요한 기능입니다.');
	} else if(comment == '' || comment == null){
		alert('댓글을 입력해 주세요.')
	} else{
		document.getElementById('comment_frm').submit();
	}
	
}

function deleteBoard(){
	if(document.getElementById('cmt')){
		alert("댓글이 있는 글은 삭제가 불가능합니다.")
	} else{
		location.href = "${pageContext.request.contextPath}/emergency/delete?emergencyId=${emergency.emergencyId}";
	}
}

</script>
<title>99팔팔</title>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<jsp:include page="/default/header.jsp" flush="true">
				<jsp:param name="mode" value="1"/>
			</jsp:include>
		</div>
		<div id="content_wrap">
			<div id="content">
				<!-- 이 content div 안에서  작업 시작-->
				<div style="width: 1000px">
				<div style="width: 80%; display: flex; margin: auto;">
					<p style="font-weight: 700; font-size: 24px; padding-bottom: 10px;">${emergency.title}</p>&emsp;<p style="color: #A1A4A8; font-size: 24px; padding-bottom: 10px; font-weight: 500;">이렇게 대처하세요!</p>
				</div>
					<hr>
				<div style="width: 80%; display: flex; margin: auto; flex-direction: column;">
					<img id="imgFile" src="${emergency.imgFile}" alt="응급상황 사진" style="display: block; width: 240px; height: 240px; border-radius: 10px; overflow: hidden;" align="left"> 
					<span style="text-align: left; margin: 10px 15px">
						${emergency.content}
					</span>
				</div>
					<hr>
					<div id="comment_main">
					<div id="comments">
					</div>
					<div id="comment_regist">
						<span>댓글 달기</span>&emsp;
						<div id="comment_div" style="margin-top: 20px;">
							<form action="${pageContext.request.contextPath}/emergency/reply/regist" method="post" id="comment_frm">
								<input type="hidden" value="${emergency.emergencyId}" name="emergencyId" id="emergencyId">
								<input type="hidden" value="${memberNo}" name="memberNo" id="memberNo">
								<input type="hidden" value="${userId}" name="userId" id="userId">
								<input type="text" class="comment" name="comment" id="comment">
								<input type="button" onclick="register()" value="등록" class="send_btn" name="">
							</form>
						</div>
					</div>
					</div>
					<c:if test="${memberNo == emergency.memberNo}"> 
					<div class="board_btn">
						<button onclick = "location.href='${pageContext.request.contextPath}/emergency/updateBoard?emergencyId=${emergency.emergencyId}';" id="temSave" type="button" style="background-color: #E0E6EC; color: #2C343D;">수정하기</button>
						<button onclick = "deleteBoard()" id="delete" type="button" style="background-color: #E0E6EC; color: #2C343D;">삭제하기</button>
					</div>
					</c:if> 
				</div>
			</div>
		</div>
		<jsp:include page="/default/footer.jsp" flush="true"/>
	</div>
</body>
</html>