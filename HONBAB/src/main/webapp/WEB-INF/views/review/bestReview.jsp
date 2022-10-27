<%@ page language="java" contentType="text/html; charset=EUC-KR"
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
	function upViews(seq){
		location.href="review/upViews?uSeq=" + seq;
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
		<td>${review.uSeq }</td>
		<td>${review.uNickName }</td>
		<td width="200px">
			<!-- <a href="${contextPath}/review/reviewContent?uSeq=${review.uSeq}">${review.uTitle}</a> -->
			<a href="#" onclick="upViews(${review.uSeq}); return false">${review.uTitle}</a>
			<c:if test='${review.uImageName != "None"}'>
				★
			</c:if>
		</td>
		<td>${review.uDate }</td>
		<td>${review.uViews }</td>
		<td>${review.uLike }</td>
	</tr>
	</c:forEach>
	</table>
</body>
</html>