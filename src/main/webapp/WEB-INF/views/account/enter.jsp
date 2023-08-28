<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form style="display: flex; flex-flow: column; gap: 40px;">
	<div class="input_wrap">
		<div class="input_title">
			아이디<strong style="color: red;">*</strong>
		</div>
		<div class="input_content">
			<input id="userId" placeholder="6글자 이상 입력하세요." class="input_field required" autocomplete="username">
			<button id="confirm_id" class="btn_confirm">중복 확인</button>
		</div>
		<div id="id_error" class="error_message" style="display: none;"></div>
	</div>
	<div class="input_wrap">
		<div class="input_title">
			비밀번호<strong style="color: red;">*</strong>
		</div>
		<div class="input_content">
			<input id="userPw" placeholder="8글자 이상, 특수문자를 포함하여 입력하세요." class="input_field required" type="password" autocomplete="new-password">
		</div>
		<div id="pw_error" class="error_message" style="display: none;">비밀번호는 8글자 이상이어야 하며, 특수문자를 포함해야 합니다.</div>
		<div class="input_title" style="margin-top: 20px;">
			비밀번호 확인<strong style="color: red;">*</strong>
		</div>
		<div class="input_content">
			<input id="userPwCheck" placeholder="다시 한 번 입력하세요." class="input_field required" type="password" autocomplete="new-password">
		</div>
		<div id="pwCheck" class="error_message" style="display: none;"></div>
	</div>
	<div class="input_wrap" style="display: flex; justify-content: space-between; gap: 20px;">
		<div style="width: 100%;">
			<div class="input_title">
				이름<strong style="color: red;">*</strong>
			</div>
			<div class="input_content">
				<input id="userName" placeholder="한글로 입력하세요." class="input_field required">
			</div>
		</div>
		<div style="width: 100%;">
			<div class="input_title">
				생년월일<strong style="color: red;">*</strong>
			</div>
			<div class="input_content" id="info_birth">
				<select class="box required" id="birth-year">
					<option disabled selected>출생 연도</option>
				</select>
				<select class="box required" id="birth-month">
					<option disabled selected>월</option>
				</select>
				<select class="box required" id="birth-day">
					<option disabled selected>일</option>
				</select>
			</div>
		</div>
	</div>
	<div class="input_wrap">
		<div class="input_title">
			성별
		</div>
		<div class="input_content">
			<labeL><input type="radio" name="gender" value="남자">남자</labeL>
			<labeL><input type="radio" name="gender" value="여자">여자</labeL>
			<labeL><input type="radio" name="gender" value="null">선택안함</labeL>
		</div>
	</div>
	<div class="input_wrap">
		<div class="input_title">
			이메일<strong style="color: red;">*</strong>
		</div>
		<div class="input_content">
			<input id="userEmail" placeholder="이메일 입력" class="input_field required">
			@
			<input id="userEmailAddress" class="input_field required">
			<select class="box" id="domain_list">
				<option value="">직접 입력</option>
				<option value="naver.com">naver.com</option>
				<option value="gmail.com">gmail.com</option>
				<option value="hanmail.net">hanmail.net</option>
				<option value="daum.net">nate.com</option>
			</select>
		</div>
	</div>
	<div class="input_wrap">
		<div class="input_title">
			휴대폰 번호<strong style="color: red;">*</strong>
		</div>
		<div class="input_content">
			<input class="input_field" value="대한민국 +82" disabled style="cursor: auto; width: 40%;">
			<input id="userPhone" class="input_field required" placeholder="전화번호 입력">
			<button class="btn_confirm" id="certification">인증번호 받기</button>
		</div>
		<input class="input_field" placeholder="인증번호 입력" style="margin-top: 10px;">
	</div>
	<div class="input_wrap">
		<div class="input_title">
			닉네임<strong style="color: red;">*</strong>
		</div>
		<div class="input_content">
			<input id="userNickname" placeholder="띄어쓰기, 특수문자는 허용되지 않습니다." class="input_field required">
			<button id="confirm_nickname" class="btn_confirm">중복 확인</button>
		</div>
		<div id="nick_error" class="error_message" style="display: none;"></div>
	</div>
</form>