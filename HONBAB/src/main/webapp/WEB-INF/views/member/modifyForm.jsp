<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/register.jsp</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
function modify(){
	tel1 = $("#tel1").val()
	tel2 = $("#tel2").val()
	tel3 = $("#tel3").val()
	tel1 = tel1 + "-" + tel2 + "-" + tel3
	$("#tel1").val(tel1)
	modify_form.submit()
}
//	const str = "010-1234-5678";
//	let words = str.split('-');
//	words[0];
//	words[1];
//	words[2];

</script>
<style type="text/css">
.wrap {
	width: 600px;
	display: flex;
 	justify-content: center; 
}
</style> 
</head>
<body>
	<c:import url="../main/header.jsp"/>
	<h1 align="center">회원정보 수정</h1>
	<div class="wrap">
		<form id="modify" action="modifyForm" enctype="multipart/form-data" method="post">
			<table border="1">
				<tr>
					<th>아이디</th>
					<td><input type="text" id="id" name="id" value="${info.id}"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" id="pw" name="pw"></td>
				</tr>
				<tr>
					<th>이름</th>
					<td>
						<input type="text" id="name" name="name" value="${info.name}"> 
					</td>
				</tr>
				<tr>
					<th>닉네임</th>
					<td><input type="text" id="nickName" name="nickName" value="${info.nickName}"></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>
					<input type="tel" id="tel" name="tel">
					</td>
				</tr>
				<tr>
					<th>거주지</th>
					<td><c:import url="../member/region.jsp"/></td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
					<input type="radio" id="gender" name="gender" value="m">남
					<input type="radio" id="gender" name="gender" value="f">여
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="text" id="email" name="email"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="수정" > <!-- onclick="modify()" -->
					</td>
				</tr>
			</table>
		</form>
	</div>
	<c:import url="../main/footer.jsp"/>
</body>
</html>