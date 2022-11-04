<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!--우상  -->
<c:set var="contextPath" value="${pageContext.request.contextPath }"/> <!-- 우상 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메인페이지</title>
</head>

<body>
버튼눌러서 이후 액션을 알아서 하시면됩니당당당 <br>
<a id="admin" href="${contextPath}/ban/userManagement">관리자삭제</a>	
정욱<input type="button" value="사용자관리"> <br>
<a id="admin" href="${contextPath}/admin/boardManagement">게시글관리</a>
동형 <input type="button" value="게시글관리"> <br>
<a href="${contextPath}/oper/operation">영업관리</a> <!-- 우상  -->
우상 <input type="button" value="영업관리"><br>
</body>
</html>