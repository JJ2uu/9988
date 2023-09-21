<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/default_sub.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/articleDetail.css" rel="stylesheet" type="text/css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/favicon.ico">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(function() {
		let currentUrl = window.location.href;
		let parsedUrl = new URL(currentUrl);
		let urlParam = parsedUrl.searchParams.get('newsUrl')
		
		$.ajax({
			url: 'articleDetail',
			data: {
				newsUrl : urlParam
			},
			success: function(response) {
				$("#article_wrap").empty()
				$("#article_wrap").append(response)
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
				<div id="article_wrap"></div>
			</div>
		</div>
		<jsp:include page="/default/footer.jsp" flush="true"/>
	</div>
</body>
</html>