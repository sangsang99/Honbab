<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<!-- 수정ㅋㅋㅋ -->
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>Main</title>
	<script src="${pageContext.request.contextPath}/resources/js/writeForm.js"></script>
	<link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet"/> 
	<!-- font -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Kumbh+Sans:wght@300;400;500;600;700&family=Noto+Sans+KR:wght@300;400;500;700&family=Nunito+Sans:wght@400;600;700&family=Ramabhadra&display=swap"
      rel="stylesheet"
    />
  </head>
  <body>
  <!-- header -->
	<c:import url="main/header.jsp"/>
<%--     <header>
      <div class="header_wrap">
        <div class="logo"><span><a href="${contextPath}/index">HONBOB</a></span></div>
        <ul class="nav">
          <li><a id="find" href="${contextPath}/find/findAllList">Find</a></li>
          <li><a href="${contextPath}/challengeAllList">Challenge</a></li>
          <li><a id="review" href="${contextPath}/review/reviewAllList">Review</a></li>
          <li><a id="promotion" href="${contextPath}/promotion/promoList">Notice?</a></li>
          <li id="logout"><a href="${contextPath }/member/logout">logout</a></li>
          <li id="logout"><a href="${contextPath }/member/info?id=${loginUser}">마이페이지</a></li>
          <li><a href="${contextPath }/member/login">로그인(임시)</a></li>
		  <li><a href="${contextPath }/member/register_form">회원가입(임시)</a></li>
        </ul>
      </div>
    </header> --%>

    <main>
      <div class="main_wrap">
        <div id="alone">
          <span><b>*EAT ALONE</b></span>
        </div>
        <img src="${pageContext.request.contextPath}/resources/img/2수정1_Yz2wxmK0Cf3MBZR7lgkfg.jpg" width="1200px" />
      </div>
    </main>

    <article>
    	<!-- find best -->
        <div class="article_wrap">
        	<c:import url="challenge/challengeBest.jsp"/>
        </div>  

        
    	<!-- challenge best -->
        <div class="article_wrap">
					<c:import url="challenge/challengeBest.jsp"/>
        </div>
        
        
    	<!-- review best -->
				<div class="article_wrap">
					<c:import url="challenge/challengeBest.jsp"/>
				</div>
    </article>

		<!-- footer -->
		<%-- <c:import url="main/footer.jsp"/> --%>
  </body>
</html>
