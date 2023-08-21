<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	for(int i=0; i < 10; i++) {
%>
	<div class="article">
		<div class="article_thumbnail">
			<img src="${pageContext.request.contextPath}/resources/img/test_thumbnail4.jpg">
		</div>
		<div class="article_info">
			<div style="display: flex; flex-flow: column; gap: 5px;">
				<span class="article_title">50대 피부를 20대로... 회춘 가능할까</span>
				<span class="article_content">
					지난 칼럼에서 설명한 것처럼, 인간배아 초기 과정에서 활성화 되어 특정 위치에서만 기능하는 것이 아닌,
					성장시기 동안의 분화를 통해 장기 또는 조직에 기능하도록 지정되는 배아줄기세포는 초기에 활성화 되어 있지만, 성인 시기에는 비활성화 되게 된다.
				</span>
			</div>
			<div style="display: flex; margin-top: 10px; gap: 5px;">
				<span class="article_writer">코메디닷컴</span>
				<span class="article_time">6시간 전</span>
			</div>
		</div>
	</div>
<%
	}
%>
	<div class="line"></div>
	<div id="paging_wrap">
		<%
			for(int i=1; i <= 10; i++) {
				int n = i;
		%>
			<button class="btn_paging"><%=n%></button>
		<%
			}
		%>
	</div>