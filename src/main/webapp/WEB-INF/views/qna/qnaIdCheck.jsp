<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
    Integer qnaId = Integer.parseInt(request.getParameter("qnaId"));
%>
<script type="text/javascript">
$(function() {
	var qnaId = <%=qnaId%>;
	
	$('#btn_qnaUpdate').click(function(){
		var title = $('.qnaUpdateTitle').val();
		var content = $('.qnaContent').val();
		var category = $('.create_category').val();
		
		if(title === "" || content === "" || category === ""){
			alert("제목, 카테고리, 내용 중 빠진 곳이 없는지 확인해주세요!")
		}else{
			$.ajax({
				url : "qnaUpdate",
				data : {
					qnaId : qnaId,
					title : title,
					content : content,
					category : category
				},
				success : function(x) {
					console.log(title,content,category);
					alert("질문글을 수정했습니다.")
					location.href = "${pageContext.request.contextPath}/qna/qnaPost.jsp?qnaId="+qnaId;
				}
			})
		}
		
	})
	$("#btn_preView").click(function() {
		location.href = "${pageContext.request.contextPath}/qna/qnaPost.jsp?qnaId="+qnaId;
    });
})
</script>
<div style="font-size: 24px; font-weight: bolder; margin-bottom: 20px;">질문 글쓰기</div>
<div>
	<table>
		<tbody class="create_tbody">
			<tr style="font-weight: 400;">
				<th>제목</th>
				<th><input type="text" id="title" class="qnaUpdateTitle" value="${qnaVO.title}"></th>
				<th>카테고리</th>
				<th>
					<select class="create_category" name="category">
							<option value="병원" ${qnaVO.category == '병원' ? 'selected' : ''}>병원</option>
							<option value="질병" ${qnaVO.category == '질병' ? 'selected' : ''}>질병</option>
							<option value="의약품" ${qnaVO.category == '의약품' ? 'selected' : ''}>의약품</option>
							<option value="건강상식" ${qnaVO.category == '건강상식' ? 'selected' : ''}>건강상식</option>
					</select>
				</th>
			</tr>
			<tr>
				<td>내용</td>
				<td rowspan="3"><textarea class="qnaContent">${qnaVO.content}</textarea></td>
			</tr>
			<tr style="display: flex; justify-content: space-around;">
				<th><button id="btn_qnaUpdate">질문 글 수정</button></th>
				<th><button id="btn_preView">이전으로 돌아가기</button></th>
			</tr>
		</tbody>
	</table>
</div>
		