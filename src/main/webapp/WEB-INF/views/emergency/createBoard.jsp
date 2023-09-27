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
.symptom {
	width: 1001px;
	height: 60px;
	margin-top: 30px;
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
	height: 400px;
	margin-top: 35px;
	margin-bottom: 30px;
}

.solution input {
	width: 850px;
	height: 100%;
	border-radius: 10px;
	border: 1px solid #000000;
	padding-left: 20px;
}

.solution input::placeholder{
	text-align: left;
	display: flex;
	align-content: flex-start;
}
.complete_btn{
	width: 904px;
	height: 70px;
	margin-left: 80px;
	margin-top: 20px;
}

.complete_btn button{
	width: 120px;
	height: 100%;
	background-color: #407FBA;
	color: #FFFFFF;
	border-radius: 5px;
	font-size: 18px;
	margin-left: 20px;
	margin-right: 20px;
	border-style: none;
	cursor: pointer;
}
</style>
<script type="text/javascript">
$(function() {
	$("#img").change(function() {
	
	var formData = new FormData();
	formData.append("file", $("#img")[0].files[0]);
	console.log(formData)
	
	$.ajax({
		url: '${pageContext.request.contextPath}/amazonS3/boardUpload',
		type: 'post',
		data: formData,
		contentType: false,
	    processData: false,
		enctype: 'multipart/form-data',
		success: function(response) {
			console.log(response)
			if (response != "fail") {
				let srcPath = "http://figveoefijyo19505068.cdn.ntruss.com/" + response + "?type=f&w=150&h=150";
				$("#imageFile").attr("value", response);
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
				<!-- 이 content div 안에서  작업 시작-->
				<div class="subheading" style="margin-bottom: 10px;">
				<span style="font-size: 24px; font-weight: bolder;">응급이에요</span>
				</div>
				<!-- form태그는 컨트롤러랑 연결 -->
				<form id="upload_frm" action="${pageContext.request.contextPath}/emergency/saveBoard" method="post">
				<div class="symptom">
					<span style="margin-left: 15px;">증상</span>
					<input placeholder="응급상황을 적어주세요." name="title">
				</div>
				<div class="solution">
					<span style="padding-right: 0px;">대처방안</span>
					<input placeholder="응급 상황 시 대처방안을 적어주세요." name="content">
				</div>
				<div class="form-group" style="height: 150px; width: 200px;">
					<span style="padding-right: 0px;">이미지 파일 첨부</span>
		            <input id="img" type="file" name="img">
		            <input id="imageFile" type="hidden" name="imgFile">
					<img id="preview" src="#" width=200 height=150 alt="선택된 이미지가 없습니다" style="align-content: flex-end; ">
				</div>
				<div class="complete_btn">
					<button type="button" style="background-color: #E0E6EC; color: #2C343D;" onClick="history.go(-1)">글 작성 취소</button>
					<button id="sava" type="submit">글 작성 완료</button>
				</div>
				</form>
			</div>
		</div>
		<jsp:include page="/default/footer.jsp" flush="true" />
	</div>
</body>
</html>