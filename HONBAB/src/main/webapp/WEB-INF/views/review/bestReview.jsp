<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index에 보일 리뷰 페이지</title>
<style type="text/css">
</style>
<script type="text/javascript">
	function upViews(writeNo){
		location.href="review/upViews?writeNo=" + writeNo;
	}
</script>
</head>
<body>

	<table id="bestReview" border="1">
	<tr>
		<td>글번호</td>
		<td>닉네임</td>
		<td>제목</td>
		<td>작성일</td>
		<td>조회수</td>
		<td>추천수</td>
	</tr>	
	<c:if test="${reviewBestList.size() == 0}">
		<tr><td colspan="6">작성된 글이 없습니다.</td></tr>
	</c:if>
	<c:forEach var="review" items="${reviewBestList}">
	<tr>
		<td>${review.writeNo }</td>
		<td>${review.nickname }</td>
		<td width="200px">
			<a href="#" onclick="upViews(${review.writeNo}); return false">${review.title}</a>
			<c:if test='${review.imgName != "None"}'>
				★
			</c:if>
		</td>
		<td>${review.writeDate }</td>
		<td>${review.views }</td>
		<td>${review.likes }</td>
	</tr>
	</c:forEach>
	</table>
</body>
</html>