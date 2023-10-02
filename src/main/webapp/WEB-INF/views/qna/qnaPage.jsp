<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript">

$(".title").click(function() {
    var qnaId = $(this).find('.qnaId').text();
    console.log(qnaId);
    
    location.href = "qnaPost.jsp?qnaId="+qnaId;
});

// replyCount가 0인 항목의 .reply를 숨김
$(".reply").each(function() {
    var replyCountText = $(this).text();
    var replyCount = parseInt(replyCountText.replace(/\[|\]/g, ''));
    if (replyCount === 0) {
        $(this).hide();
    }
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
    <c:forEach items="${pageData}" var="list" varStatus="status">
        <tr>
            <td class="num">${list.rowNum}</td>
            <td class="title">
                <a> <span class="category" style="color: #717A84">[${list.category}]</span>
                        <span class="qnaContent">${list.title}</span> 
                        <span class="qnaId" style="display: none;">${list.qnaId}</span> 
                        <span class="reply" style="color: #FF0000; font-size: smaller;">[${list.replyCount}]</span>
                </a></td>
            <td class="writer">${writerList[status.index]}</td>
            <td>${formattedDates[status.index]}</td>
            <td>${list.view}</td>
        </tr>
    </c:forEach>
</table>
