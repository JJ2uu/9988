<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
$(function() {
	console.log(${qnaVO.qnaId});
	$("#qnaUpdate").click(function() {
		$.ajax({
			url : "qnaIdCheck",
			data : {
				qnaId : ${qnaVO.qnaId}
			},
			success : function(x) {
				location.href = "qnaUpdate.jsp?qnaId="+${qnaVO.qnaId}; 
			}
		})  
    });
	
	$("#qnaDelete").click(function() {
         if (confirm('정말로 삭제하시겠습니까?')) {
       	 	$.ajax({
				url : "qnaDelete",
				data : {
					qnaId : ${qnaVO.qnaId}
				},
				success : function(x) {
					location.href = "${pageContext.request.contextPath}/qna/qnaBoard";
				}
			})  
         }
		
    });
});
</script>
<div id="qnaContent_wrap" style="width: 1000px;">
	<div id="qnaContentTop">
		<div style="color: #717A84">${qnaVO.category}</div>
		<div class="qnaTitle">${qnaVO.title}</div>
		<div style="color: #717A84">${qnaVO.date}</div>
	</div>
	<hr>
	<div id="qnaContentReal">${qnaVO.content}</div>
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