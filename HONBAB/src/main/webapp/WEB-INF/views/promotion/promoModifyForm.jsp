<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/modify_form.jsp</title>
<!-- 수정 11.09 -->
<link
	href="${pageContext.request.contextPath}/resources/css/challenge/writeForm.css?ver=4"
	rel="stylesheet" />
<!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" />
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&family=Nunito+Sans:wght@400;600;700&display=swap"
	rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	function readURL(input) {
		var file = input.files[0]; // 파일 정보
		if(file != ""){
			var reader = new FileReader();
			reader.readAsDataURL(file); // 파일 정보 읽어오기
			reader.onload = function(e){// 읽기에 성공하면 결과 표시
				$("#preview").attr("src", e.target.result)
			}
		}
	}
</script>
<style type="text/css">
.modify_title{
	text-align: center;
}

.modify {
	width: 500px;
	margin : auto;
}
</style>

<style type="text/css">
.write_title {
	text-align: center;
}

.write {
	width: 500px;
	margin: auto;
}
</style>
</head>
<body>
	<c:import url="../main/header.jsp" />
	
	<aside>
		<div class="aside_wrap">
			<div class="honbab">
				<span>PROMOTION</span>
			</div>
			<div class="text">
				<span>홍보</span>
				<div>광고글 수정</div>
				<div></div>
			</div>
		</div>
	</aside>
	
	<h1 class="modify_title"> 글수정</h1>
		<div class="modify" align="center">
		<div></div>
		<form action="${contextPath}/promotion/modify" enctype="multipart/form-data" method="post">
			<input type="hidden" name="writeNo" value="${data.writeNo }">
			<input type="hidden" name="originFileName" value="${data.imageFileName }"> <!-- 이미지 변경시 해당 파일 삭제 -->
			<b>상호명</b><br>
			<input type="text" name="comName"><br>
			<b>제 목</b><br>
			<input type="text" name="title" value="${data.title }" size="50"><br>
			<b>내 용</b><br>
			<textarea rows="10" cols="50" name="content">${data.content }</textarea><br>
			<b>파일 첨부</b><br>
			<img src="${contextPath }/promotion/download?imageFileName=${data.imageFileName}" id="preview" width="100px" height="100px"> <br><br>
			<input type="file" name="image_file_name" onchange="readURL(this)">
			<b>주 소</b><br>
			<input type="text" name="address" size="50"><br><br>
			<input type="submit" value="수정완료"> &nbsp;
			<input type="button" value="글목록" onclick="location.href='${contextPath }/promotion/promoAllList'">
		</form>
		</div>
		
	<c:import url="../main/footer.jsp" />

</body>
</html>