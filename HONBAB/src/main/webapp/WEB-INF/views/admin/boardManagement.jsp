<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&family=Nunito+Sans:wght@400;600;700&display=swap"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/css/admin.css?ver=4" rel="stylesheet"/> 
<title>동형</title>
</head>
<body>
<aside>
	<ul class="aside">
		<li>
		<a id="admin" href="${contextPath}/ban/userManagement">사용자관리</a>	
		정욱<input type="button" value="관리자삭제"> <br>
		</li>
		<li>
		<a id="admin" href="${contextPath}/admin/boardManagement">게시글관리</a>
		동형 <input type="button" value="게시글관리"> <br>
			<ul>
				<li><a id="admin" href="${contextPath}/find/findAllList">구인 게시판</a></li>
				<li><a id="admin" href="${contextPath}/admin/challBoard">도전 혼밥 게시판</a></li>
				<li><a id="admin" href="${contextPath}/review/reviewAllList">혼밥 후기 게시판</a></li>
				<li><a id="admin" href="${contextPath}/admin/promoBoard">홍보 게시판</a></li>
			</ul>
		</li>
		<li>
		<a href="${contextPath}/oper/operation">영업관리</a> <!-- 우상  -->
		우상 <input type="button" value="영업관리"><br>
		</li>
	</ul>
</aside>
</body>
</html>