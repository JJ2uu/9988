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
		<script type="text/javascript">
		
			$(function() {
				/* 작성일 */
				let date = new Date("${list.date}");
				let currentDate = new Date();
				
				let dateDifference = currentDate - date;
				let dateDisplay = '';
				
				const dateEle = document.getElementById("dateDisplay"+${list.replyId})
				
				if (dateDifference < 60000) {
					dateDisplay = '방금';
				} else if (dateDifference < 3600000) {
				    var minutesAgo = Math.floor(dateDifference / 60000);
				    dateDisplay = minutesAgo + '분 전';
				} else if (dateDifference < 86400000) {
				    var hoursAgo = Math.floor(dateDifference / 3600000);
				    dateDisplay = hoursAgo + '시간 전';
				} else { // 24시간 이상인 경우
					var year = date.getFullYear();
				    var month = date.getMonth() + 1;
				    var day = date.getDate();

				    var yearStr = year.toString().padStart(4, '0');
				    var monthStr = month.toString().padStart(2, '0');
				    var dayStr = day.toString().padStart(2, '0');
				    
				    dateDisplay = yearStr + '. ' + monthStr + '. ' + dayStr;
				}
				
				dateEle.textContent = dateDisplay;
			})
			
		</script>
		<tr>
			<td class="num">${list.replyId}</td>
			<td class="article_title">
				<a href="../qna/qnaPost.jsp?qnaId=${list.qnaId}">
					<span id="qnaId" style="display: none;">[${list.qnaId}]</span>
					<span class="title">${list.content}</span>
				</a>
			</td>
			<td class="writer">${userNick}</td>
			<td id="dateDisplay${list.replyId}"></td>
		</tr>
	</c:forEach>
</tbody>