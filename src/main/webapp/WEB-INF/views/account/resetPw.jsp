<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div style="display: flex; flex-flow: column; gap: 10px;">
	<span class="tab_title">비밀번호 찾기</span>
	<span>가입 시 입력하신 이메일로 인증번호를 보내 드립니다.</span>
</div>
<div style="display: flex; flex-flow: column; gap: 10px; margin: 30px 0;">
	<input id="userId" class="input_field" placeholder="아이디" value="${userId}">
	<div class="input_wrap">
		<input id="input_email2" class="input_field" placeholder="이메일" style="width: 150px;">
		@
		<input id="userEmailAddress2" class="input_field required" style="width: 150px;">
		<select class="box" id="domain_list2">
			<option value="">직접 입력</option>
			<option value="naver.com">naver.com</option>
			<option value="gmail.com">gmail.com</option>
			<option value="hanmail.net">hanmail.net</option>
			<option value="daum.net">nate.com</option>
		</select>
		<button class="btn_confirm" id="btn_authNumber2">인증번호 받기</button>
	</div>
	<input id="input_authNumber2" class="input_field" placeholder="인증번호 입력">
	<div id="auth_error2" class="error_message" style="display: none;"></div>
</div>
<button id="btn_changePw" class="btn">다음</button>