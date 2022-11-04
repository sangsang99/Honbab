<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="contextPath" value="${pageContext.request.contextPath }"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인(정욱)</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
function test() {
    if (!confirm("정말 삭제하시겠습니까?")) {
        alert("취소되었습니다.");
    } else {
    	window.location.href ='${contextPath}/member/delete?id=${info.id }';
    }
}
</script>
</head>
<body>

<div class="wrap login">
		<h1>로그인</h1>
		<br>
		<input type="button" name="adminLogin" value="adminLogin">관리자
		<br><br>
		<div id="admin">
			<form action="${contextPath }/admin/adminLogin" method="post">
				<input type="button" name="adminId" placeholder="관리자아이디"><br><br>
				<input type="password" name="adminPw" placeholder="관리자비밀번호"><br><br>
				<input type="submit" value="login"> &nbsp; 
			</form>
		</div>
</div>
</body> 



   
    

</body>
</html> --%>