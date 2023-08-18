<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/default_sub.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/search_box.css" rel="stylesheet" type="text/css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/favicon.ico">
<style type="text/css">
.search {
	margin: auto;
}

#map {
	width: 900px;
	height: 307px;
	margin-top: 40px;
	border-radius: 10px;
	overflow: hidden;
	border: 2px solid #407FBA;
}
</style>
<title>99팔팔</title>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<jsp:include page="/default/header.jsp" flush="true">
				<jsp:param name="mode" value="1" />
			</jsp:include>
		</div>
		<div id="content_wrap">
			<div id="content">
				<!-- 이 content div 안에서  작업 시작-->
				<div class="subheading" style="margin-bottom: 10px; ">
					<img
						src="${pageContext.request.contextPath}/resources/img/icon_map.svg"
						width="24px" id="map_icon"> <span
						style="font-size: 24px; font-weight: 500; ">내
						주변 시설</span>
				</div>
				<div class="search">
					<input type="text" placeholder="건물명, 도로명 또는 지번 검색."> <a
						href="#"> <img alt="돋보기 아이콘"
						src="${pageContext.request.contextPath}/resources/img/Vector.png">
					</a>
				</div>

				<div id="map" style=""></div>
			</div>
		</div>
		<jsp:include page="/default/footer.jsp" flush="true" />
	</div>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=41e251a2203d56397e6409ede9f7422d"></script>
	<script type="text/javascript">
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center : new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
			level : 3
		//지도의 레벨(확대, 축소 정도)
		};

		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	</script>
</body>
</html>