<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/register.jsp</title>
<!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&family=Nunito+Sans:wght@400;600;700&display=swap"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/css/writeForm.css?ver=4" rel="stylesheet"/> 
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	//아이디 중복체크 팝업창(현재 공백문서)
	function id_check() {
	  //window.open("팝업될 문서 경로", "팝업될 문서 이름", "옵션");
	  window.open("", "", "width=600, height=200, left=200, top=100");
	}
	
	
	function joinform_check() {
		  var id = document.getElementById("id");
		  var pw = document.getElementById("pw");
		  var repw = document.getElementById("repw");
		  var name = document.getElementById("name");
		  var tel = document.getElementById("tel");
		  var email = document.getElementById("email");
		  var region = document.getElementById("region");
		  
		  var uidCheck = ^[a-zA-Z0-9]+$;
		  
		  if (id.value == "") {
		    alert("아이디를 입력하세요.");
		    id.focus();
		    return false;
		  } else if (!uidCheck.test(id.value)) {
		    alert("아이디는 특수문자를 사용할 수 업습니다.");
		    id.focus();
		    return false;
		  } else if (pw.value == "") {
		    alert("비밀번호를 입력하세요.");
		    pw.focus();
		    return false;
		  } else if (repw.value !== pw.value) {
		    alert("비밀번호가 일치하지 않습니다..");
		    repw.focus();
		    return false;
		  } else if (name.value == "") {
		    alert("이름을 입력하세요.");
		    name.focus();
		    return false;
		  } else  if (tel.value == "") {
		    alert("전화번호를 입력하세요.");
		    tel.focus();
		    return false;
		  } else if (!reg.test(tel.value)) {
		    alert("전화번호는 숫자만 입력할 수 있습니다.");
		    tel.focus();
		    return false;
		  } else if (email.value == "") {
		    alert("이메일 주소를 입력하세요.");
		    email.focus();
		    return false;
		  } else if (!region.checked) { //체크박스 미체크시
		    alert("지역을 선택하세요.");
		    region.focus();
		    return false;
		  };

		  //입력 값 전송
		  document.register_form.submit(); //유효성 검사의 포인트   
		}
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
body>.honbab {
	width: 350px;
	padding-left: 75px;
	font-size: 45px;
	font-weight: 800;
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
	<h1 class="honbab">회원 가입</h1>
	<div class="join_form_wrap">
		<form class="join_form" id="register_form" action="register" method="post">
			<ul>
				<li>
					<span class="index">아이디</span>
					<input type="text" id="id" name="id" placeholder="아이디를 입력하세요.">
					<button type="button" name="check" onclick="id_check(); return false;">중복확인</button>
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
					<input type="tel" id="tel1" name="tel" placeholder="숫자만 입력하세요.">
				</li>
				<li>
					<span class="index">거주지</span>
					<c:import url="../member/region.jsp"/>
				</li>
				<li>
					<span class="index">성별</span>
					</li>
					<li>
					<span class="index">남 </span>
					<input type="radio" id="gender" name="gender" value="m" checked="checked">
					</li>
					<li>
					<span class="index">여</span>
					<input type="radio" id="gender" name="gender" value="f">
					</li>
				<li>
					<span class="index">이메일</span>
					<input type="text" id="email" name="email" placeholder="이메일을 입력하세요.">
				</li>
			</ul>
			<!-- <input type="submit" value="회원가입"> -->
			<button type="button" name="join" onclick="joinform_check(); return false;"> JOIN</button>
		</form>
	</div>
	<footer>
		<c:import url="../main/footer.jsp"/>
	</footer>
</body>
</html>