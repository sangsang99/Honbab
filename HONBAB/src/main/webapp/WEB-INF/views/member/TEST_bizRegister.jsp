<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>buisness Join</title>
<!-- FONT START-->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com"  />
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&family=Nunito+Sans:wght@400;600;700&display=swap"
	rel="stylesheet" />
<!-- FONT END-->

<!-- 주소 API START-->
<script type="text/javascript"> 
function goPopup(){
	var pop = window.open("../juso/jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 0
}

function jusoCallBack(roadFullAddr, roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
		document.bizRegister.roadFullAddr.value = roadFullAddr;
}
</script>

<link href="${pageContext.request.contextPath}/resources/css/admin/home.css?ver=1" rel="stylesheet"/> 
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- 주소 API END-->
<style type="text/css">
body>.join_form_wrap {
	width: 800px;
	margin: 0 auto;
	padding-top: 50px;
}
footer{
	position : absolute;
	bottom : 0;
	}

</style> 
</head>
<body>
	<div>
		<c:import url="../admin/boardManagement.jsp"></c:import>
	</div>
	<div class="join_form_wrap">
	<form action="${contextPath}/member/bizRegister" method="post" name="bizRegister" id="bizRegister">
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
	</div>
</body>
</html>