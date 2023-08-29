<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/default_sub.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/qna.css" rel="stylesheet" type="text/css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/favicon.ico">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
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
				<div id="qnaContent_wrap" style="width: 1000px;">
					<div id="qnaContentTop">
						<div style="color: #717A84">병원</div>
						<div class="qnaTitle">당뇨 병원 추천해주세요.</div>
						<div style="color: #717A84">2023.08.13</div>
					</div>
					<hr>
					<div id="qnaContentReal">5년째 당뇨 치료중인데 호전되지 않아 병원을 바꾸려고 합니다. 혹시 추천해주실 병원 있을까요???</div>
					<div style="display: flex; align-items: center; justify-content: space-between;">
						<div id="qnaWriter">
							<div>
								<img alt="작성자 프로필 사진"
									src="${pageContext.request.contextPath}/resources/img/person2.svg"
									width="50px" style="border-radius: 100px;">
							</div>
							<div style="font-weight: 600;">홍홍홍홍</div>
						</div>
						<div id="onlyWriter">
							<div>
								<button id="qnaDelete">삭제하기</button>
								<button id="qnaUpdate">수정하기</button>
							</div>
						</div>
					</div>
					<hr>
					<div id="replySpace">
						<div style="font-weight: 600;">초이초이</div>
						<div style="display: flex; flex-direction: column;">
							<div style="display: flex; justify-content: space-between; width: 910px;">
								<div style="max-width: 870px; text-align: left;">ㅇㅇ동에 있는 김ㅇㅇ교수님이 잘 봐주십니다!!!! 어머니도 여기서 치료하셨어요!!</div>
								<div id="reReply">댓글</div>
							</div>
							<div style="display: flex; gap: 10px; margin-top: 10px;">
								<div style="font-weight: initial;">↳</div><div style="font-weight:600;">홍홍홍홍</div>
								<div>감사합니다!!</div>
							</div>
						</div>
					</div>
					<div id="replyWrite">
						<div>댓글달기</div>
						<div style="position: relative;">
							<input id="reply">
							<div id="enter">등록</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="/default/footer.jsp" flush="true" />
	</div>
</body>
</html>