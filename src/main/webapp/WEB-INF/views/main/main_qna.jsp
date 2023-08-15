<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
