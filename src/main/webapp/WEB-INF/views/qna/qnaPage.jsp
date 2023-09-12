<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript">
$(function() {
    $(".title").click(function() {
    	var qnaId = $(this).find('.qnaId').text();
    	console.log(qnaId);
    	
        location.href = "qnaPost.jsp?qnaId="+qnaId;
    });        
});
</script>
<table>
	<tr>
		<th class="num">번호</th>
		<th>제목</th>
		<th class="writer" style="padding: 0 6px;">작성자</th>
		<th>작성일</th>
		<th class="views">조회 수</th>
	</tr>
	<c:forEach var="i" begin="1" end="${fn:length(qnaList)}">
		<tr>
			<td class="num">${i}</td>
			<td class="title"><a> <span class="category"
					style="color: #717A84">[${qnaList[i-1].category}]</span> <span
					class="qnaContent">${qnaList[i-1].title}</span> <span class="qnaId"
					style="display: none;">${qnaList[i-1].qnaId}</span> <span
					class="reply" style="color: #FF0000; font-size: smaller;">[${qnaList[i-1].replyCount}]</span>
			</a></td>
			<td class="writer">홍홍홍홍</td>
			<td>${formattedDates[i-1]}</td>
			<td>${qnaList[i-1].view}</td>
		</tr>
	</c:forEach>
</table>