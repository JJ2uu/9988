<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.List" %>
<thead>
	<tr>
		<th class="num">번호</th>
		<th>제목</th>
		<th class="writer" style="padding: 0 6px;">작성자</th>
		<th>작성일</th>
		<th class="views">조회 수</th>
	</tr>
</thead>
<tbody>
	<c:forEach items="${userQnaList}" var="list" varStatus="status">
		<tr>
			<td class="num">${list.qnaId}</td>
			<td class="article_title">
				<a href="../qna/qnaPost.jsp?qnaId=${list.qnaId}">
					<span class="category">[${list.category}]</span>
					<span class="title">${list.title}</span>
					<span class="reply">[4]</span>
				</a>
			</td>
			<td class="writer">${userNick}</td>
			<td>
            	<fmt:formatDate value="${list.date}" pattern="yyyy. MM. dd" />
			</td>
			<td>${list.view}</td>
		</tr>
	</c:forEach>
</tbody>