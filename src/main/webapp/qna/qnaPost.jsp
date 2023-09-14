<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    Integer qnaId = Integer.parseInt(request.getParameter("qnaId"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/default_sub.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/qna.css" rel="stylesheet" type="text/css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/favicon.ico">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>99팔팔</title>
</head>
<script type="text/javascript">
$(function() {
	var qnaId = <%=qnaId%>;
	
	$.ajax({
		url : "qnaViews",
		data : {
			qnaId : qnaId
		},
		success : function(res) {
		}
	})
	
	$.ajax({
        url: 'qnaContent',
        data: { qnaId: qnaId },
        success: function(x) {
        	$('#qnaContent_wrap').append(x)
        }
    });
	console.log(qnaId);
	$("#qnaUpdate").click(function() {
		$.ajax({
			url : "qnaIdCheck",
			data : {
				qnaId : qnaId
			},
			success : function(x) {
				$('#qnaContent_wrap').append(x)
			}
		})  
    });
	
	
});
</script>
<body>
	<div id="wrap">
		<div id="header">
			<jsp:include page="/default/header.jsp" flush="true">
				<jsp:param name="mode" value="1" />
			</jsp:include>
		</div>
		<div id="content_wrap">
			<div id="content">
				<div id="qnaContent_wrap" style="width: 1000px;">
				
				</div>	
			</div>
		</div>
		<jsp:include page="/default/footer.jsp" flush="true" />
	</div>
</body>
</html>