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
	var userNick = '<%= session.getAttribute("userNick") %>';
	
    // userNick이 null이면 qnaWrite 버튼 숨기기
    if (userNick === "null") {
        $("#qnaWrite").hide();
    }

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
		    
		    let searchInput = $('#searchInput').val();
		    let selectedCategory = document.getElementById('category_select').value;
		    
			if (buttonText === "←" && page > 1) {
				updatePagination(currentPage, listCount, totalPages, type);
				$(".btn_paging[value=" + page + "]").addClass("current");
			} else if (buttonText === "→") {
				updatePagination(currentPage, listCount, totalPages, type);
				$(".btn_paging[value=" + page + "]").addClass("current");
			} else {
				currentPage = page;
			}
			if(type == 'qna'){
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
			}else if(type == 'searchAll'){
				$.ajax({
		            url: 'searchAllPage',
		            data:{
		            	search: searchInput,
		            	page: currentPage,
		                pageSize: 10
		                },
		            success: function (response) {
		            	$("#qnaTable").empty().append(response);
		            }
		        });
			}else if(type == 'categorySearch'){
				$.ajax({
		            url: 'categorySearchPage',
		            data:{
		            	search: searchInput,
		            	category: selectedCategory,
		            	page: currentPage,
		                pageSize: 10
		                },
		            success: function (response) {
		            	$("#qnaTable").empty().append(response);
		            }
		        });
			}
            
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
 	// 검색 클릭 이벤트 핸들러
    $("#searchIcon").click(function() {
        performSearch();
    });

    // 검색 엔터 키 이벤트 핸들러
    $("#searchInput").on("keyup", function(event) {
        if (event.key === "Enter") {
            performSearch();
        }
    });
    function performSearch() { 
    	var searchInput = $('#searchInput').val();
   	 	var selectedCategory = document.getElementById('category_select').value;
    	if (searchInput === '') {
    		console.log(searchInput)
    		alert("검색어를 입력해주세요")
		}else if(selectedCategory == "전체"){
			$.ajax({
	            url: 'searchAllPage',
	            data:{
	            	search: searchInput,
	            	page: 1,
	                pageSize: 10
	                },
	            success: function (response) {
	            	$("#qnaTable").empty().append(response);
	            	let searchAllListCount = $("#searchAllListCount").text();
	            	if (searchAllListCount == '0') {
						alert("검색결과가 없습니다.");
						qnaPage(listCount);
					}else{
						updatePagination(1, searchAllListCount, Math.ceil(parseInt(searchAllListCount) / 10), 'searchAll');
					}
	                $(".btn_paging:first").addClass("current");
	            }
	        });
		}else{
			$.ajax({
	            url: 'categorySearchPage',
	            data:{
	            	search: searchInput,
	            	category: selectedCategory,
	            	page: 1,
	                pageSize: 10
	                },
	            success: function (response) {
	            	$("#qnaTable").empty().append(response);
	            	let categorySearchListCount = $("#categorySearchListCount").text();
	            	if (categorySearchListCount== '0') {
	            		alert("검색결과가 없습니다.");
						qnaPage(listCount);
					}else{
	            		updatePagination(1, categorySearchListCount, Math.ceil(parseInt(categorySearchListCount) / 10), 'categorySearch');
					}
	                $(".btn_paging:first").addClass("current");
	            }
	        });
		}
    }
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
                    <div style="font-size: 24px; font-weight: bolder; margin-bottom: 20px;">질문있어요 <img alt="!" src="${pageContext.request.contextPath}/resources/img/speech.svg" width="24px"></div>
                    <div id="search" style="display: flex; flex-direction: row-reverse; margin: 9px; margin-bottom: 20px;">
                        <div id="search_wrap" style="position: relative;">
                            <img alt="돋보기 아이콘" id="searchIcon" style="position: absolute; right: 8px; margin-top: 4px; width: 18px;top: 2px;"
                                src="${pageContext.request.contextPath}/resources/img/Vector.png">
                            <input type="text" id="searchInput" placeholder="검색어를 입력하세요." style="height: 25px; width: 220px;"></div>
                        <select class="board_category" name="category" id="category_select">
                            <option value="전체">전체</option>
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
