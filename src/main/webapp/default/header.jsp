<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div id="headerContent">
	<div id="logo">
		<a href="${pageContext.request.contextPath}/9988_main.jsp">
			<img src="${pageContext.request.contextPath}/resources/img/logo.svg" width="160px">
		</a>
	</div>
	<div id="gnb_menu">
		<div id="gnb_map">
			<img src="${pageContext.request.contextPath}/resources/img/icon_map.svg" width="15px" id="map_icon">
			<a href="#"><span style="color: #407FBA;">내 주변 시설찾기</span></a>
		</div>
		<ul id="gnb_menu_list">
			<li><a href="#">질문있어요</a></li>
			<li><a href="#">응급이에요</a></li>
			<li><a href="#">오늘 떴어요</a></li>
			<li><a href="#">뭐 먹을까요?</a></li>
			<li><a href="#">운동해요</a></li>
		</ul>
		<ul id="gnb_login_menu">
			<li><a href="${pageContext.request.contextPath}/register/9988_login.jsp">로그인</a></li>
			<li style="cursor: context-menu;">|</li>
			<li><a href="#">회원가입</a></li>
		</ul>
	</div>
</div>