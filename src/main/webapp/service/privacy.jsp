<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/default_sub.css" rel="stylesheet" type="text/css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/favicon.ico">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>99팔팔</title>
<style type="text/css">
.section {
	width: 800px;
	display: flex;
    flex-direction: column;
    align-items: flex-start;
    text-align: left;
    margin-top: 20px;
    gap: 5px;
}

.col_title{
	font-weight: 700;
	font-size: 16px;
}

.col_content {
	font-size: 13px;
}

p {
	font-size: 13px;
}

.num {
	font-size: 13px;
}

.ol {
	display: flex;
	gap: 5px;
}

ol {
	font-size: 13px;
    padding-left: 12px;
}
</style>
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
				<span style="font-size: 24px; font-weight: 700;">개인정보처리방침</span>
				<div class="section">
					<span class="col_title">1. 개인정보 수집에 대한 동의</span>
					<span class="col_content">
						회사는 이용자로부터 개인정보 수집에 대한 동의를 받고 있습니다. 회사는 회원 가입 절차에서 개인정보 처리방침과 이용 약관에 대한 동의 절차를 마련하고 있으며, 이용자가 동의를 선택하여 클릭하면 개인정보 수집에 대해 동의한 것으로 간주합니다.
					</span>
				</div>
				<div class="section">
					<span class="col_title">2. 수집하는 개인정보의 항목 및 수집 방법</span>
					<div class="ol">
						<span class="num">①</span>
						<div>
							<p>회사는 다음과 같은 개인정보 항목을 수집할 수 있습니다.</p>
							<ol>
								<li>성명(이름)</li>
								<li>연락처 정보(전화번호, 이메일 주소 등)</li>
								<li>서비스 이용 기록 및 로그 정보</li>
							</ol>
						</div>
					</div>
					<div class="ol">
						<span class="num">②</span>
						<div>
							<p>개인정보는 다음과 같은 방법으로 수집될 수 있습니다.</p>
							<ol>
								<li>회원 가입 시 입력</li>
								<li>서비스 이용 중 사용자로부터 직접 제공</li>
								<li>서비스 이용 기록 및 쿠키, 웹 비콘, 서버 기록 등을 통한 자동 수집</li>
							</ol>
						</div>
					</div>
				</div>
				<div class="section">
					<span class="col_title">3. 개인정보의 수집 및 이용목적</span>
					<div class="ol">
						<div>
							<p>회사는 수집한 개인정보를 다음 목적을 위해 이용할 수 있습니다.</p>
							<ol>
								<li>회원 관리 및 서비스 제공</li>
								<li>고객 지원 및 문의 응대</li>
								<li>서비스 개선 및 사용자 경험 향상</li>
								<li>마케팅 및 광고 활동</li>
							</ol>
						</div>
					</div>
				</div>
				<div class="section">
					<span class="col_title">4. 개인정보의 제3자 제공</span>
					<div class="ol">
						<div>
							<p>회사는 사용자의 동의 없이 개인정보를 제3자에게 제공하지 않습니다. 다만, 다음 경우에는 예외적으로 제3자에게 개인정보를 제공할 수 있습니다.</p>
							<ol>
								<li>관련 법률에 따라 정보 제공이 요구되는 경우</li>
								<li>서비스 제공과 관련된 계약 이행을 위해 필요한 경우</li>
								<li>사용자의 안전 및 권익 보호를 위해 필요한 경우</li>
							</ol>
						</div>
					</div>
				</div>
				<div class="section">
					<span class="col_title">5. 개인정보의 보유 기간</span>
					<span class="col_content">
						회사는 개인정보를 이용자의 회원 가입이나 서비스 이용 목적을 달성한 후에는 즉시 파기하거나 다른 방법으로 안전하게 처리합니다. 단, 관련 법령에서 정한 경우에 한하여 보존 기간을 준수합니다.
					</span>
				</div>
				<div class="section">
					<span class="col_title">6. 개인정보 보호 조치</span>
					<div class="ol">
						<div>
							<p>회사는 개인정보 보호를 위해 다음과 같은 조치를 취합니다.</p>
							<ol>
								<li>개인정보 암호화 및 보안 프로토콜의 사용</li>
								<li>접근 제어 및 모니터링 시스템의 운영</li>
								<li>교육 및 정기적인 보안 감사 실시</li>
							</ol>
						</div>
					</div>
				</div>
				<div class="section">
					<span class="col_title">7. 이용자의 권리와 의무</span>
					<div class="ol">
						<div>
							<ol>
								<li>이용자는 개인정보에 대한 접근, 정정, 삭제, 처리 중지 등의 권리를 갖습니다.</li>
								<li>이용자는 개인정보 처리에 동의하지 않을 권리가 있으며, 동의를 거부할 경우 일부 서비스 이용이 제한될 수 있습니다.</li>
							</ol>
						</div>
					</div>
				</div>
				<div class="section">
					<span class="col_title">8. 개인정보 보호 책임자</span>
					<span class="col_content">
						회사는 개인정보 보호 책임자를 지정하여 개인정보 관련 문의 및 민원 처리를 지원합니다.
					</span>
				</div>
				<div class="section">
					<span class="col_title">9. 개인정보 처리방침 변경</span>
					<span class="col_content">
						회사는 개인정보 처리방침을 변경할 수 있으며, 변경 사항은 웹사이트 또는 앱 내 공지사항을 통해 공지합니다.
					</span>
				</div>
				<div class="section">
					<span class="col_title">10. 문의 및 연락처</span>
					<div class="ol">
						<div>
							<p>개인정보 처리에 관한 문의나 민원 사항은 다음 연락처로 문의 가능합니다.</p>
							<ol>
								<li>이메일 : triplej9988@gmail.com</li>
								<li>전화번호 : (02)1234. 1234</li>
							</ol>
						</div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="/default/footer.jsp" flush="true"/>
	</div>
</body>
</html>