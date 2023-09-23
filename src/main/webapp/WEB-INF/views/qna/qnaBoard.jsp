<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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

<script type="text/javascript">
$(function() {
    const pagination = $("#paging_wrap");

    // 페이징 버튼 업데이트
    function updatePagination(currentPage, totalCnt, totalPages, type) {
        pagination.empty();
        const maxVisiblePages = 10;

        const currentPageGroup = Math.ceil(currentPage / maxVisiblePages);

        const startPage = (currentPageGroup - 1) * maxVisiblePages + 1;
        let endPage = Math.min(currentPageGroup * maxVisiblePages, totalPages);

        if (endPage > totalPages) {
            endPage = totalPages;
        }

        // "<" 버튼 추가
        if (startPage > 1) {
            addPaginationButton("←", startPage - 1, totalPages, type);
        }

        // 페이지 버튼 추가
        for (let i = startPage; i <= endPage; i++) {
            addPaginationButton(i, i, totalPages, type);
        }

        // ">" 버튼 추가
        if (endPage < totalPages) {
            addPaginationButton("→", endPage + 1, totalPages, type);
        }
    }

    // 페이징 버튼 생성
    function addPaginationButton(text, page, totalPages, type) {
    	const button = document.createElement("button");
		button.className = "btn_paging";
		button.value = page;
		button.textContent = text;
		button.addEventListener("click", function () {
			$(this).addClass("current").siblings().removeClass("current");
			
			let currentPage = parseInt($(this).attr("value"));
		    let buttonText = $(this).text();
		    
			if (buttonText === "←" && page > 1) {
				updatePagination(currentPage, listCount, totalPages, type);
				$(".btn_paging[value=" + page + "]").addClass("current");
			} else if (buttonText === "→") {
				updatePagination(currentPage, listCount, totalPages, type);
				$(".btn_paging[value=" + page + "]").addClass("current");
			} else {
				currentPage = page;
			}
            $.ajax({
                url: 'qnaPage',
                data: {
                    page: currentPage,
                    pageSize: 10
                },
                success: function (response) {
                    $("#qnaTable").empty().append(response);
                }
            });
        });
        pagination.append(button);
    }

    // qnaPage 함수 수정
    function qnaPage(listCount) {
        updatePagination(1, listCount, Math.ceil(listCount / 10), 'qna');

        $.ajax({
            url: 'qnaPage',
            data: {
                page: 1,
                pageSize: 10
            },
            success: function (response) {
                $("#qnaTable").empty().append(response);
                $(".btn_paging:first").addClass("current");
            }
        });
    }

    // 페이지 로딩시 qnaPage 호출
    var listCount = ${listCount};
    qnaPage(listCount);

    // qnaWrite 버튼 클릭 이벤트
    $("#qnaWrite").click(function () {
        $.ajax({
            url: 'qnaCreate',
            success: function (x) {
                location.href = 'qnaCreate';
                console.log("qna글쓰기");
            }
        });
    });
});
</script>

</head>

<body>
    <div id="wrap">
        <div id="header">
            <jsp:include page="/default/header.jsp" flush="true">
                <jsp:param name="mode" value="1" />
            </jsp:include>
        </div>
        <div id="content_wrap">
            <div id="content">
                <div id="qna_wrap" style="width: 1000px">
                    <div style="font-size: 24px; font-weight: bolder; margin-bottom: 20px;">질문있어요</div>
                    <div id="search" style="display: flex; flex-direction: row-reverse; margin: 9px; margin-bottom: 20px;">
                        <div id="search_wrap" style="position: relative;">
                            <img alt="돋보기 아이콘" style="position: absolute; right: 8px; margin-top: 4px; width: 18px;top: 2px;"
                                src="${pageContext.request.contextPath}/resources/img/Vector.png">
                            <input type="text" placeholder="검색어를 입력하세요." style="height: 25px; width: 220px;"> </div>
                        <select class="board_category" name="category">
                            <option>카테고리</option>
                            <option value="병원">병원</option>
                            <option value="질병">질병</option>
                            <option value="의약품">의약품</option>
                            <option value="건강상식">건강상식</option>
                        </select>
                    </div>
                    <div id="qnaTable"></div>
                    <div id="qnaBottomWrap">
	                    <button id="qnaWrite">글쓰기</button>
	                    <div id="paging_wrap"></div>
	               	</div>
	            </div>
            </div>
        </div>
        <jsp:include page="/default/footer.jsp" flush="true" />
    </div>
</body>
</html>
