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
.filebox{
	width: 1000px;
	display: flex;
    justify-content: flex-start;
    align-items: center;
}
.symptom {
	width: 1001px;
	height: 60px;
	margin-top: 30px;
	display: flex;
    align-items: center;
    justify-content: flex-start;
}

.symptom input {
	width: 850px;
	height: 100%;
	border-radius: 10px;
	border: 1px solid #000000;
	padding-left: 20px;
	margin-left: 15px;
	margin-bottom: 10px;
}

.solution {
	width: 1001px;
	margin: 20px 0px;
	display: flex;
    justify-content: flex-start;
}

.solution textarea {
	width: 830px;
	height: 100%;
	border-radius: 10px;
	border: 1px solid #000000;
	padding: 20px;
}

.solution textarea::placeholder{
	text-align: left;
	display: flex;
	align-content: flex-start;
	color: #E0E6EC;
}

.complete_btn{
	width: 904px;
	height: 70px;
	margin-left: 80px;
	margin-top: 20px;
}

.complete_btn button{
	width: 120px;
	height: 80%;
	background-color: #407FBA;
	color: #FFFFFF;
	border-radius: 5px;
	font-size: 18px;
	margin-left: 5px;
	margin-right: 5px;
	border-style: none;
	cursor: pointer;
}

.filebox label {
    padding: 10px 20px;
    color: #fff;
    vertical-align: middle;
    background-color: #999999;
    cursor: pointer;
    margin: 60px 0 0 10px;
}

.filebox input[type="file"] {
    position: absolute;
    width: 0;
    height: 0;
    padding: 0;
    border: 0;
}
#preview{
	border-radius: 10px;
	border: 1px solid #000000;
	padding: 5px;
	width: 120px;
	min-height: 90px;
}
</style>
<script type="text/javascript">
$(function() {
	$("#img").change(function() {
	
	var formData = new FormData();
	formData.append("file", $("#img")[0].files[0]);
	
	$.ajax({
		url: '${pageContext.request.contextPath}/amazonS3/boardUpload',
		type: 'post',
		data: formData,
		contentType: false,
	    processData: false,
		enctype: 'multipart/form-data',
		success: function(response) {
			if (response != "fail") {
				let encodedResponse = encodeURIComponent(response);
				let srcPath = "http://zdvkzxzhpbmk19765281.cdn.ntruss.com/" + encodedResponse + "?type=f&w=240&h=180&ttype=jpg";
				$("#frm_imgFile").attr("value", encodedResponse);
				$("#preview").attr("src", srcPath);
			} else {
				console.log("fail")
			} 
		}, error: function(e){
			console.log(e)
		}
	})
	})
})

function complete_write(){
	var title = document.getElementById('frm_title').value;
	var content = document.getElementById('frm_content').value;
	var imgFile = document.getElementById('frm_imgFile').value;
	
	if(title == "" || content == "" || imgFile == ""){
		alert('입력 칸에 내용을 전부 입력해 주세요.')
	} else {
		document.getElementById('upload_frm').submit();
	}
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
			<div id="content">
				<div class="subheading" style="margin-bottom: 10px;">
				<span style="font-size: 24px; font-weight: bolder;">응급이에요</span>
				</div>
				<!-- form태그는 컨트롤러랑 연결 -->
				<form id="upload_frm" action="${pageContext.request.contextPath}/emergency/saveBoard" method="post">
				<div class="symptom">
					<span style="margin: 0px 25px;">증상</span>
					<input placeholder="응급상황을 적어주세요." name="title" id="frm_title">
				</div>
				<div class="solution">
					<span style="margin: 18px 18px;">대처방안</span>
					<textarea id="frm_content" rows="18" cols="120" placeholder="응급 상황 시 대처방안을 적어주세요." name="content"></textarea>
				</div>
				<div class="filebox">
					<span style="margin: 20px 15px;">예시 사진</span>
		            <input id="img" type="file" name="img">
		            <input id="frm_imgFile" type="hidden" name="imgFile">
					<img id="preview" src="#" alt="선택된 이미지가 없습니다" onerror="this.src='${pageContext.request.contextPath}/resources/img/logo.svg'">
					<label for="img">파일찾기</label> 
				</div>
				<div class="complete_btn">
					<button type="button" style="background-color: #E0E6EC; color: #2C343D;" onClick="history.go(-1)">글 작성 취소</button>
					<button id="sava" type="button" onclick="complete_write();">글 작성 완료</button>
				</div>
				</form>
			</div>
		</div>
		<jsp:include page="/default/footer.jsp" flush="true" />
	</div>
</body>
</html>