<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="contextPath" value="${pageContext.request.contextPath }"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인(정욱)</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">



</script>
</head>
<body>

<div class="wrap login">
		<h1>로그인</h1>
		<br>
		<input type="button" name="admin_check" value="admin">관리자
		<br><br>
		<div id="admin">
			<form action="${contextPath }/admin/admin_check" method="post">
				<input type="button" name="adminId" placeholder="관리자아이디"><br><br>
				<input type="password" name="adminPw" placeholder="관리자비밀번호"><br><br>
				<input type="submit" value="login"> &nbsp; 
			</form>
		</div>
</div>
</body> 



   
    

</body>
</html>