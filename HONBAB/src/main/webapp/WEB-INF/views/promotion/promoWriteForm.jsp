<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/contentView.jsp</title>
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
.write_title{
	text-align: center;
}

.write {
	width: 500px;
	margin : auto;
}
</style>
</head>
<body>
	
	<h1 class="write_title"> 글쓰기</h1>
	<div class="wrap" align="center">
		<form action="${contextPath}/promotion/writeSave" enctype="multipart/form-data" method="post">
			<b>작성자</b><br>
			<input type="text" name="id" value="${loginUser}" readonly><br>
			<b>제 목</b><br>
			<input type="text" name="title" size="50"><br>
			<b>내 용</b><br>
				<textarea rows="10" cols="50" name="content">
식당유형:
			
가게위치:  
			
대표메뉴:
				</textarea><br>
			<b>파일 첨부</b><br>
			<input type="file" name="image_file_name" onchange="readURL(this)">
			<img src="#" id=preview width="100px" height="100px"> <br><br>
			<input type="submit" value="작성완료"> &nbsp;
			<input type="button" value="글목록" onclick="location.href='${contextPath }/promotion/promoAllList'">
		</form>
	</div>
	
</body>
</html>