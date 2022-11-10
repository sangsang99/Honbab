<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index에 보일 Find 페이지</title>
<link
	href="${pageContext.request.contextPath}/resources/css/best.css?ver=4"
	rel="stylesheet" />
<!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Kumbh+Sans:wght@300;400;500;600;700&family=Noto+Sans+KR:wght@300;400;500;700&family=Nunito+Sans:wght@400;600;700&family=Ramabhadra&display=swap"
	rel="stylesheet">
<style type="text/css">
</style>
<script type="text/javascript">
	function upViews(writeNo){
		location.href="${contextPath}/find/upViews?writeNo=" + writeNo;
	}
</script>
</head>
<body>
	<div class="main">
		<div class="best_wrap">
			<div class="head">구인 : <span class="eng_title">FIND HONBAB MATE</span></div>
			<aside>
				<div class="line"></div>
				<div class="text">NEW Find</div>
			</aside>

			<section>
				<ul class="index" id="first">
					<li class="no">NO</li>
					<li class="title">TITLE</li>
					<li class="writer">WRITER</li>
					<li class="date">DATE</li>
					<li class="view">VIEWS</li>
				</ul>
				<c:if test="${findBestList.size() == 0}">
					<li class="">함께라면 어느식당도 두렵지 않아요</li>
				</c:if>
				<c:forEach var="best" items="${findBestList }">
					<form>
						<ul class="index">
							<li class="no">${best.writeNo}</li>
							<li class="title">
								<a href="#" onclick="upViews(${best.writeNo}); return false">${best.title}</a>
							</li>
							<li class="writer">${best.nickName}</li>
							<li class="date">${best.writeDate}</li>
							<li class="view">${best.views}</li>
						</ul>
					</form>
				</c:forEach>

				<div class="more">
					<a href="${contextPath }/find/findAllList">+ MORE</a>
				</div>
			</section>
		</div>
	</div>

</body>
</html>