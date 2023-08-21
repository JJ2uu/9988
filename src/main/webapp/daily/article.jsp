<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/default_sub.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/article.css" rel="stylesheet" type="text/css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/favicon.ico">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>

	$(function() {
		
		/* 기사 목록 */
		$.ajax({
			url: '../daily/articleList',
			success: function(articleList) {
				
				$("#article_list").append(articleList)
				
				/* 페이징 버튼 css 클래스 추가 */
				$(".btn_paging:first").addClass("current");
				
				$(".btn_paging").on("click", function () {
				    $(this).addClass("current").siblings().removeClass("current");
				});
			}
		})
		
	})
	
</script>
<title>99팔팔</title>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<jsp:include page="/default/header.jsp" flush="true">
				<jsp:param name="mode" value="1"/>
			</jsp:include>
		</div>
		<div id="content_wrap">
			<div id="content">
				<div id="article_wrap">
					<span style="font-size: 24px; font-weight: 700;">오늘 떴어요</span>
					<div id="top_article_wrap">
						<div class="top_article">
							<div class="top_thumbnail">
								<img src="${pageContext.request.contextPath}/resources/img/test_thumbnail1.jpg">
							</div>
							<span class="top_writing">농민신문</span>
							<span class="top_title">초기 유방암, 꼭 방사선치료가 필요할까?</span>
						</div>
						<div class="top_article">
							<div class="top_thumbnail">
								<img src="${pageContext.request.contextPath}/resources/img/test_thumbnail2.jpg">
							</div>
							<span class="top_writing">조선일보</span>
							<span class="top_title">“어릴때 폭행당한 아이, 정신질환 위험 높아”</span>
						</div>
						<div class="top_article">
							<div class="top_thumbnail">
								<img src="${pageContext.request.contextPath}/resources/img/test_thumbnail3.jpg">
							</div>
							<span class="top_writing">코메디닷컴</span>
							<span class="top_title">'생체리듬 활발히'... 여름 가기 전 챙겨야 할 자연 식품들</span>
						</div>
					</div>
					<div id="article_list"></div>
				</div>
			</div>
		</div>
		<jsp:include page="/default/footer.jsp" flush="true"/>
	</div>
</body>
</html>