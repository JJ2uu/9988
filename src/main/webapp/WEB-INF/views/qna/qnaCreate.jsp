<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
#title{
    width: 448px;
    height: 40px;
}
select {
	width: 250px;
}
.qnaContent{
	width: 800px;
	height: 500px;
}
input::-webkit-outer-spin-button, input::-webkit-inner-spin-button {
	-webkit-appearance: none;
	margin: 0;
}
tbody{
	display: flex;
    flex-direction: column;
}
.category {
    height: 40px;
}
#qnaInsert{
	background-color: #407FBA;
    color: white;
    border: hidden;
    width: 830px;
    height: 50px;
    font-size: medium;
    margin: 15px;
    cursor: pointer;
}
</style>
<div style="font-size: 24px; font-weight: bolder; margin-bottom: 20px;">질문 글쓰기</div>
<div>
	<table>
		<tr style="font-weight: 400;">
			<th>제목</th>
			<th><input type="text" id="title"></th>
			<th>카테고리</th>
			<th>
				<select class="category" name="category">
						<option>카테고리</option>
						<option value="병원">병원</option>
						<option value="질병">질병</option>
						<option value="의약품">의약품</option>
						<option value="건강상식">건강상식</option>
				</select>
			</th>
		</tr>
		<tr>
			<td>내용</td>
			<td rowspan="3"><textarea class="qnaContent"> </textarea></td>
		</tr>
	</table>
	<div><button id="qnaInsert">글 작성 완료</button></div>
</div>
