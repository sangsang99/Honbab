<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
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
<!--   수정함 -->
    <header>
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
    </header>

    <main>
      <div class="main_wrap">
        <div id="alone">
          <span><b>*EAT ALONE</b></span>
        </div>
        <img src="${pageContext.request.contextPath}/resources/img/2수정1_Yz2wxmK0Cf3MBZR7lgkfg.jpg" width="1200px" />
      </div>
    </main>
    <div class="line"></div>

    <article>
      <div class="article_wrap">
        <div class="find_outline">
          <div class="find_list">
            <a class="menu" href="#">동행 구하기</a>
       		<c:import url="find/bestFind.jsp"/>
          </div>

          <div class="text">
            <p>2인분 이상 주문 앞에 돌아선적이 있다면...</p>
            <p>맛집 웨이팅 적적하지 않게 누군가가 함께 기다려줬으면...</p>
            <button class="morebtn" onclick="location.href='${contextPath}/find/findAllList'">more +</button>
          </div>
        </div>
        <div class="line"></div>
        
        <div class="challenge_outline">
          <a class="menu" href="#">혼밥후기</a>
			<c:import url="review/bestReview.jsp"/>
          <div class="text">
            <p>아무말 아무말..</p>
            <p>대충 포토후기 많이 써달라는 말...</p>
            <button class="morebtn" onclick="location.href='${contextPath}/review/reviewAllList'">more +</button>
          </div>
        </div>
        <div class="line"></div>
        <div class="challenge_outline">
          <a class="menu" href="#">도전하기</a>
	          <ul>
	            <li>title title 1</li>
	            <li>title title 2</li>
	            <li>title title 3</li>
	            <li>title title 4</li>
	          </ul>
          <div class="text">
            <p>도전정신이 강하다?</p>
            <p>흔히 혼밥 레벨이라 알려진 단계들을 깨보시길..</p>
            <button class="morebtn">more +</button>
          </div>
        </div>
      </div>
    </article>
    <div class="empty"></div>
    <div class="last_line"></div>
    <footer>
      <div class="footer_wrap">
        <span>copyright &copy; 2022</span>
      </div>
    </footer>
  </body>
</html>
