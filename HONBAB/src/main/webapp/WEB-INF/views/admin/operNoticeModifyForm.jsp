<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeModify(우상)</title>
</head>
<body>
<h3>공지사항 수정 </h3><hr>
<form id="noticeModify" name="noticeModify" action="${contextPath }/oper/noticeModify?writeNo=${noticeContent.writeNo}" method="post">
	<label for="title">제목</label><br>
	<input type="text" id="title" name="title" value="${noticeContent.title }"><br>

	<label for="contetn">내용</label><br>
	<textarea rows="5" cols="20" id="content" name="content">${noticeContent.content }</textarea><br>
	
	<input type="submit" value="수정완료">
</form>
</body>
</html>