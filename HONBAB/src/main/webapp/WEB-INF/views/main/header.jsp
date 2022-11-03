<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
	<link href="${pageContext.request.contextPath}/resources/css/header.css?ver=4" rel="stylesheet"/> 
	<!-- font -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Kumbh+Sans:wght@300;400;500;600;700&family=Noto+Sans+KR:wght@300;400;500;700&family=Nunito+Sans:wght@400;600;700&family=Ramabhadra&display=swap"
      rel="stylesheet"
    />
</head>
<body>
    <header>
      <div class="header_wrap">
        <div class="logo"><span><a href="${contextPath}/index">HONBOB</a></span></div>
        <ul class="nav">
          <li><a id="find" href="${contextPath}/find/findAllList">Find</a></li>
          <li><a href="${contextPath}/challengeAllList">Challenge</a></li>
          <li><a id="review" href="${contextPath}/review/reviewAllList">Review</a></li>
          <li><a id="promotion" href="${contextPath}/promotion/promoList">Notice?</a></li>
          <c:if test="${loginUser == null}">
          	<li class="kr_menu"><a href="${contextPath }/member/login">로그인</a></li>
		  	<li class="kr_menu"><a href="${contextPath }/member/register_form">회원가입</a></li>
		  </c:if>
		  <c:if test="${loginUser != null}">
	        <li><a id="logout" href="${contextPath }/member/logout">logout</a></li>
          	<li class="kr_menu"><a id="mypage" href="${contextPath }/member/info?id=${loginUser}">mypage</a></li>
		  </c:if>
        </ul>
      </div>
    </header>

<%-- 	<div class="title">
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
					<li><a id="find" href="${contextPath}/find/findAllList">구인 게시판</a></li>
					<c:if test="${loginUser == null}">
						<li><a href="${contextPath }/member/login">로그인</a></li>
						<li><a href="${contextPath }/member/register_form">회원가입</a></li>
					</c:if>
					<c:if test="${loginUser != null}">
						<li><a href="${contextPath }/member/logout">로그아웃</a></li>
						<li><a href="${contextPath }/member/info?id=${loginUser}">마이페이지</a></li>
					</c:if>
				</ul>
			</nav>
		</div>
	</header> --%>
</body>
</html>

