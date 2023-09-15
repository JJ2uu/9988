<%@page import="com.tripleJ.gg88.domain.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id ="tab1_wrap">
	<div class="info_row">
		<span class="row_title">이름</span>
		<span id="info_name" class="row_content">${member.name}</span>
	</div>
	<div class="info_row">
		<span class="row_title">닉네임</span>
		<span id="info_nickname" class="row_content">${member.nickname}</span>
		<span id="info_nick" class="row_content">닉네임 변경</span>
	</div>
	<div class="info_row">
		<span class="row_title">회원 등급</span>
		<%
			Member member = (Member)request.getAttribute("member");
			if(member.getLevel() == 1) {
		%>
				<span id="info_level" class="row_content">일반 회원</span>
		<%
			} else {
		%>
				<span id="info_level" class="row_content">의사 회원</span>
		<%
			}
		%>
		<span class="row_content" style="margin-left: 20px; cursor: pointer;">
			의사 회원 전환하기
			<span class="arrow"></span>
		</span>
	</div>
	<div class="info_row">
		<span class="row_title">아이디</span>
		<span id="info_id" class="row_content">${userId}</span>
	</div>
	<div class="info_row">
		<span class="row_title">비밀번호</span>
		<span id="info_pw" class="row_content">비밀번호 변경</span>
	</div>
	<div class="info_row">
		<span class="row_title">연락처</span>
		<span id="info_phone" class="row_content">${userPhone}</span>
	</div>
</div>