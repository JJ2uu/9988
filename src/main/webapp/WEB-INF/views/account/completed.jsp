<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div style="display: flex; flex-flow: column; align-items: center; margin-top: 50px; gap: 30px;">
	<img src="${pageContext.request.contextPath}/resources/img/people.svg" width="100px;">
	<div style="font-size: 24px; font-weight: 500;">
		<span style="color: #407FBA; font-weight: 500;">홍길동</span> 님의<br>
		회원가입이 완료되었습니다.
	</div>
	<button class="btn" style="width: 50%;" id="btn_login">로그인</button>
	<div style="display: flex; flex-flow: column;">
		<span style="font-weight: 500;">의료계 종사자이신가요?</span>
		<span>의사면허를 인증하면 질의응답 및 병원을 등록할 수 있어요!</span>
		<a href="#" style="margin-top: 10px; font-size: 18px; text-decoration: underline; text-underline-offset: 5px;">
			<span style="font-weight: 500;">면허 인증 하러가기</span>
		</a>
	</div>
</div>