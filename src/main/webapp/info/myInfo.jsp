<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/default_sub.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/myInfo.css" rel="stylesheet" type="text/css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/favicon.ico">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

	$(function() {
		/* 마이페이지 탭 메뉴 이벤트 */
		$("ul.tabs li").click(function() {
			const tab_id = $(this).attr('data-tab');
			
	        const url = new URL(window.location);
	        url.searchParams.set('tab', tab_id);
	        window.location.href = url;
		})
		
	    const urlParams = new URLSearchParams(window.location.search);
	    const activeTab = urlParams.get('tab');
	    
	    if (activeTab !== null) {
	        $("ul.tabs li").removeClass('current');
	        $(".tab_content").removeClass('current');
	        
	        $("ul.tabs li[data-tab=" + activeTab + "]").addClass('current');
	        $("#" + activeTab).addClass('current');
	    }
	    
	    /* 유저 닉네임 */
	    let userNick = '<%= session.getAttribute("userNick") %>';
		if (userNick == 'null') {
			let cookieName = "loginCookie";
			let cookieString = document.cookie;
			let cookieArray = cookieString.split(';');
			
			for (var i = 0; i < cookieArray.length; i++) {
			    var cookie = cookieArray[i].trim();
			    if (cookie.indexOf(cookieName + '=') === 0) {
			        let cookieValue = cookie.substring(cookieName.length + 1);
			        $.ajax({
			        	url: '${pageContext.request.contextPath}/member/autoSignIn',
			        	data: {
			        		sessionId : cookieValue
			        	},
			        	contentType : "application/text; charset:UTF-8",
			        	success: function(nickname) {
			    			userNick = nickname;
						}
			        })
			        break;
			    }
			}
		}
		
		/* 마이페이지 - 프로필 사진 */
		$.ajax({
			url: '../member/info/profile',
			data: {
				nickname: userNick
			},
			success: function(response) {
				let profile = "http://figveoefijyo19505068.cdn.ntruss.com/" + response + "?type=f&w=150&h=150";
				$("#img").attr("src", profile);
				
				const profileNick = document.getElementById("profile_nick");
				profileNick.innerHTML = userNick + " 님 반갑습니다."
			}
		})
	    
	    /* 마이페이지 - 내 정보 */
	    $.ajax({
	    	url: '../member/info/myInfo',
	    	data: {
	    		nickname : userNick
	    	},
	    	success: function(response) {
				$("#tab_myInfo").append(response);
				
				$("#info_nick").click(function() {
					window.open('nickChange.jsp','닉네임 변경','width=450,height=420');
				})
				
				$("#info_pw").click(function() {
					window.open('pwChange.jsp','비밀번호 변경','width=450,height=500');
				})
			}
	    })
	    
	    var myQnaCnt;
		var myReplyCnt;
	    
	    /* 마이페이지 - 내 활동 이력 count */
	    $.ajax({
	    	url: '../member/info/totalCnt',
	    	data: {
	    		nickname : userNick
	    	},
	    	success: function(response) {
	    		myQnaCnt = response.myQna
	    		myReplyCnt = response.myReply
				
	    		const qnaSpan = document.getElementById("qnaCnt")
	    		const replySpan = document.getElementById("replyCnt")
	    		
	    		qnaSpan.innerHTML = myQnaCnt
	    		replySpan.innerHTML = myReplyCnt
	    		
	    		/* 페이지 로드시 나의 질문 로드 */
	    		myQna(myQnaCnt);
			}
	    })
	    
	    $(".tab2_section.current").click(function() {
			return;
		})
		
		$(".tab2_section").click(function() {
			$(this).addClass("current").siblings().removeClass("current");
			
			let tabId = $(this).attr("id");
			
			if (tabId === "qnaTab") {
				myQna(myQnaCnt);
			} else if (tabId === "replyTab") {
				myReply(myReplyCnt);
			}
		})
		
	    const pagination = document.getElementById("paging_wrap");
		 
		/* 페이징 버튼 업데이트 */
		function updatePagination(currentPage, totalCnt, totalPages, type) {
	    	$("#paging_wrap").empty();
			const maxVisiblePages = 10;
			
			const currentPageGroup = Math.ceil(currentPage / maxVisiblePages);
			
			const startPage = (currentPageGroup - 1) * maxVisiblePages + 1;
			const endPage = Math.min(currentPageGroup * maxVisiblePages, totalPages);
		    
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
		
		/* 페이징 버튼 생성 */
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
					updatePagination(currentPage, myQnaCnt, totalPages, type);
					$(".btn_paging[value=" + page + "]").addClass("current");
				} else if (buttonText === "→") {
					updatePagination(currentPage, myQnaCnt, totalPages, type);
					$(".btn_paging[value=" + page + "]").addClass("current");
				} else {
					currentPage = page;
				}
			    
			    if (type == 'qna') {
			    	$.ajax({
				    	url: '../member/info/myQna',
				    	data: {
				    		nickname : userNick,
				    		page : currentPage,
				    		pageSize : 10
				    	},
				    	success: function(response) {
				    		$("#dataList").empty();
				    		$("#dataList").append(response);
						}
				    })
				} else if (type == 'reply') {
					$.ajax({
				    	url: '../member/info/myReply',
				    	data: {
				    		nickname : userNick,
				    		page : currentPage,
				    		pageSize : 10
				    	},
				    	success: function(response) {
				    		$("#dataList").empty();
				    		$("#dataList").append(response);
						}
				    })
				}
			});
			pagination.appendChild(button);
		}
		
	    /* 마이페이지 - 내 활동 이력 - 나의 질문 */
	    function myQna(myQnaCnt) {
			let qnaTotal = Math.ceil(myQnaCnt / 10);
	    	updatePagination(1, myQnaCnt, qnaTotal, 'qna');
	    	
			$.ajax({
		    	url: '../member/info/myQna',
		    	data: {
		    		nickname : userNick,
		    		page : 1,
		    		pageSize : 10
		    	},
		    	success: function(response) {
		    		$("#dataList").empty();
					$("#dataList").append(response);
					
					/* 페이징 버튼 css 클래스 추가 */
					$(".btn_paging:first").addClass("current");
				}
		    })
		}
	    
	    function myReply(myReplyCnt) {
			let replyTotal = Math.ceil(myReplyCnt / 10);
			updatePagination(1, myReplyCnt, replyTotal, 'reply')
			
			$.ajax({
				url: '../member/info/myReply',
				data: {
					nickname : userNick,
					page : 1,
					pageSize : 10
				},
				success: function(response) {
					$("#dataList").empty();
					$("#dataList").append(response);
					
					/* 페이징 버튼 css 클래스 추가 */
					$(".btn_paging:first").addClass("current");
				}
			})
		}
	    
	    /* 마이페이지 - 프로필 사진 변경 */
	    $("#file").change(function() {
	    	
	    	var formData = new FormData();
	    	formData.append("file", $("#file")[0].files[0]);
	    	
			$.ajax({
				url: '../amazonS3/profileUpload',
				type: 'post',
				data: formData,
				contentType: false,
			    processData: false,
				enctype: 'multipart/form-data',
				success: function(response) {
					if (response != "fail") {
						let profile = "http://figveoefijyo19505068.cdn.ntruss.com/" + response + "?type=f&w=150&h=150";
						$("#img").attr("src", profile);
					} else {
						console.log("fail")
					}
				}
			})
		})
		
		/* 검색 엔터키 이벤트 테스트 */
		$("#searchBar").keyup(function(event) {
			if (event.which == 13) {
				var search = $('#searchBar').val()
				console.log(search);
			}
		})
		
		/* 검색 마우스 클릭 이벤트 테스트 */
		$("#btn_search").click(function() {
			var search = $('#searchBar').val()
			console.log(search);
		})
	})
	
