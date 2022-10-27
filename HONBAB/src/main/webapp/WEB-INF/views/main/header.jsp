<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test Page</title>
<style>
	* {
	padding: 0;
    margin: 0;
    box-sizing: border-box;
	}
	header {
    	width: 100%;
	}
	nav{
		background-color: #f5f5f5;
	}
	nav > ul {
		height: 3rem;
		display: flex;
		justify-content: center;
		align-items: center;
		list-style: none;
	}

	nav > ul > li {
		margin: 0 0.5rem;
		font-size: 1.3rem;
	}
	.title{
		color: black;
    	background-color: #f5f5f5;
	}
</style>
</head>
<body>
	<div class="title">
		<div>
			<h1>HonBab</h1>
		</div>
	</div>
	<header>
		<div>
			<nav>
				<ul>
					<li><a href="${contextPath}/index">HOME</a></li>
					<li><a id="review" href="${contextPath}/review/reviewAllList">혼밥후기</a></li>
					<li><a href="${contextPath}/challengeAllList">도전혼밥</a></li>
					<li><a id="promotion" href="${contextPath}/promotion/promoList">홍보 게시판</a></li>
					<li><a href="#">가게 추천</a></li>
					<li><a href="#">게시판</a></li>
					<li>
						<c:if test="${loginUser == null}">
							<a href="${contextPath }/member/login">로그인</a>
						</c:if>
						<c:if test="${loginUser != null}">
							<a href="${contextPath }/member/logout">로그아웃</a>
						</c:if>
					</li>
					<li>
						<c:if test="${loginUser == null}">
							<a href="${contextPath }/member/register_form">회원가입</a>
						</c:if>
						<c:if test="${loginUser != null}">
							<a href="#">마이페이지</a>
						</c:if>
						</li>
				</ul>
			</nav>
		</div>
	</header>
</body>
</html>

