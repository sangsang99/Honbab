<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeContent(우상)</title>
</head>
<body>
	<b>제  목</b>${noticeContent.title } <br>
	<b>내  용</b>${noticeContent.content } <br>
	<b>글번호</b>${noticeContent.writeNo } <br>
	<b>작성일</b>${noticeContent.writeDate } <br>
	<b>조회수</b>${noticeContent.views } <br>

	<a href="${contextPath }/oper/deleteNoticeContent?writeNo=${noticeContent.writeNo }">글삭제 버튼</a>
	<a href="${contextPath }/oper/modifyNoticeContent?writeNo=${noticeContent.writeNo }">글수정 버튼</a>
</body>
</html>