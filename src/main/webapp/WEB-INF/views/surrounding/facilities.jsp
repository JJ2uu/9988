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
				<div class="subheading" style="margin-bottom: 30px; display: flex; gap: 5px; align-content: center; justify-content: center;">
					<img src="${pageContext.request.contextPath}/resources/img/icon_map.svg" width="24px" id="map_icon"> 
					<span style="font-size: 24px; font-weight: 500; ">내 주변 시설</span>
				</div>
				<div class="search">
					<input type="text" placeholder="건물명, 도로명 또는 지번 검색."> 
					<a href="#"> 
					<img alt="돋보기 아이콘" src="${pageContext.request.contextPath}/resources/img/Vector.png">
					</a>
				</div>

				<div id="map" style=""></div>
			</div>
		</div>
		<jsp:include page="/default/footer.jsp" flush="true" />
	</div>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=41e251a2203d56397e6409ede9f7422d"></script>
	<script>
	var lat;
	var lon;
	var markers = [{
        content: '<div>카카오</div>', 
        latlng: new kakao.maps.LatLng(33.450705, 126.570677)
    },
    {
        content: '<div>생태연못</div>', 
        latlng: new kakao.maps.LatLng(33.450936, 126.569477)
    },
    {
        content: '<div>텃밭</div>', 
        latlng: new kakao.maps.LatLng(33.450879, 126.569940)
    },
    {
        content: '<div>근린공원</div>',
        latlng: new kakao.maps.LatLng(33.451393, 126.570738)
    }
    ];
	//현 위치 기반 
	 if (navigator.geolocation) {
		  navigator.geolocation.getCurrentPosition(showPosition);
		} else {
		  console.log("Geolocation is not supported by this browser.");
		}

	function showPosition(position) {
		console.log("Latitude: " + position.coords.latitude);
		lat = position.coords.latitude;
		console.log("Longitude: " + position.coords.longitude);
		lon = position.coords.longitude;
		
	//지도그리기.	
		var mapContainer = document.getElementById('map');// 지도를 표시할 div 
		var mapOption = {
		center: new kakao.maps.LatLng(lat, lon), // 지도의 중심좌표
		level: 3 // 지도의 확대 레벨
		};
	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var map = new kakao.maps.Map(mapContainer, mapOption);
	}	 
	
	for (var i = 0; i < markers.length; i ++) {
	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({
	        map: map, // 마커를 표시할 지도
	        position: markers[i].latlng // 마커의 위치
	    });

	    // 마커에 표시할 인포윈도우를 생성합니다 
	    var infowindow = new kakao.maps.InfoWindow({
	        content: markers[i].content // 인포윈도우에 표시할 내용
	    });

	    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
	    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
	    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
	    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
	    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
	}

	// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
	function makeOverListener(map, marker, infowindow) {
	    return function() {
	        infowindow.open(map, marker);
	    };
	}

	// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
	function makeOutListener(infowindow) {
	    return function() {
	        infowindow.close();
	    };
	}

	
	</script>
</body>
</html>