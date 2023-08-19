<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/default_sub.css" rel="stylesheet" type="text/css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/favicon.ico">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>99팔팔</title>
</head>
<style>
table {
	border-collapse: collapse;
	width: 100%;
	font-size: large;
}

th, td {
	padding: 8px;
	text-align: center;
	border-bottom: 1px solid #ddd;
}

#qnaWrite {
	float: right;
    margin: 15px;
    font-size: 16px;
    border-radius: 5px;
    background-color: #407FBA;
    cursor: pointer;
    border: hidden;
    width: 100px;
    height: 38px;
    color: white;
    font-weight: bolder;
    position: absolute;
    right: 5px;
}

.paging button {
	background-color: white;
	color: #000000;
	border: 1px solid;
	width: 40px;
	height: 40px;
	margin-top: 70px;
}

.paging {
	display: flex;
	justify-content: center;
}

.category {
	height: 30px;
}
select{
	cursor: pointer;
}
.qnaContent{
	cursor: pointer;
}
.btn_paging {
	width: 30px;
	height: 30px;
	border: 1px solid #B5C2CF;
	background: #fff;
	color: #717A84;
	font-weight: 400;
	cursor: pointer;
	margin: 5px;
}
#qnaBottomWrap{
	position: relative;
}
</style>
<script type="text/javascript">
	$(function() {
		$("#qnaWrite").click(function() {
			$.ajax({
				url: 'qnaCreate',
				success: function(x) {
					$('#content').empty();
					$('#content').append(x);
					console.log("qna글쓰기");
				}
			})
		})
		
		$(".qnaContent").click(function() {
			$.ajax({
				url: 'qnaContent',
				success: function(x) {
					$('#content').empty();
					$('#content').append(x);
					console.log("qna글 내용");
				}
			})
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
				<div id="qna_wrap" style="width: 1000px">
					<div style="font-size: 24px; font-weight: bolder; margin-bottom: 20px;">질문있어요</div>
					<div id="search" style="display: flex; flex-direction: row-reverse; margin: 9px; margin-bottom: 20px;">
						<div id="search_wrap" style="position: relative;">
							<img alt="돋보기 아이콘" style="position: absolute; right: 8px; margin-top: 4px; width: 18px;top: 2px;"
								src="${pageContext.request.contextPath}/resources/img/Vector.png">
							<input type="text" placeholder="검색어를 입력하세요." style="height: 25px; width: 220px;"> </div>
						<select class="category" name="category">
							<option>카테고리</option>
							<option value="병원">병원</option>
							<option value="질병">질병</option>
							<option value="의약품">의약품</option>
							<option value="건강상식">건강상식</option>
						</select>
					</div>
					<div>
						<table>
							<tr>
								<th class="num">번호</th>
								<th>제목</th>
								<th class="writer" style="padding: 0 6px;">작성자</th>
								<th>작성일</th>
								<th class="views">조회 수</th>
							</tr>
							<c:forEach var="i" begin="1" end="10">
								<tr>
									<td class="num">${i}</td>
									<td class="article_title">
										<a> <span class="category" style="color: #717A84">[병원]</span>
												<span class="qnaContent">당뇨 병원 추천해주세요.</span> 
												<span class="reply" style="color: #FF0000; font-size: smaller;">[4]</span>
										</a></td>
									<td class="writer">홍홍홍홍</td>
									<td>2023. 08. 18</td>
									<td>2</td>
								</tr>
							</c:forEach>
						</table>
					</div>
					<div id="qnaBottomWrap">
						<button id="qnaWrite">글쓰기</button>
						<div class="paging">
							<c:forEach var="i" begin="1" end="5">
								<button type="button" class="btn_paging">${i}</button>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="/default/footer.jsp" flush="true" />
	</div>
</body>
</html>