<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reviewAllList</title>
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

	<c:import url="../main/header.jsp" />
	
	<input type= "radio" name = "sort" id="date" value="date" checked>
	<label for = "sort"> 작성일 </label>
	<input type= "radio" name = "sort" id="views" value="views">
	<label for = "sort"> 조회수 </label>
	<input type= "radio" name = "sort" id="likes" value="likes">
	<label for = "sort"> 추천수 </label>
			

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
			<tr>
				<td colspan="6">작성된 글이 없습니다.</td>
			</tr>
		</c:if>
		<c:forEach var="review" items="${reviewAllList}">
			<tr>
				<td>${review.writeNo }</td>
				<td>${review.nickname }</td>
				<td width="200px"><a href="#"
					onclick="upViews(${review.writeNo}); return false">${review.title}</a>
					<c:if test='${review.imgName != "None"}'>
					★
				</c:if></td>
				<td>${review.writeDate }</td>
				<td>${review.views }</td>
				<td>${review.likes }</td>
			</tr>
		</c:forEach>
	</table>

	<form id="search" name="saerch" action="${contextPath }/review/search" enctype="multipart/form-data" method="post">
		검색 <input type="text" name="text" id="text" placeholder="검색어 입력">
		
		<select name="option" id="option">
			<option value="title">제목으로 검색</option>
			<option value="nickname">닉네임으로 검색</option>
		</select>
		
		<input type="submit" value="검색">
	</form> 
	<br>
	<!--  페이징  -->
	<c:if test="${startPage > block }">
		<a href="reviewAllList?num=${startPage-1}" id="paging">◀</a>
	</c:if>
	<c:forEach var="num" begin="${startPage}" end="${endPage }">
		<a href="reviewAllList?num=${num }">[${num }]</a>
	</c:forEach>
	<c:if test="${endPage < repeat}">
		<a href="reviewAllList?num=${endPage + 1}" id="paging">▶</a>
	</c:if>
	<input type="button" value="글쓰기" onclick="reviewWirte()">
	
	<c:import url="../main/footer.jsp" />

</body>
</html>