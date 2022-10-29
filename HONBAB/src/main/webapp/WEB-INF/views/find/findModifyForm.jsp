<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
<c:import url="../main/header.jsp"/>
		<form action="${contextPath }/find/find_Modify" enctype="multipart/form-data" method="post">
			<input type="hidden" name="uSeq" value="${findContent.uSeq }">
			<b>닉네임</b><br>
			<input type="text" name="nickName" value="${findContent.uNickName}" readonly><br>
			<b>나 이</b><br>
			<input type="number" name="age" value="${findContent.uAge}" min="1" max="99" autocomplete="off"><br>
			<b>성 별</b><br>
			<input type="radio" name="gen" value="${findContent.uGen}" checked>남성
			<input type="radio" name="gen" value="${findContent.uGen}" >여성<br>
			<b>지 역</b><br>
			<input type="text" name="region" value="${findContent.uRegion}" maxlength="2"><br>
			<b>제 목</b><br>
			<input type="text" name="title" value="${findContent.uTitle}"><br>
			<b>내 용</b><br>
			<textarea rows="10" cols="50" name="content">${findContent.uContent}</textarea><br>
			
			<input type="submit" value="수정완료"> &nbsp;
			<input type="button" value="글목록" onclick="location.href='${contextPath }/findAllList'">
		</form>
	<c:import url="../main/footer.jsp"/>
</body>
</html>