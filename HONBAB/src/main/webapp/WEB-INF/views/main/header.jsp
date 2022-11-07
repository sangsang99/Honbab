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
          <li class="board"><a id="find" href="${contextPath}/find/findAllList">Find</a></li>
          <li class="board"><a id="challenge" href="${contextPath}/challengeAllList">Challenge</a></li>
          <li class="board"><a id="review" href="${contextPath}/review/reviewAllList">Review</a></li>
          <li class="board"><a id="promotion" href="${contextPath}/promotion/promoADList">Advertisement</a></li>
          <li class="board"><a id="notice" href="${contextPath}/admin/operNoticeContent">Notice</a></li>

          <li class="board"><img id="dash" src="${contextPath}/resources/img/dash-lg.svg"></li>
          <li class="empty">&nbsp;</li>         

          <c:if test="${loginUser == null}">
		  			<li class="user"><a id="join" href="${contextPath }/member/register_form">Join</a></li>
          	<li class="user"><a id="login" href="${contextPath }/member/login">Login</a></li>
		  		</c:if>
		  		<c:if test="${loginUser != null}">
          	<li class="user"><a id="mypage" href="${contextPath }/member/info?id=${loginUser}">Mypage</a></li>
	        	<li class="user"><a id="logout" href="${contextPath }/member/logout">Logout</a></li>
		 			</c:if>
        </ul>
      </div>
    </header>

</body>
</html>

