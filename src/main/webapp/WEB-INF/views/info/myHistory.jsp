<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="tab2_wrap">
	<div id="section_wrap">
		<div class="tab2_section current">
			<span>나의 질문</span>
			<span class="count">15</span>
		</div>
		<div class="tab2_section">
			<span>나의 질문</span>
			<span class="count">15</span>
		</div>
		<div class="tab2_section">
			<span>나의 질문</span>
			<span class="count">15</span>
		</div>
	</div>
	<table>
		<thead>
			<tr>
				<th class="num">번호</th>
				<th>제목</th>
				<th class="writer" style="padding: 0 6px;">작성자</th>
				<th>작성일</th>
				<th class="views">조회 수</th>
			</tr>
		</thead>
		<tbody>
			<%
				for(int i=1; i <= 10; i++) {
					int n = i;
			%>
			<tr>
				<td class="num"><%=n%></td>
				<td class="article_title">
					<a>
						<span class="category">[병원]</span>
						<span class="title">머리가 아픈데 어디 병원으로 가야할까요??????????????????????????????????????????</span>
						<span class="reply">[4]</span>
					</a>
				</td>
				<td class="writer">홍홍홍홍</td>
				<td>2023. 08. 18</td>
				<td>2</td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>
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
	<div id="search_wrap">
		<input placeholder="키워드를 입력하세요." class="input_field" id="searchBar">
		<button class="btn_search" id="btn_search">검색</button>
	</div>
</div>