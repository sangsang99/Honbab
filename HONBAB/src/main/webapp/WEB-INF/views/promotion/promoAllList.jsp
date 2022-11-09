<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>promotion/promoList.jsp</title>
<!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&family=Nunito+Sans:wght@400;600;700&display=swap"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/css/find/allList.css?ver=4"
	rel="stylesheet" />

<script type="text/javascript">
	function promoWrite() {
		if (true) {
			location.href = "writeForm";
		}
	}

	function upViews(writeNo) {
		location.href = "upViews?writeNo=" + writeNo;
	}
</script>

</head>
<body>
	<main>
		<!-- header -->
		<c:import url="../main/header.jsp" />

		<section>
			<form id="search" name="saerch"
				action="${contextPath }/promotion/search" enctype="multipart/form-data"
				method="post">
				<div class="search">
					<div id="searchForm">
						<select name="option" id="option">
							<option value="comName">상호명으로 검색</option>
							<option value="address">지역으로 검색</option>
						</select> <input type="text" name="text" id="text" placeholder="검색어 입력">
						<input type="submit" value="검색">
					</div>
				</div>
			</form>
		</section>

		<div class="index_wrap">
			<ul class="index">
				<li class="writeNo"><span>NO</span></li>
				<li class="title"><span>TITLE</span></li>
				<li class="writer"><span>WRITER</span></li>
				<li class="date"><span>DATE</span></li>
				<li class="view"><span>VIEWS</span></li>
			</ul>
		</div>

		<!-- 작성글 전부-->
		<c:if test="${promoList.size() == 0}">
			<h1>내용이 없습니다.</h1>
		</c:if>
		<c:forEach var="dto" items="${promoList }">
			<div class="content_wrap">
				<ul class="index">
					<li class="writeNo"><span>${dto.writeNo }</span></li>
					<li class="title"><a
						href="${contextPath }/promotion/contentView?writeNo=${dto.writeNo}">${dto.title}</a>
					</li>
					<li class="writer"><span>${dto.id }</span></li>
					<li class="date"><span>${dto.saveDate}</span></li>
					<li class="view"><span>${dto.hit }</span></li>
				</ul>
			</div>
		</c:forEach>
		
		<c:if test="${isBizUser == true}">
		<div id="writebtn">
			<input type="button" value="글쓰기" onclick="promoWrite()">
		</div>
		</c:if>

		<!--  페이징  -->
		<c:if test="${!isSearchPage}">
			<div class="paging">
				<c:if test="${startPage > block }">
					<a href="promoAllList?num=${startPage-1}" id="paging">◀</a>
				</c:if>
				<c:forEach var="num" begin="${startPage}" end="${endPage }">
					<a href="promoAllList?num=${num }">${num }</a>
				</c:forEach>
				<c:if test="${endPage < repeat}">
					<a href="promoAllList?num=${endPage + 1}" id="paging">▶</a>
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
</body>
</html>