<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동형</title>
</head>
<body>
	<a id="admin" href="${contextPath}/admin/findBoard">구인 게시판</a><br>
	<a id="admin" href="${contextPath}/admin/challBoard">도전 혼밥 게시판</a><br>
	<a id="admin" href="${contextPath}/admin/honbabBoard">혼밥 후기 게시판</a><br>
	<a id="admin" href="${contextPath}/admin/promoBoard">홍보 게시판</a>

</body>
</html>