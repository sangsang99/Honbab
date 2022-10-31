<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
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
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
function test() {
    if (!confirm("정말 탈퇴하시겠습니까?")) {
        alert("취소되었습니다.");
    } else {
    	window.location.href ='${contextPath}/member/delete?id=${info.id }';
    }
}
</script>
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
				<th>이름</th><td>${info.name }</td>
			</tr>
			<tr>	
				<th>닉네임</th><td>${info.nickName }</td>
			</tr>
			<tr>	
				<th>전화</th><td>${info.tel }</td>
			</tr>
			<tr>	
				<th>거주지</th><td>${info.region }</td>
			</tr>
			<tr>	
				<th>성별</th><td>${info.gender }</td>
			</tr>
			<tr>	
				<th>이메일</th><td>${info.email }</td>
			</tr>
			<tr>	
				<td><input type="button" value="수정"></td>
				<td><input type="button" value="삭제" onclick="test();"></td>
			</tr>
		</table>
	</div>
	<c:import url="../main/footer.jsp"/>

</body>
</html>