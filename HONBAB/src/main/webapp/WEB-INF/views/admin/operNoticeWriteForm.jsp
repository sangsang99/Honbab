<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성(우상)</title>
</head>
<body>
<h3>공지사항 작성 </h3><hr>
<form id="noticeWrite" name="noticeWrite" action="${contextPath }/oper/noticeWrite" method="post">
	<label for="title">제목</label><br>
	<input type="text" id="title" name="title"><br>

	<label for="contetn">내용</label><br>
	<textarea rows="10" cols="30" id="content" name="content"></textarea><br>
	
	<input type="submit" value="작성완료">
</form>

</body>
</html>