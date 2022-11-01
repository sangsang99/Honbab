<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>write form</title>
	<script src="${pageContext.request.contextPath}/resources/js/writeForm.js"></script>
	<link href="${pageContext.request.contextPath}/resources/css/writeForm.css" rel="stylesheet"/> 
  </head>
  <body>
  
    <!-- 처음 나오는 페이지 -->
    <div class="first_view">
      <div class="onloaded">
        <a style="cursor: pointer" class="scoll-down1">
          <img src="${pageContext.request.contextPath}/resources/img/untitled.92.png"/>
        </a>
      </div>
    </div>

    <!-- 로그인 / 회원가입 묻는 창 -->

    <div class="login_join_view">
      <header>&nbsp;</header>
      <div class="login_join">
        <a id="login">LOGIN</a>
        <a id="join" style="cursor: pointer" class="scoll-down2">JOIN</a>
      </div>
      <!-- <div class="down_img">
        <a style="cursor: pointer" class="btn scoll-down">JOIN</a>
        <img src="./img/자산 2xxxhdpi.svg" />
      </div> -->
    </div>

    <!-- 회원가입 페이지 -->
    <div class="join_view">
      <aside>
        <div class="aside_wrap">
          <div class="text">
            <span>혼자서도 잘 먹어요</span>
            <div>혼자서도 잘 먹고 잘 사는 나만을 위한 행복을 찾는</div>
            <div>
              Lorem, ipsum dolor sit amet consectetur adipisicing elit. <br />
              Voluptatum, maiores deleniti reiciendis, <br />
              at suscipit dolorum, adipisci nam mollitia totam impedit maxime. <br />
              Dolorum quaerat nobis doloribus perferendis nisi, ipsum aut ducimus?
            </div>
          </div>
        </div>
        <div class="honbab">
          <span>HONBAB</span>
        </div>
      </aside>

      <main>
        <div class="join_form_wrap">
          <form class="join_form">
            <ul>
              <li>
                <span>Id*</span>
                <input type="text" placeholder="아이디를 입력하세요." />
              </li>
              <hr />
              <div class="line"></div>
              <li>
                <span>Password*</span>
                <input type="password" placeholder="비밀번호를 입력하세요." />
              </li>
              <hr />
              <div class="line"></div>
              <li>
                <span>Password*</span>
                <input type="password" placeholder="비밀번호를 재입력하세요." />
              </li>
              <hr />
              <div class="line"></div>
              <li>
                <span>Name*</span>
                <input type="text" placeholder="이름을 입력하세요." />
              </li>
              <hr />
              <div class="line"></div>
              <li>
                <span>NickName*</span>
                <input type="text" placeholder="별칭? 별명? 뭐든 입력하세요." />
              </li>
              <hr />
              <div class="line"></div>
              <li>
                <span>Tel*</span>
                <input type="tel" placeholder="전화번호를 입력하세요." />
              </li>
              <hr />
              <div class="line"></div>
              <li>
                <span>Region*</span>
                <input type="text" placeholder="거주 지역을 선택해주세요." />
              </li>
              <hr />
              <div class="line"></div>
              <li>
                <span>Gender*</span>
                <input type="text" placeholder="성별을 선택해주세요." />
              </li>
              <hr />
              <div class="line"></div>
              <li>
                <span>Email*</span>
                <input type="email" placeholder="이메일 주소를 입력해주세요." />
              </li>
              <hr />
              <div class="line"></div>
            </ul>
            <input type="submit" value="Join" />
          </form>
        </div>
      </main>
    </div>

    <!-- 사장님 회원가입 이메일 제출 -->
    <div class="biz_join_view">
      <div class="biz_join_form">
        <ul>
          <li>
            <span>사장님이신가요?</span>
          </li>
          <li>
            <input type="text" placeholder="회원가입문의 이메일 제출" />
          </li>
          <li>
            <input type="text" value="제출" />
          </li>
        </ul>
      </div>
    </div>

    <footer>footer 임</footer>
    <script src="./js/writeForm.js"></script>
  </body>
</html>