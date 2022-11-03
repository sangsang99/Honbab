<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 삭제(정욱)</title>
</head>
<body>

	<table border="1" width="500px">
		<tr>
			<td><br> <span style="color: green; font-weight: bold;">회원
					강제 탈퇴(일반)</span>
				<form action="adminBan" method="get">
					<br> -회원 아이디- <input type="text" name="user_id"
						placeholder="탈퇴시킬 아이디입력"><br>
					<br>
					<button type="submit" name="submit">회원 강제 탈퇴</button>
					<br> <br>
				</form></td>
		</tr>
	</table>
	<br>
	<br>
	
	<table border="1" width="500px">
		<tr>
			<td><br> <span style="color: green; font-weight: bold;">회원
					강제 탈퇴(파트너)</span>
				<form action="adminBan" method="get">
					<br> -회원 아이디- <input type="text" name="user_id"
						placeholder="탈퇴시킬 아이디입력"><br>
					<br>
					<button type="submit" name="submit">회원 강제 탈퇴</button>
					<br> <br>
				</form></td>
		</tr>
	</table>
	<br>
	<br>
	
	
	
	

	<table border="1" width="500px">
		<tr>
			<td><br> <span style="color: green; font-weight: bold;">파트너승인</span>
				<form action="email">
					<br> -파트너 이메일 전송(가입 승인)- <input type="email" name="email"
						placeholder="이메일 주소입력"><br>
					<br>
					<button type="submit" name="submit">승인 메일 전송</button>
					<br> <br>
				</form></td>
		</tr>
	</table>






</body>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	function test() {
		if (!confirm("정말 탈퇴시키겠습니까?")) {
			alert("취소되었습니다.");
		} else {
			window.location.href = '${contextPath}/member/delete?id=${info.id }';
		}
	}
</script>
</body>
</html>