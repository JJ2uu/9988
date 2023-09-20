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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/search_box.css" type="text/css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>99팔팔</title>
</head>
<style>
.food {
    display: inline-block;
    margin: 15px;
    cursor: pointer;
    border-radius: 5px;
    background-color: #F2F6FA;
    padding: 0 0 8px;
    text-align: -webkit-center;
}

.foodImage {
    width: 300px;
    height: 300px;
    border-radius: 5px 5px 0 0;
}

.foodText {
    font-weight: bold;
    font-size: 16px;
    max-width: 250px; /* 원하는 최대 너비 설정 */
    white-space: nowrap; /* 글자 줄바꿈 방지 */
    overflow: hidden; /* 넘치는 내용 감춤 */
    text-overflow: ellipsis; /* 생략 부호 표시 */
}
#foodMain {
    display: flex;
    flex-direction: column;
    align-items: center;
    width: 1000px
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
</style>
<script type="text/javascript">
$(function() {

	$("#foodSearch").click(function() {
		$.ajax({
			url : "crawling",
			data : {
				Search : $("#foodSearchTitle").val()
			},
			success : function(x) {
				console.log(x);
				$("#contentWrap").html(x)
			}
		})  
    });
	
});
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
				<div id="foodMain">
					<div class="subheading" style="margin-bottom: 10px;">
						<span style="font-size: 24px; font-weight: bolder; margin-bottom: 20px">뭐 먹을까요?</span>
					</div>
					<div class="search" style="">
						<input id="foodSearchTitle" type="text" placeholder="식재료, 가지고 있는 질병, 예방하고 싶은 질병 등으로 검색">
						<img alt="돋보기 아이콘" id="foodSearch" src="${pageContext.request.contextPath}/resources/img/Vector.png">
					</div>
					<div style="margin-top: 50px;" id="contentWrap">
						<c:forEach var="i" begin="1" end="9">
							<div class="food">
								<img class="foodImage" src="${pageContext.request.contextPath}/resources/img/foodimg.png">
								<div class="textContainer">
									<div class="foodText">행복한 주방</div>
									<div class="foodText" style="font-weight: normal;">맛있는 떡볶이</div>
								</div>
							</div>
						</c:forEach>
					</div>
					<div class="paging">
						<c:forEach var="i" begin="1" end="5">
							<button type="button" class="btn_paging">${i}</button>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="/default/footer.jsp" flush="true" />
	</div>
</body>
</html>