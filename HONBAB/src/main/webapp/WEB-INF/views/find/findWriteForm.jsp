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
		
		<form action="${contextPath}/find/findWrite" enctype="multipart/form-data" method="post">
			<b>작성자</b><br>
			<input type="text" name="nickName"><br>
			<b>나 이</b><br>
			<input type="number" name="age" min="1" max="99" autocomplete="off"><br>
			<b>성 별</b><br>
			<input type="radio" name="gen" value="남성" checked>남성
			<input type="radio" name="gen" value="여성" >여성<br>
			<b>지 역</b><br>
			<input type="text" name="region" maxlength="2">ex) 서울, 경기...<br>
			<b>제 목</b><br>
			<input type="text" name="title"><br>
			<b>내 용</b><br>
			<textarea rows="5" cols="20" name="content"></textarea><br>
			
			<input type="submit" value="작성완료"> &nbsp;
		</form>
		
		<c:import url="../main/footer.jsp"/>
</body>
</html>