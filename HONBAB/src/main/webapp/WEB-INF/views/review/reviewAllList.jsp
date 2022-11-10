<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reviewAllList</title>
<link
	href="${pageContext.request.contextPath}/resources/css/review/allList.css?ver=4"
	rel="stylesheet" />
<!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Kumbh+Sans:wght@300;400;500;600;700&family=Noto+Sans+KR:wght@300;400;500;700&family=Nunito+Sans:wght@400;600;700&family=Ramabhadra&display=swap"
	rel="stylesheet">
<script type="text/javascript">
	function reviewWirte() {
		var user = '${loginUser}';
		if(user != ''){
			location.href="reviewWriteForm";			
		} else{
			alert("로그인 후 작성 가능합니다.")
		} 
	}
	
	function upViews(writeNo){
		location.href="upViews?writeNo=" + writeNo;
	}
</script>
</head>
<body>
	<!-- header -->
	<c:import url="../main/header.jsp" />

	<section>
		<form id="search" name="saerch" action="${contextPath }/review/search"	enctype="multipart/form-data" method="post">
			<div class="search">
				<div id="searchForm">
						<select name="option" id="option">
							<option value="title">제목으로 검색</option>
							<option value="nickname">닉네임으로 검색</option>
						</select>
						<input type="text" name="text" id="text" placeholder="검색어 입력">
						<input type="submit" value="검색">
				</div>
			</div>
		</form>
	</section>
	<main>

		<div class="index_wrap">
			<ul class="index">
				<li class="writeNo"><span>NO</span></li>
				<li class="ch_title"><span>TITLE</span></li>
				<li class="writer"><span>WRITER</span></li>
				<li class="date"><span>DATE</span></li>
				<li class="view"><span>VIEWS</span></li>
				<li class="lv"><span>LIKE</span></li>
			</ul>
		</div>

		<c:if test="${reviewAllList.size() == 0}">
			<tr>
				<td colspan="6">작성된 글이 없습니다.</td>
			</tr>
		</c:if>

		<c:forEach var="review" items="${reviewAllList}">
			<div class="content_wrap">
				<ul class="index">
					<li class="writeNo">
						<span>${review.writeNo }</span>
					</li>
					<li class="ch_title">
						<span>
						<a href="#" onclick="upViews(${review.writeNo}); return false">${review.title}</a>
						<c:if test='${review.imgName != "None"}'> ★ </c:if>
					</span>
					</li>
					<li class="writer">
						<span>${review.nickname }</span>
					</li>
					<li class="date">
						<span>${review.writeDate }</span>
					</li>
					<li class="view">
						<span>${review.views }</span>
					</li>
					<li class="lv">
						<span>${review.likes }</span>
					</li>
				</ul>
			</div>
		</c:forEach>

		<c:if test="${loginUser != null}">
		<div id="writebtn">
			<input type="button" value="글쓰기" onclick="reviewWirte()">
		</div>
		</c:if>
		
		<!--  페이징  -->
		<c:if test="${!isSearchPage}">
			<div class="paging">
				<c:if test="${startPage > block }">
					<a href="reviewAllList?num=${startPage-1}" id="paging">◀</a>
				</c:if>
				<c:forEach var="num" begin="${startPage}" end="${endPage }">
					<a href="reviewAllList?num=${num }">${num }</a>
				</c:forEach>
				<c:if test="${endPage < repeat}">
					<a href="reviewAllList?num=${endPage + 1}" id="paging">▶</a>
				</c:if>
			</div>
		</c:if>
		<c:if test="${isSearchPage}">
			<div class="paging">
				<c:if test="${startPage > block }">
					<a href="search?num=${startPage-1}" id="paging">◀</a>
				</c:if>
				<c:forEach var="num" begin="${startPage}" end="${endPage }">
					<a href="search?num=${num }">${num }</a>
				</c:forEach>
				<c:if test="${endPage < repeat}">
					<a href="search?num=${endPage + 1}" id="paging">▶</a>
				</c:if>
			</div>
		</c:if>
		
	
		
	</main>

	<!-- footer -->
	<c:import url="../main/footer.jsp" />
	
</body>
</html>