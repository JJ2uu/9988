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
		$.ajax({
			url: '../daily/articleCnt',
			success: function(response) {
				const pagingWrap = document.getElementById("paging_wrap");
				for (var i = 1; i <= response; i++) {
					const button = document.createElement("button");
					
					button.textContent = i;
					button.classList.add("btn_paging");
					button.value = i;
					
					button.addEventListener("click", function() {
						const btnValue = this.value;
						console.log("클릭: " + btnValue)
						
						/* 기사 목록 */
						$.ajax({
							url: '../daily/articleList',
							data: {
								page : btnValue
							},
							success: function(articleList) {
								$("#article_list").empty();
								$("#article_list").append(articleList)
								window.scrollTo(0, 0);
							}
						})
					})
					pagingWrap.appendChild(button);
				}
				
				/* 페이징 버튼 css 클래스 추가 */
				$(".btn_paging:first").addClass("current");
				
				/* 페이지 로드 시 첫 번째 버튼 클릭 */
		        $(".btn_paging:first").click();
				
				/* 페이징 버튼 css 클래스 제거 */
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
					<span style="font-size: 24px; font-weight: 700; margin-bottom: 20px;">오늘 떴어요</span>
					<div id="article_list"></div>
					<div id="paging_wrap"></div>
				</div>
			</div>
		</div>
		<jsp:include page="/default/footer.jsp" flush="true"/>
	</div>
</body>
</html>