<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
</style>
<script type="text/javascript">
	function upViews(writeNo){
		location.href="find/upViews?writeNo=" + writeNo;
	}
</script>
</head>
<body>
	<table id="bestFind" border="1">
	<tr>
		<td>글번호</td>
		<td>닉네임</td>
		<td>제목</td>
		<td>나이</td>
		<td>지역</td>
		<td>성별</td>
		<td>작성일</td>
		<td>조회수</td>
	</tr>	
	<c:if test="${findBestList.size() == 0}">
		<tr><td colspan="8">작성된 글이 없습니다.</td></tr>
	</c:if>
	<c:forEach var="find" items="${findBestList}">
	<tr>
			<td>${find.writeNo }</td>
			<td>${find.nickName }</td>
			<td width="200px">
				<a href="#" onclick="upViews(${find.writeNo}); return false">${find.title}</a>	
			</td>
			<td>${find.age }</td>
			<td>${find.region }</td>
			<td>${find.gen }</td>
			<td>${find.writeDate }</td>
			<td>${find.views }</td>
		</tr>
	</c:forEach>
	</table>
</body>
</html>