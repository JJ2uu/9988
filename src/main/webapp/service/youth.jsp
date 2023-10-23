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
				<span style="font-size: 24px; font-weight: 700;">청소년보호정책</span>
				<div class="section">
					<span class="col_title">1. 목적</span>
					<span class="col_content">
						회사는 만 18세 미만의 어린이와 청소년의 온라인 안전을 최우선으로 생각합니다. 본 청소년 보호 정책은 어린이 및 청소년의 개인정보 보호와 온라인 환경에서의 안전한 활동을 보장하기 위해 마련되었습니다.
					</span>
				</div>
				<div class="section">
					<span class="col_title">2. 개인정보 수집 및 이용</span>
					<div class="ol">
						<div>
							<ol>
								<li>만 18세 미만의 어린이와 청소년으로부터 개인정보를 수집하는 경우, 법적 요구사항을 준수하고 법정 대리인의 동의를 받습니다.</li>
								<li>어린이 및 청소년의 개인정보는 주로 회원 가입 및 서비스 이용 목적으로 수집되며, 이를 다른 목적으로 사용하지 않습니다.</li>
							</ol>
						</div>
					</div>
				</div>
				<div class="section">
					<span class="col_title">3. 컨텐츠 및 상호작용</span>
					<div class="ol">
						<div>
							<ol>
								<li>회사는 어린이와 청소년을 위한 안전한 컨텐츠를 제공하고 유해한 내용과 상호작용을 방지하기 위해 노력합니다.</li>
								<li>커뮤니티 기능을 제공하는 경우, 적절한 모니터링 및 신고 시스템을 운영하여 부적절한 콘텐츠와 상호작용을 방지합니다.</li>
							</ol>
						</div>
					</div>
				</div>
				<div class="section">
					<span class="col_title">4. 부모 및 법정 대리인의 참여</span>
					<div class="ol">
						<div>
							<ol>
								<li>만 18세 미만의 어린이와 청소년은 부모 또는 법정 대리인의 동의 없이 회원 가입 및 개인정보 제공을 할 수 없습니다.</li>
								<li>부모 및 법정 대리인은 자녀의 온라인 활동을 지속적으로 모니터링하고 안전한 이용을 보장하기 위해 협력해야 합니다.</li>
							</ol>
						</div>
					</div>
				</div>
				<div class="section">
					<span class="col_title">5. 연령 인증 및 컨트롤</span>
					<div class="ol">
						<div>
							<ol>
								<li>회사는 만 18세 미만의 어린이와 청소년을 위한 연령 인증 메커니즘을 제공하고, 부모 및 법정 대리인에게 컨트롤 옵션을 제공합니다.</li>
								<li>부모 및 법정 대리인은 자녀의 활동을 모니터링하고 필요한 경우 컨트롤을 설정할 수 있습니다.</li>
							</ol>
						</div>
					</div>
				</div>
				<div class="section">
					<span class="col_title">6. 보안 조치</span>
					<div class="ol">
						<div>
							<ol>
								<li>회사는 어린이와 청소년의 개인정보를 보호하기 위해 적절한 보안 조치를 취합니다.</li>
								<li>개인정보 유출 및 해킹을 방지하기 위해 보안 시스템과 프로토콜을 사용합니다.</li>
							</ol>
						</div>
					</div>
				</div>
				<div class="section">
					<span class="col_title">7. 정책 업데이트</span>
					<span class="col_content">
						회사는 청소년 보호 정책을 변경할 수 있으며, 변경 사항은 웹사이트 또는 앱 내 공지사항을 통해 공지됩니다.
					</span>
				</div>
			</div>
		</div>
		<jsp:include page="/default/footer.jsp" flush="true"/>
	</div>
</body>
</html>