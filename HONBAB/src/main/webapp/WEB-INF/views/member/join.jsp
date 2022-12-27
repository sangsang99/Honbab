<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/join.jsp</title>
<!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com"  />
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&family=Nunito+Sans:wght@400;600;700&display=swap"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/css/home.css?ver=4" rel="stylesheet"/> 
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$.getScript( '../resources/js/join.js');





$(document).ready(function(){
	var user = true; 
	if(user = true){
		$(".biz_join_form_wrap").hide(); 
		user = false;
	}
	
	var biz = document.getElementById('btn_join_biz');
	var user = document.getElementById('btn_join');
});
	
function btn_listener(event){
    switch(event.target.id){
        case 'btn_join_biz':
	        	$(".biz_join_form_wrap").show(); 		
	    			$(".join_form_wrap").hide();
           break;
        case 'btn_join':
	        	$(".join_form_wrap").show(); 
	    			$(".biz_join_form_wrap").hide();
           break;
    }
}


user.addEventListener('click', btn_listener);
biz.addEventListener('click', btn_listener);

</script>

<script type="text/javascript">
$(function() {
    
})

</script>

<style type="text/css">
body>.join_form_wrap {
	width: 650px;
	margin: 0 auto;
	margin-top: 50px;
}
footer{
	position : absolute;
	bottom : 0;
	}
li>#gender{
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 100%;
	vertical-align: baseline;
	list-style: none;
}
</style> 
</head>
<body>
	<c:import url="../main/header.jsp"/>
	<div class="join_form_wrap">
		<h1 align="center">회원 가입</h1>
		<form class="join_form" id="join_form" action="${contextPath}/member/join" method="post">
			<ul>
				<li>
					<span class="index">아이디</span>
					<input type="text" id="id" name="id" placeholder="아이디를 입력하세요.">
<!-- 					<button type="button" name="check" onclick="id_check(); return false;">중복확인</button> -->
				</li>
				<li>
					<span class="index">비밀번호</span>
					<input type="password" id="pw" name="pw" placeholder="비밀번호를 입력하세요.">
				</li>
				<li>
					<span class="index">비밀번호 확인</span>
					<input type="password" id="repw" name="repw" placeholder="비밀번호를 다시입력하세요.">
				</li>
				<li>
					<span class="index">이름</span>
					<input type="text" id="name" name="name" placeholder="이름을 입력하세요."> 
				</li>
				<li>
					<span class="index">닉네임</span>
					<input type="text" id="nickName" name="nickName" placeholder="닉네임을 입력하세요."><!-- 
					<button type="button" name="check" onclick="id_check(); return false;">중복확인</button> -->
				</li>
				<li>
					<span class="index">전화번호</span>
					<input type="tel" id="tel" name="tel" placeholder="숫자만 입력하세요.">
				</li>
				<li>
					<span class="index">거주지</span>
					<c:import url="../member/region.jsp"/>
				</li>
				<li>
					<span class="index">성별</span>
					<select id="gender" name="gender" size="1">
						<option value="">-선택하세요-</option>
						<option value="m">남자</option>
						<option value="f">여자</option>
					</select>
				</li>
				<li>
					<span class="index">이메일</span>
					<input type="text" id="email" name="email" placeholder="이메일을 입력하세요.">
				</li>
			</ul>
			<button type="button" name="join" onclick="joinform_check(); return false;"> JOIN</button>
		</form>
		<input type="button" id="btn_join_biz"  class="btn_join" value="사장님이신가요?">
	</div>
	
	
	<!-- 사장님 회원가입 -->
	<div class="biz_join_form_wrap">
	<form action="{contextPath}/member/bizRegister" method="post" name="bizRegister" id="bizRegister">
			<ul class="join_form_wrap">
				<li>
					<span class="index">아이디</span>
					<input type="text" id="id" name="id" placeholder="아이디를 입력하세요.">
				</li>
				<li>
					<span class="index">비밀번호</span>
					<input type="password" id="pw" name="pw" placeholder="비밀번호를 입력하세요.">
				</li>
				<li>
					<span class="index">비밀번호 확인</span>
					<input type="password" id="repw" name="repw" placeholder="비밀번호를 다시입력하세요.">
				</li>
				<li>
					<span class="index">이름</span>
						<input type="text" id="name" name="name" placeholder="이름을 입력하세요."> 
				</li>
				<li>
					<span class="index">닉네임</span>
					<input type="text" id="nickName" name="nickName" placeholder="닉네임을 입력하세요.">
				</li>
				<li>
					<span class="index">전화번호</span>
					<input type="tel" id="tel" name="tel" placeholder="숫자만 입력하세요.">
				</li>
				<li class="callBackDiv">
					<span class="index">식당위치</span>
					<input type="text" id="roadFullText" name="roadFullAddr">
					<input type="button" id="FullAddrBtn" onClick="goPopup();" value="주소검색"/>				
				</li>
				<li>
					<span class="index">이메일</span>
					<input type="text" id="email" name="email" placeholder="이메일을 입력하세요.">
				</li>
			</ul>
			<input type="submit" name="join" value="Register">	
		</form> 
		<input type="button" id="btn_join" class="btn_join" value="일반유저 가입">
	</div>
	
	<footer>
		<c:import url="../main/footer.jsp"/>
	</footer>
</body>

</html>