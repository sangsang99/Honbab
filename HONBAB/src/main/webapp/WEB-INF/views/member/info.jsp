
<!-- member/info.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/info.jsp</title>
<style type="text/css">
.wrap {
	width: 500px;
	display: flex;
	justify-content: center;
}
</style>
</head>
<body>
	<c:import url="../main/header.jsp"/>
	<h1 align="center">회원 정보</h1>
	<div class="wrap">
		<br>
		<table class="member_table" border="1">
			<tr>
				<th>아이디</th><td>${info.id }</td>
			</tr>
			<tr>
				<th>비밀번호</th><td>${info.pw }</td>
			</tr>
			<tr>	
				<th>주 소</th><td>${info.addr }</td>
			</tr>
		</table>
	</div>
	<c:import url="../main/footer.jsp"/>

</body>
</html>