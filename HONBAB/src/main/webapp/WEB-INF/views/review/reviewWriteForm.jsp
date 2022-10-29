<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reviewWirte</title>
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
</head>
<body>

	<c:import url="../main/header.jsp"/>

	<form action="${contextPath}/review/reviewWrite" enctype="multipart/form-data" method="post">
		<!-- input 작성자id(세션), 글쓴이nick(세션), 제목, 게시글내용, 이미지 -->
		<!-- other 조회수(controller), 게시글번호(sql-seq), 작성일자(sql-default), 좋아요(content-button),-->
		<input type="hidden" value="id-session" name="id" >
			<b>글쓴이-session</b><br>
		<input type="text" name="nickname"><br> 
			<b>제 목-not null</b><br>
		<input type="text" name="title"><br><br>
			<b>내 용 -not null[네이버 텍스트에디터]</b><br>
		<textarea cols="20" rows="5" name="content"></textarea><br>
			<b>파일 첨부</b><br>
		<input type="file" name="image_file_name" onchange="readURL(this)">
			<b>이미지 미리보기</b>
			<img src="#" id=preview width="100px" height="100px"> <br><br>
		<input type="submit" value="작성완료">
	</form>	
	<c:import url="../main/footer.jsp"/>
</body>
</html>