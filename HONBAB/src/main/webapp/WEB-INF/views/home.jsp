<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8" />
<title>home</title>
<!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" />
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&family=Nunito+Sans:wght@400;600;700&display=swap"
	rel="stylesheet" />

<!-- css -->
<link
	href="${pageContext.request.contextPath}/resources/css/home.css?ver=4"
	rel="stylesheet" />
	
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>

<body>
	<!-- 출처:https://www.youtube.com/watch?v=b9EEKpj7U6k -->
	<!-- 접시 회전하는 부분 -->
	<section class="sequence">
		<div class="img-sequence"
			data-parallax='{"y":1250,  "from-scroll":0, "distance":1250, "smoothness":0}'>
			<a href="${contextPath}/index">
			<canvas width="1024" height="768" class="screen" id="screen"></canvas></a>
		</div>
	</section>

	<section class="sequence">
		<p class="titlehonbab">HONBAB</p>
	</section>

	<section class="sequence"></section>
	<!-- 여기까지 -->
	
	<!-- LOGIN : 페이지이동 / JOIN : 스크롤이동 -->
	<section class="sequence">
		<div class="login_join_view">
			<header>&nbsp;</header>
			<div class="login_join">
				<a id="login" href="${contextPath}/member/login">LOGIN</a> <a
					id="join" style="cursor: pointer" class="scoll-down2">JOIN</a>
			</div>
		</div>
	</section>
	
	<!-- home의 회원가입 부분 START-->
	<section class="sequence">
		<div class="join_view">
			<aside>
				<div class="honbab">
					<span>HONBAB</span>
				</div>
				<div class="aside_wrap">
					<div class="text">
						<span>혼자서도 잘 먹어요</span>
						<div>혼자서도 잘 먹고 잘 사는 나만을 위한 행복을 찾는</div>
						<div>
							Lorem, ipsum dolor sit amet consectetur adipisicing elit. <br />
							Voluptatum, maiores deleniti reiciendis, <br /> at suscipit
							dolorum, adipisci nam mollitia totam impedit maxime. <br />
							Dolorum quaerat nobis doloribus perferendis nisi, ipsum aut
							ducimus?
						</div>
					</div>
				</div>
			</aside>
			

			<main class="join">
				<div class="join_form_wrap">
					<form class="join_form" action='${contextPath}/member/join'>
						<ul>
							<li><span class="index">Id*</span> <input type="text" id="id" name="id"
								placeholder="아이디를 입력하세요." /></li>
							<li><span class="index">Password*</span> <input id="pw" name="pw"
								type="password" placeholder="비밀번호를 입력하세요." /></li>
							<li><span class="index">Password*</span> <input id="repw" name="repw"
								type="password" placeholder="비밀번호를 재입력하세요." /></li>
							<li><span class="index">Name*</span> <input type="text" id="name" name="name"
								placeholder="이름을 입력하세요." /></li>
							<li><span class="index">NickName*</span> <input type="text" id="nickName" name="nickName"
								placeholder="별칭? 별명? 뭐든 입력하세요." /></li>
							<li><span class="index">Tel*</span> <input type="tel" id="tel" name="tel"
								placeholder="전화번호를 입력하세요." /></li>
							<li><span class="index">Email*</span> <input type="email" id="email" name="email"
								placeholder="이메일 주소를 입력해주세요." /></li>
							<li><span class="index">Region*</span> <c:import
									url="./member/region.jsp" /></li>
							<li><span class="index">Gender*</span> <select id="gender"
								name="gender" size="1">
									<option value="">-선택하세요-</option>
									<option value="m">남자</option>
									<option value="f">여자</option>
							</select></li>
						</ul>
						<input type="submit" value="Join"/>
					</form>
				</div>
			</main>
		</div>
	</section>
	<!-- 회원가입 부분 END -->

	<!-- 사장님 회원가입 이메일 제출 -->
	<div class="biz_join_view">
		<div class="biz_join_form">
			<ul>
				<li><span id="biz">사장님이신가요?</span></li>
				<li><input type="text" id="biz_email"
					placeholder="회원가입문의 이메일 제출" /></li>
				<li><input type="submit" id="biz_submit" value="제출" /></li>	
			</ul>
			<a><img id="up"
			src="${contextPath}/resources/img/icon/arrow-up.svg"></a>
		</div>
		
	</div>


	<c:import url="main/footer.jsp"></c:import>
	<!-- 접시, 페이지 이동 javascript -->
	<script src="${pageContext.request.contextPath}/resources/js/jquery-2.1.3.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.easing.1.3.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.parallax-scroll.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/p5.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/imgSequence.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/writeForm.js"></script>
	
	<!-- footer -->	
	<style>.footer{position:static;}</style>

		
	
</body>
</html>