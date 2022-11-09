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
<style type="text/css">
</style>
<title>동형</title>
</head>
<body>
<aside>
	<ul class="aside">
		<li>
		<a id="admin" href="${contextPath}/ban/userManagement">사용자관리</a>	
		</li>
		<li>
		<a id="admin" href="${contextPath }/admin">▼ 게시글관리</a>
			<ul>
				<li><a id="admin" href="${contextPath}/find/findAllList"> &nbsp;&gt;구인 게시판</a></li>
				<li><a id="admin" href="${contextPath}/challengeAllList"> &nbsp;&gt;도전 혼밥 게시판</a></li>
				<li><a id="admin" href="${contextPath}/review/reviewAllList"> &nbsp;&gt;혼밥 후기 게시판</a></li>
				<li><a id="admin" href="${contextPath}/promotion/promoAllList"> &nbsp;&gt;홍보 게시판</a></li>
			</ul>
		</li>
		<li class="menu">
		<a href="${contextPath}/oper/operation">영업관리</a> <!-- 우상  -->
		</li>
		<li class="menu">
		<a id="logout" href="${contextPath }/member/logout">Logout</a>
		</li>
	</ul>
</aside>
</body>
</html>