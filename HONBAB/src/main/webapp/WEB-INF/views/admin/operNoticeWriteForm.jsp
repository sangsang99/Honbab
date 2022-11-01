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
form= 작성완료
<form id="noticeWrite" name="noticeWrite" action="${contextPath }/oper/noticeWrite" method="post">
	<input type="hidden"> 
	<input type="text">
	
</form>

</body>
</html>