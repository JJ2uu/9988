<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:forEach var="i" begin="1" end="${fn:length(reReplyList)}">
	<div style="display: flex; gap: 10px; margin-top: 10px;">
		<div style="font-weight: initial;">↳</div><div style="font-weight:600;">${reReplyList[i-1].memberNo}</div>
		<div>${reReplyList[i-1].content}
			<span class="replyDate">${reReplyList[i-1].date}</span>
		</div>
	</div>
</c:forEach>