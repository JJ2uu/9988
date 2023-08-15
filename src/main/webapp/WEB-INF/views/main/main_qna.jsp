<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap" rel="stylesheet">
<link href="resources/css/default_sub.css" rel="stylesheet" type="text/css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/favicon.ico">
<style type="text/css">
table {
  border-collapse: collapse;
  width: 500px;
  font-size: large;
}

th, td{
  padding: 8px;
  text-align: center;
  border-bottom: 1px solid #ddd;
}

</style>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<body>
<table>
	<tr>
	    <th>카테고리</th>
	    <th id="title">제목</th>
	  	<th>작성일</th>
	</tr>
	<c:forEach var="i" begin="1" end="5">
		<tr>
		    <td style="color: #717A84">병원</td>
		    <td style="font-weight: 400">당뇨 병원 추천해주세요.</td>
		  	<td>2023.08.13</td>
	  	</tr>
	</c:forEach>
</table>
</body>
</html>