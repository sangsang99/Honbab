<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

		<div class="index_wrap">
			<ul class="index">
				<li class="writeNo"><span>NO</span></li>
				<li class="writer"><span>WRITER</span></li>
				<li class="title"><span>TITLE</span></li>
				<li class="date"><span>DATE</span></li>
				<li class="view"><span>VIEWS</span></li>
			</ul>
		</div>

		<!-- ad설정한것 먼저 -->
		<c:if test="${promoListAD.size() == 0}">
			<h1>내용이 없습니다.</h1>
		</c:if>

		<c:forEach var="dto" items="${promoListAD }">
			<div class="content_wrap">
				<ul class="index">
					<li class="writeNo"><span>${dto.writeNo }</span></li>
					<li class="writer"><span>${dto.id }</span></li>
					<li class="title"><a
						href="${contextPath }/promotion/contentView?writeNo=${dto.writeNo}">${dto.title}</a>
					</li>
					<li class="date"><span>${dto.saveDate}</span></li>
					<li class="view"><span>${dto.hit }</span></li>
				</ul>
			</div>
		</c:forEach>
		<div class="more">
			<a href="${contextPath }/promotion/promoAllList">+ MORE</a>
		</div>
	</main>
</body>
</html>