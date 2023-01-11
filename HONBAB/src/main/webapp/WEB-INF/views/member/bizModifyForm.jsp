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
<link rel="preconnect" href="https://fonts.gstatic.com"  />
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&family=Nunito+Sans:wght@400;600;700&display=swap"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/css/home.css?ver=4" rel="stylesheet"/> 
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$.getScript( '../resources/js/modify.js');
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
		<h1 align="center">회원정보 수정</h1>
		<form class="join_form" id="modify" action="modifySave" enctype="multipart/form-data" method="post">
			<ul>
				<li>
					<span class="index">아이디</span>
					<input type="text" id="biz_id" name="id" value="${info.id }">
				</li>
				<li>
					<span class="index">비밀번호</span>
					<input type="password" id="biz_pw" name="pw" value="${info.pw }">
				</li>
				<li>
					<span class="index">비밀번호 확인</span>
					<input type="password" id="biz_repw" name="repw">
				</li>
				<li>
					<span class="index">상호명</span>
						<input type="text" id="biz_name" name="name" value="${info.name }"> 
				</li>
				<li>
					<span class="index">사업자명</span>
					<input type="text" id="biz_comName" name="comName" value="${info.comName }">
				</li>
				<li>
					<span class="index">연락처(사업자용)</span>
					<input type="tel" id="biz_tel" name="tel" value="${info.tel }">
				</li>
				<li>
					<span class="index">연락처(고객용)</span>
					<input type="tel" id="biz_num" name="biznum" value="${info.biznum }">
				</li>
				<li class="callBackDiv">
					<span class="index">식당위치</span>
					<input type="text" id="roadFullText" name="roadFullAddr" width="400px" value="${info.addr }">
					<input type="button" id="FullAddrBtn" width="100px" onClick="goPopup();" value="주소검색"/>				
				</li>
				<li>
					<span class="index">이메일</span>
					<input type="text" id="biz_email" name="email" placeholder="이메일을 입력하세요." value="${info.email }">
				</li>

			</ul>
			<button type="button" name="join" onclick="joinform_check(); return false;"> EDIT</button>
		</form>
	</div>
	
	<c:import url="../main/footer.jsp"/>
</body>
</html>