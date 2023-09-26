<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap" rel="stylesheet">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/favicon.ico">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>9988 의사 면허 인증</title>
<style type="text/css">
#wrap {
	padding: 50px 20px;
	display: flex;
    flex-direction: column;
    align-items: center;
    gap: 30px;
}

table {
	border-collapse: collapse;
}

thead > tr > th {
	border-top: 1px solid #2C343D;
    border-bottom: 1px solid #B5C2CF;
    height: 40px;
    padding: 2px;
    font-weight: 500;
    color: #2C343D;
}

tbody > tr > td {
	height: 40px;
	padding: 10px 7px;
	border-bottom: 1px solid #F2F6FA;
	font-weight: 400;
	color: #717A84;
	font-size: 14px;
}

.col_content {
	width: 90px;
	border-right: 1px solid #F2F6Fa;
}
</style>
</head>
<body>
<div id="wrap">
	<div>
		<span style="font-size: 24px; font-weight: 700;">의사 면허 인증</span>
	</div>
	<table>
		<thead>
			<tr>
				<th colspan="2">의사인증</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td class="col_content">인증 방법</td>
				<td>
					의사 면허 / 면허자격증명서 / 기타 의사 면허 번호가 확인 가능한 서류 일체 중 하나를 아이디와 함께 아래 이메일로 전송하시면 인증이 가능합니다.
					<br><br>
					<strong>이메일 : triplej9988@gmail.com</strong>
				</td>
			</tr>
			<tr>
				<td class="col_content">인증시점</td>
				<td>회원가입 후 1회</td>
			</tr>
			<tr>
				<td class="col_content">인증소요시간</td>
				<td>영업일 내 1~2일 소요</td>
			</tr>
		</tbody>
	</table>
</div>
</body>
</html>