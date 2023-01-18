<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/info.jsp</title>
<!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com"  />
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&family=Nunito+Sans:wght@400;600;700&display=swap"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/css/home.css?ver=4" rel="stylesheet"/> 
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
function test() {
    if (!confirm("정말 탈퇴하시겠습니까?")) {
        alert("취소되었습니다.");
    } else {
    	window.location.href ='${contextPath}/member/bizDelete?id=${info.id }';
    }
}

function goModify() {
	window.location.href ='${contextPath}/member/bizModifyForm?id=${loginUser}';
}

function readURL(input) {
	var file = input.files[0]; // 파일 정보
	if (file != "") {
		var reader = new FileReader();
		reader.readAsDataURL(file); // 파일 정보 읽어오기
		reader.onload = function(e) {// 읽기에 성공하면 결과 표시
			$("#preview").attr("src", e.target.result)
		}
	}
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
	<h1 align="center">회원 정보</h1>
		<form class="join_form">
			<ul>
				<li>
					<span class="index">아이디</span>
					<input type="text" value="${info.id }" readonly>
				</li>
				<li>
					<span class="index">비밀번호</span>
					<input type="text" value="${info.pw }" disabled>
				</li>
				<li>
					<span class="index">상호명</span>
					<input type="text" value="${info.name }" disabled>
				</li>
				<li>
					<span class="index">사업자명</span>
					<input type="text" value="${info.comName }" disabled>
				</li>
				<li>
					<span class="index">전화번호(사업자)</span>
					<input type="text" value="${info.tel }" disabled>
				</li>
				<li>
					<span class="index">전화번호(고객노출)</span>
					<input type="text" value="${info.biznum }" disabled>
				</li>
				<li>
					<span class="index">주소</span>
					<input type="text" value="${info.addr }" disabled>
				</li>
				<li>
					<span class="index">이메일</span>
					<input type="text" value="${info.email }" disabled>
				</li>
				<li class="upload_file"><!-- 사업자등록증 -->
					<span class="index_kr">사업자등록증</span> 
					<input type="file" name="image_file_name" onchange="readURL(this)">
					<img src="${contextPath }/member/download?imageFileName=${info.bizFile}"
					 id="preview" width="100px" height="50px">
				</li>
				<button type="button" onclick="goModify();">수정</button>				
				<button type="button" onclick="test();">삭제</button>
			</ul>
		</form>
	</div>

	<c:import url="../main/footer.jsp"/>

</body>
</html>