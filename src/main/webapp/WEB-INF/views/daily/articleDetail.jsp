<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="article_header">
	<img src="${mediaLogo}" width="100px" class="media_logo">
	<h1>${title}</h1>
	<div style="display: flex; gap: 10px; align-items: center; margin-top: 10px;">
		<span id="article_date">${date}</span>
		<a href ="${newsUrl}" class="original_article">기사원문</a>
	</div>
</div>
<div>
	${content}
</div>
<span class="article_writer">${wrtier}</span>