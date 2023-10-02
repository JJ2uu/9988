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
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=41e251a2203d56397e6409ede9f7422d&libraries=services"></script>
<style type="text/css">
.search {
	margin: auto;
}

#map {
	width: 900px;
	height: 307px;
	border-radius: 10px;
	overflow: hidden;
	border: 2px solid #407FBA;
}

#placesList{
	list-style-type: none;
	width: 80%;
    padding: 0;
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
}

.item{
	width: 40%;
}

#info_title{
	width: 100%;
    text-align: left;
    font-weight: 600;
    font-size: 22px;
    margin-bottom: 8px;
}

#pagination{
	display: flex;
    justify-content: center;
}

#page_a{
	display:block;
    width:30px;
    line-height:30px;
    text-align:center;
    background-color: #fff;
    color: #717A84;
    margin: 0 5px;
    border: 1px solid #B5C2CF;
    font-weight: 400;
    font-size: 12px;
}

#page_a a{
	text-decoration: none;
    font-weight: 400;
}

.tel{
	float: left;
    margin: 10px 0;
}

.jibun{
	width: 100%;
    text-align: left;
    float: left;
}

.tell_img{
	float:left;
	width:33px; 
	height:32px;
	margin: 10px 5px 0px 1px;
	background: url("${pageContext.request.contextPath}/resources/img/call.svg") no-repeat;
}

.frm_btn{
	padding: 8px 18px;
	cursor: pointer;
	border: none;
	background-color: white;
}
#info_location{
	margin: 0 38px;
}

#frm_div img{
	margin-right: 4px;
}

.no_click{
    background-color: white;
}

.on_click{
	background-color: #407FBA;
	border-radius: 20px;
}

.on_click button{
	background-color: #407FBA;
	border-radius: 20px;
}

.on_click img{
	filter: invert(91%) sepia(61%) saturate(4%) hue-rotate(229deg) brightness(124%) contrast(100%);
}

.on_clikc span{
	color: white;
}
</style>
<style>
#placesList .item .markerbg {float:left;width:36px; height:37px;margin:0px 0 0 0px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination .on {background-color: #407FBA; color: #fff; border: 1px solid #407FBA;}
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
				<div class="subheading" style="margin-bottom: 20px; display: flex; gap: 5px; align-content: center; justify-content: center;">
					<img src="${pageContext.request.contextPath}/resources/img/icon_map.svg" width="24px" id="map_icon"> 
					<span style="font-size: 24px; font-weight: 500; ">내 주변 시설</span>
				</div>
                <form onsubmit="searchPlaces(); return false;" id="search_frm">
				<div class="search">
					<input type="text" value="서울 병원" id="keyword" placeholder="키워드와 검색할 장소를 함께 입력해 주세요. "> 
					<a href="javascript:void(0);" onclick="searchSubmit();"> 
					<img alt="돋보기 아이콘" src="${pageContext.request.contextPath}/resources/img/Vector.png">
					</a>
				</div>
                </form>

			<div id="map" style="margin: auto; margin-top: 40px;">
			<div style="z-index: 2; position: absolute; right: 10px; top: 10px;">
                <form onsubmit="searchPlacesWithButton(); return false;" id="btn_frm">
					<div style="width: 180px; height: 40px; background-color: white; padding: 2px; border-radius: 30px; overflow: hidden;display: flex; justify-content: space-around;">
						<div class="on_click" id="hospital_div">
						<button class="frm_btn" value="hospital" type="button" onclick="btnSubmit(this.value);">
							<div id="frm_div" style="display: flex; justify-content: space-around; align-items: center;">
								<img src="${pageContext.request.contextPath}/resources/img/hospital.svg" width="14px;">
								<span>병원</span>
							</div>
						</button>
						</div>
						<div class="no_click" id="health_div">
						<button class="frm_btn" value="health" type="button" onclick="btnSubmit(this.value);">
							<div id="frm_div" style="display: flex; justify-content: space-around; align-items: flex-end;">
								<img src="${pageContext.request.contextPath}/resources/img/running.svg" width="14px;">
								<span>헬스장</span>
							</div>
						</button>
						</div>
					</div>
                </form>
			</div>
			</div>
			<div id="menu_wrap" class="bg_white" style="width: 90%; margin: auto;">
        		<ul id="placesList" style="margin: 22px auto"></ul>
        		<div id="pagination" class="paging"></div>
   			</div>
		</div>
		</div>
		<jsp:include page="/default/footer.jsp" flush="true" />
	</div>

<script>
// 마커를 담을 배열입니다
var markers = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();  

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

// 키워드로 장소를 검색합니다
searchPlaces();

// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {

    var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    } else if(!keyword.includes('병원') && !keyword.includes('헬스장')){
    	alert('병원 혹은 헬스장을 포함하여 검색해 주새요.')
    	return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB); 
}

function searchPlacesWithButton(data) {

    var keyword = data;
    var searchKeyword;
    
    if(keyword == 'hospital'){
    	searchKeyword = "서울 병원";
    } else if(keyword == 'health'){
    	searchKeyword = "서울 헬스장";
    } else{
    	console.log("버튼 에러");
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch(searchKeyword, placesSearchCB); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data);

        // 페이지 번호를 표출합니다
        displayPagination(pagination);

    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === kakao.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title) {
            kakao.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            kakao.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });

            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
        })(marker, places[i].place_name);

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

    var el = document.createElement('li'),
    itemStr = 	'<div class="info">' +
                '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '   <h3 id="info_title">' + places.place_name + '</h3>';

    if (places.road_address_name) {
        itemStr += '<div id="info_location">'
        			+'<span style="text-align: left; float: left;">' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray">' +  places.address_name  + '</span></div>';
    } else {
        itemStr += '    <span>' +  places.address_name  + '</span>'; 
    }
                 
      itemStr += '<span class="tell_img"></span><span class="tel">' + places.phone  + '</span>' +
                '</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.setAttribute("id", "page_a");
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}
 
function searchSubmit(){
	document.getElementById('search_frm').submit();
}

function btnSubmit(data){
	var d = data;
	
	var converse;
	if(data == 'hospital'){
		converse = 'health';
	} else {
		converse = 'hospital';
	}
	
	var id = "#" + data + "_div";
	var converseId = "#" + converse + "_div";
	
	$(converseId).removeClass('on_click');
	$(id).removeClass('no_click');
	$(id).attr("class", 'on_click');
	
	searchPlacesWithButton(d);
}
</script>
</body>
</html>