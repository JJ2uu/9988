<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript">
function formatRelativeDate(timestamp) {
    const currentDate = new Date();
    const date = new Date(timestamp);

    // 보정: 9시간을 빼기
    date.setHours(date.getHours() - 9);

    const elapsed = currentDate - date;
    
    const seconds = Math.floor(elapsed / 1000);
    
    if (seconds < 60) {
        return "방금";
    } else if (seconds < 3600) {
        const minutes = Math.floor(seconds / 60);
        return minutes + "분 전";
    } else if (seconds < 86400) {
        const hours = Math.floor(seconds / 3600);
        return hours + "시간 전";
    } else {
        return timestamp;
    }
}

$(function() {
	$(".replyDate").each(function() {
        const timestamp = $(this).text();
        const formattedDate = formatRelativeDate(timestamp);
        $(this).text(formattedDate);
    });

	$(".reReplyWrap").each(function() {
		var $this = $(this);
        var reReplyWriter = $this.find(".reReplyWriter").text();

        // "작성자"를 표시하는 div를 생성하여 추가
        var writerDiv = $('<div>').text(displayWriter(reReplyWriter)).css('font-size', 'small');
        $this.find(".reReplyWriter").after(writerDiv);

	});
	
});
</script>
<c:forEach var="i" begin="1" end="${fn:length(reReplyList)}">
	<div style="display: flex; gap: 10px; margin-top: 10px;" class="reReplyWrap">
		<div style="font-weight: initial;">↳</div><div><div style="font-weight:600;" class="reReplyWriter">${reReplyWriterList[i-1]}</div></div>
		<div>${reReplyList[i-1].content}
			<span class="replyDate">${reReplyList[i-1].date}</span>
		</div>
	</div>
</c:forEach>