</script>
<title>99팔팔</title>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<jsp:include page="/default/header.jsp" flush="true">
				<jsp:param name="mode" value="1"/>
			</jsp:include>
		</div>
		<div id="content_wrap">
			<div id="content">
				<div id="myInfo_wrap">
					<div id="profile_wrap">
						<div id="profile_img">
							<img id="img" style="height: 100%;">
						</div>
						<div id="profile_info">
							<span style="font-size: 24px; font-weight: 500;" id="profile_nick"></span>
							<div id="profile_upload">
								<input type="file" name="file" id="file">
								<label for="file">
								  <span class="btn-upload">프로필 사진 수정</span>
								</label>
								<span>JPEG, JPG, PNG 형식이어야 합니다.</span>
							</div>
						</div>
					</div>
					<div id="info_tab_wrap">
						<div>
							<ul class="tabs">
								<li class="tab_menu current" data-tab="tab_myInfo">내 정보</li>
								<li class="tab_menu" data-tab="tab_myHistory">내 활동 이력</li>
							</ul>
							<div id="tab_myInfo" class="tab_content current"></div>
							<div id="tab_myHistory" class="tab_content">
								<div id="tab2_wrap">
									<div id="section_wrap">
										<div class="tab2_section current" id="qnaTab">
											<span>나의 질문</span>
											<span class="count" id="qnaCnt"></span>
										</div>
										<div class="tab2_section" id="replyTab">
											<span>나의 답변</span>
											<span class="count" id="replyCnt"></span>
										</div>
									</div>
									<table id="dataList"></table>
									<div id="paging_wrap"></div>
									<div id="search_wrap">
										<input placeholder="키워드를 입력하세요." class="input_field" id="searchBar">
										<button class="btn_search" id="btn_search">검색</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="/default/footer.jsp" flush="true"/>
	</div>
</body>
</html>