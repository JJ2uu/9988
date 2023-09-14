<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.List" %>
<thead>
	<tr>
		<th class="num">번호</th>
		<th>내용</th>
		<th class="writer" style="padding: 0 6px;">작성자</th>
		<th>작성일</th>
	</tr>
</thead>
<tbody>
	<c:forEach items="${userReplyList}" var="list" varStatus="status">
		<tr>
			<td class="num">${list.replyId}</td>
			<td class="article_title">
				<a href="../qna/qnaPost.jsp?qnaId=${list.qnaId}">
					<span id="qnaId" style="display: none;">[${list.qnaId}]</span>
					<span class="title">${list.content}</span>
				</a>
			</td>
			<td class="writer">${userNick}</td>
			<td>
            	<fmt:formatDate value="${list.date}" pattern="yyyy. MM. dd" />
			</td>
		</tr>
	</c:forEach>
</tbody>