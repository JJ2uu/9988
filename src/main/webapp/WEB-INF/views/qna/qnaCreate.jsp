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
<script type="text/javascript">
$(function() {
	$('#qnaInsert').click(function(){
		var memberNo = 1;
		var title = $('.qnaTitle').val();
		var content = $('.qnaContent').val();
		var category = $('.create_category').val();
		
		if(title === "" || content === "" || category === ""){
			alert("제목, 카테고리, 내용 중 빠진 곳이 없는지 확인해주세요!")
		}else{
			$.ajax({
				url : "qnaInsert",
				data : {
					memberNo : memberNo,
					title : title,
					content : content,
					category : category
				},
				success : function(x) {
					alert("질문글을 등록했습니다.")
					location.href = "${pageContext.request.contextPath}/qna/qnaBoard";
				}
			})
		}
	})
})
</script>
<body>
	<div id="wrap">
		<div id="header">
			<jsp:include page="/default/header.jsp" flush="true">
				<jsp:param name="mode" value="1" />
			</jsp:include>
		</div>
		<div id="content_wrap">
			<div id="content">
				<div id="qnaCreate_wrap">
					<div style="font-size: 24px; font-weight: bolder; margin-bottom: 20px;">질문 글쓰기</div>
					<div>
						<table>
							<tbody class="create_tbody">
								<tr style="font-weight: 400;">
									<th>제목</th>
									<th><input type="text" id="title" class="qnaTitle"></th>
									<th>카테고리</th>
									<th>
										<select class="create_category" name="category">
												<option value="병원">병원</option>
												<option value="질병">질병</option>
												<option value="의약품">의약품</option>
												<option value="건강상식">건강상식</option>
										</select>
									</th>
								</tr>
								<tr>
									<td>내용</td>
									<td rowspan="3"><textarea class="qnaContent"></textarea></td>
								</tr>
								<tr>
									<td rowspan="4"><button id="qnaInsert">글 작성 완료</button></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="/default/footer.jsp" flush="true" />
	</div>
</body>
</html>