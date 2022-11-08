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
<link href="${pageContext.request.contextPath}/resources/css/home.css?ver=4" rel="stylesheet"/> 
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
function modify(){
	tel1 = $("#tel1").val()
	tel2 = $("#tel2").val()
	tel3 = $("#tel3").val()
	tel1 = tel1 + "-" + tel2 + "-" + tel3
	$("#tel1").val(tel1)
	modify_form.submit()
}
//	const str = "010-1234-5678";
//	let words = str.split('-');
//	words[0];
//	words[1];
//	words[2];

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
		<<h1 align="center">회원정보 수정</h1>
		<form class="join_form" id="modify" action="modifySave" enctype="multipart/form-data" method="post">
			<ul>
				<li>
					<span class="index">아이디</span>
					<input type="text" id="id" name="id" value="${info.id}" readonly>
				</li>
				<li>
					<span class="index">비밀번호</span>
					<input type="password" id="pw" name="pw" placeholder="비밀번호를 입력하세요.">
				</li>
				<li>
					<span class="index">이름</span>
						<input type="text" id="name" name="name" value="${info.name}"> 
				</li>
				<li>
					<span class="index">닉네임</span>
					<input type="text" id="nickName" name="nickName" value="${info.nickName}">
				</li>
				<li>
					<span class="index">전화번호</span>
					<input type="tel" id="tel1" name="tel" value="${info.tel}">
				</li>
				<li>
					<span class="index">거주지</span>
					<c:import url="../member/region.jsp"/>
				</li>
				<li>
					<span class="index">성별</span>
					<select id="gender" name="gender" size="1">
						<option value="m">남자</option>
						<option value="f">여자</option>
					</select>
				</li>
				<li>
					<span class="index">이메일</span>
					<input type="text" id="email" name="email" value="${info.email}">
				</li>
			</ul>
			<input type="submit" value="Edit" >
		</form>
	</div>
	
	<c:import url="../main/footer.jsp"/>
</body>
</html>