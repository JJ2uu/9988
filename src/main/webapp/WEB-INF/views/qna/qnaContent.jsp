<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
#qnaContentTop{
	display: flex;
    justify-content: space-between;
}
#qnaContentReal{
    height: 400px;
    display: flex;
    align-items: center;
    max-width: 880px;
}
#qnaWriter{
	display: flex;
    align-items: center;
    gap: 20px;
}
#onlyWriter{
	display: flex;
}
.qnaTitle{
	font-weight: 600;
}
#delete{
	background-color: #E0E6EC;
    border: hidden;
    width: 97px;
    height: 34px;
    margin: 10px;
    border-radius: 5px;
    cursor: pointer;
}
#update{
	background-color: #407FBA;
    border: hidden;
    color: white;
    width: 97px;
    height: 34px;
    border-radius: 5px;
    margin: 10px;
    cursor: pointer;
}
#replyWrite{
	display: flex;
    gap: 15px;
    margin-top: 30px;
}
#replySpace{
	display: flex;
    gap: 10px;
}
#reReply{
	cursor: pointer;
}
</style>
<body>
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
				<button id="delete">삭제하기</button>
				<button id="update">수정하기</button>
			</div>
		</div>
	</div>
	<hr>
	<div id="replySpace">
		<div style="font-weight: 600;">초이초이</div>
		<div style="display: flex; flex-direction: column;">
			<div style="display: flex;">
				<div style="max-width: 530px; text-align: left;">ㅇㅇ동에 있는 김ㅇㅇ교수님이 잘 봐주십니다!!!! 어머니도 여기서 치료하셨어요!!</div>
				<div id="reReply">댓글</div>
			</div>
			<div style="display: flex; gap: 10px; margin-top: 10px;">
				<div style="font-weight: initial;">↳ 홍홍홍홍</div>
				<div>감사합니다!!</div>
			</div>
		</div>
	</div>
	<div id="replyWrite">
		<div>댓글달기</div>
		<div style="display: flex;">
			<input id="reply" style="width: 550px;">
			<div id="enter" style="position: absolute; right: 850px; cursor: pointer;">등록</div>
		</div>
	</div>
</body>
</html>