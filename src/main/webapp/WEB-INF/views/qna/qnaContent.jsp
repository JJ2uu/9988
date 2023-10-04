<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript">
//댓글 등록 함수
function submitReply() {
	var replyContent = $('.qnaReplyInput').val();
	let userNick = '<%= session.getAttribute("userNick") %>';
	//memberNo 값
	$.ajax({
		url: "NickToNo",
		data: {
		  nickname: userNick
		},
		success: function(memberNo) {
			if(replyContent === ""){
				alert("내용을 입력해주세요")
			}else{
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
				
			}
		}
	});
	
}
//대댓글 등록 함수
function submitReReply(reReplyContent, groupId) {
    
    let userNick = '<%= session.getAttribute("userNick") %>';
	//memberNo 값
	$.ajax({
		url: "NickToNo",
		data: {
		  nickname: userNick
		},
		success: function(memberNo) {
			$.ajax({
		        url: "reReplyInsert",
		        data: {
		            memberNo: memberNo,
		            qnaId: ${qnaVO.qnaId},
		            content: reReplyContent,
		            groupId: groupId
		        },
		        success: function(x) {
		            location.reload();
		        }
		    });
		}
	});
}

//댓글 작성 시 작성자를 표시하는 함수
function displayWriter(replyWriter) {
	var writer = '${writer}'; // 작성자 정보
    if (replyWriter === writer) {
        return "작성자";
    }
}

$(function() {
	var userNick = '<%= session.getAttribute("userNick") %>';
	var writer = '${writer}';
    
    if (userNick === "null") {
        $("#replyWrite").hide();
        $(".reReply").hide();
    }

    // userNick과 writer가 같으면 버튼 표시
    if (userNick === writer) {
        $("#qnaDelete").show();
        $("#qnaUpdate").show();
    } else {
        $("#qnaDelete").hide();
        $("#qnaUpdate").hide();
    }
    
	/*대댓글 불러오기*/
	$(".replySpace").each(function() {
		var $this = $(this);
        var replyWriter = $this.find(".replyWriter").text();

        // "작성자"를 표시하는 div를 생성하여 추가
        var writerDiv = $('<div>').text(displayWriter(replyWriter)).css('font-size', 'small');
        $this.find(".replyWriter").after(writerDiv);

	    var groupId = $this.find(".replyId").text();

	    $.ajax({
	        url: "reReplyList",
	        data: {
	            groupId: groupId
	        },
	        success: function(response) {
	            $this.find(".reReplySpace").append(response);
	            $this.find(".reReplyWriter").each(function() {
	                var reReplyWriter = $(this).text();

	                var reWriterDiv = $('<div>').text(displayWriter(reReplyWriter)).css('font-size', 'small');
	                $(this).after(reWriterDiv);
	            });
	        },
	        error: function() {
	            console.error("AJAX 요청에 실패했습니다.");
	        }
	    });
	});
	
	/* 수정하기 */
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
	/* 삭제하기 */
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
	// "등록" 버튼 클릭 이벤트 핸들러
	$(".qnaReplyEnter").click(function() {
	    submitReply();
	});

	// Enter 키 눌림 이벤트 핸들러
	$(".qnaReplyInput").on("keyup", function(event) {
	    if (event.keyCode === 13) { // Enter 키의 keyCode는 13
	        submitReply();
	    }
	});
	
	/* 대댓글 쓰기 "등록" 버튼 클릭 이벤트 핸들러*/
	$(document).on("click", ".reReplyEnter", function() {
	    var reReplyContent = $(this).closest('.replySpace').find('.reReplyInput').val();
	    var groupId = $(this).closest('.replySpace').find('.replyId').text();
	    if (reReplyContent === "") {
	        alert("내용을 입력해주세요");
	    } else {
	        submitReReply(reReplyContent, groupId);
	    }
	});

	// Enter 키 눌림 이벤트 핸들러
	$(".reReplyInput").on("keyup", function(event) {
	    if (event.keyCode === 13) { // Enter 키의 keyCode는 13
	        var reReplyContent = $(this).val();
	        var groupId = $(this).closest('.replySpace').find('.replyId').text();
	        if (reReplyContent === "") {
	            alert("내용을 입력해주세요");
	        } else {
	            submitReReply(reReplyContent, groupId);
	        }
	    }
	});
	
	/* 대댓글 토글 */
	$(".reReply").click(function() {
		 $(this).closest('.replySpace').find(".reReplyWrite").toggleClass("toggle");
    });
});
</script>
<div id="qnaContent_wrap" style="width: 1000px;">
	<div id="qnaContentTop">
		<div style="color: #717A84">${qnaVO.category}</div>
		<div class="qnaTitle">${qnaVO.title}</div>
		<div style="color: #717A84">${formattedDate}</div>
	</div>
	<hr>
	<div id="qnaContentReal">${qnaVO.content}</div>
	<div style="display: flex; align-items: center; justify-content: space-between;">
		<div id="qnaWriter">
			<div>
				<img alt="작성자 프로필 사진" 
				src="https://figveoefijyo19505068.cdn.ntruss.com/${profile}?type=f&w=50&h=50&ttype=jpg" 
				style="border-radius: 100px;" 
				onerror="this.src='https://figveoefijyo19505068.cdn.ntruss.com/default_profile.jpg?type=f&w=50&h=50&ttype=jpg';">
			</div>
			<div style="font-weight: 600;">${writer}</div>
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
		<div><div style="font-weight: 600;" class="replyWriter">${replyWriterList[i-1]}</div></div>
		<div style="display: flex; flex-direction: column;">
			<div style="display: flex; justify-content: space-between; width: 910px;">
				<div style="max-width: 870px; text-align: left;">${qnaReplyList[i-1].content}
					<span class="replyDate">${replyDates[i-1]}</span>
					<span class="replyId" style="display: none;">${qnaReplyList[i-1].replyId}</span> 
				</div>
				<div class="reReply">댓글</div>
			</div>
			<div class="reReplySpace"></div>
			<div class="reReplyWrite toggle">
				<div>댓글달기</div>
				<div style="position: relative;">
					<input class="reReplyInput">
					<div class="reReplyEnter enter">등록</div>
				</div>
			</div>
			
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