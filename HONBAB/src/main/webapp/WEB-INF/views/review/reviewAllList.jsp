<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reviewAllList</title>
<script type="text/javascript">
	function reviewWirte() {
		if(true){ //로그인 되어있는지 판단
			location.href="reviewWriteForm";			
		}
	}
	
	function upViews(seq){
		location.href="upViews?uSeq=" + seq;
	}
</script>
</head>
<body>

	<c:import url="../main/header.jsp"/>

	<input type="button" value="글쓰기" onclick="reviewWirte()">
	
	<table border="1">
		<tr>
		<td>글번호</td>
		<td>닉네임</td>
		<td>제목</td>
		<td>작성일</td>
		<td>조회수</td>
		<td>추천수</td>
		</tr>
	
	<c:if test="${reviewAllList.size() == 0}">
		<tr><td colspan="6">작성된 글이 없습니다.</td></tr>
	</c:if>
	<c:forEach var="review" items="${reviewAllList}">
		<tr>
			<td>${review.uSeq }</td>
			<td>${review.uNickName }</td>
			<td width="200px">
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
	
	검색창?<br><br>
	
	<!--  페이징  -->
	<c:if test="${startPage > block }">
		<a href="reviewAllList?num=${startPage-1}" id="paging">◀</a>
	</c:if>
	<c:forEach var = "num" begin="${startPage}" end="${endPage }">
		<a href="reviewAllList?num=${num }">[${num }]</a>
	</c:forEach>
	<c:if test="${endPage < repeat}">
		<a href="reviewAllList?num=${endPage + 1}" id="paging">▶</a>
	</c:if>

	<c:import url="../main/footer.jsp"/>

</body>
</html>