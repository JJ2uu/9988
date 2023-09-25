<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
$(".title").click(function() {
	var qnaId = $(this).find('.qnaId').text();
	console.log(qnaId);
	
    location.href = "${pageContext.request.contextPath}/qna/qnaPost.jsp?qnaId="+qnaId;
});
</script>
<table>
	<tr>
	    <th>카테고리</th>
	    <th id="title">제목</th>
	  	<th>작성일</th>
	</tr>
	<c:forEach var="i" begin="1" end="5">
		<tr>
		    <td style="color: #717A84">[${qnaList[i-1].category}]</td>
		    <td class="title">
				<a> 
					<span style="font-weight: 400">${qnaList[i-1].title}</span> 
					<span class="qnaId" style="display: none;">${qnaList[i-1].qnaId}</span> 
				</a></td>
		  	<td>${formattedDates[i-1]}</td>
	  	</tr>
	</c:forEach>
</table>
