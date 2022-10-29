<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/login.jsp</title>
<style type="text/css">
.login {
	text-align: center;
	height: 300px;
}
</style>
</head>
<body>
	<c:import url="../main/header.jsp"/>
	<div class="wrap login">
		<h1>로그인</h1>
		<br>
		<form action="${contextPath }/member/user_check" method="post">
			<input type="radio" name="chk_info" value="testuser" checked="checked">개인회원
			<input type="radio" name="chk_info" value="testuserB">사업자회원
			<br><br>
			<input type="text" name="id" placeholder="아이디"><br><br>
			<input type="password" name="pw" placeholder="비밀번호"><br><br>
			<input type="submit" value="login"> &nbsp; 
			<a href="${contextPath }/member/register_form">회원가입</a>
		</form>
	</div>
	<c:import url="../main/footer.jsp"/>
</body>
</html>