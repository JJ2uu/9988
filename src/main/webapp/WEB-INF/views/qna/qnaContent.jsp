<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
	
	var memberNo = 3;
	$(".qnaReplyEnter").click(function() {
		var replyContent = $('.qnaReplyInput').val();
     	$.ajax({
			url : "qnaReplyInsert",
			data : {
				memberNo : memberNo,
				qnaId : ${qnaVO.qnaId},
				content : replyContent
			},
			success : function(x) {
				location.reload();
			}
		}) 	 
   });
	
    
	$(".reReplyEnter").click(function() {
		var replyContent = $('.reReplyInput').val();
		var groupId = $(this).closest('.replySpace').find('.replyId').text();
		
     	$.ajax({
			url : "reReplyInsert",
			data : {
				memberNo : memberNo,
				qnaId : ${qnaVO.qnaId},
				content : replyContent,
				groupId : groupId
			},
			success : function(x) {
				location.reload();
			}
		}) 	 
   });
	
	$(".reReply").click(function() {
		 $(this).closest('.replySpace').find(".reReplyWrite").toggleClass("toggle");
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
	<c:forEach var="i" begin="1" end="${fn:length(qnaReplyList)}">
	<div class="replySpace">
		<div style="font-weight: 600;">초이초이</div>
		<div style="display: flex; flex-direction: column; gap: 10px;">
			<div style="display: flex; justify-content: space-between; width: 910px;">
				<div style="max-width: 870px; text-align: left;">${qnaReplyList[i-1].content}
					<span class="replyDate">${qnaReplyList[i-1].date}</span>
					<span class="replyId" style="display: none;">${qnaReplyList[i-1].replyId}</span> 
				</div>
				<div class="reReply">댓글</div>
			</div>
			<div class="reReplyWrite toggle">
				<div>댓글달기</div>
				<div style="position: relative;">
					<input class="reReplyInput">
					<div class="reReplyEnter enter">등록</div>
				</div>
			</div>
			<%-- <c:forEach var="i" begin="1" end="${fn:length(reReplyList)}">
			<div style="display: flex; gap: 10px; margin-top: 10px;">
				<div style="font-weight: initial;">↳</div><div style="font-weight:600;">${reReplyList[i-1].memberNo}</div>
				<div>${reReplyList[i-1].content}
					<span class="replyDate">${qnaReplyList[i-1].date}</span>
				</div>
			</div>
			</c:forEach> --%>
		</div>
	</div>
	</c:forEach>	
	<div id="replyWrite">
		<div>댓글달기</div>
		<div style="position: relative;">
			<input class="qnaReplyInput">
			<div class="qnaReplyEnter enter">등록</div> 
		</div>
	</div>
</div>