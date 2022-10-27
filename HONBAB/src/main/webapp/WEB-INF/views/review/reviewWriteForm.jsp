<%@ page language="java" contentType="text/html; charset=EUC-KR"
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
		<!-- 후기에는 ... 글번호(db에서 SEQ처리), 글쓴이(input-form-session), 제목(input-form), 등록일(db에서 default로 추가), 추천(댓글에서 추가), 조회수(contentView에서 추가) -->
		<b>작성자</b><br>
		<input type="text" name="nickName"><br> 
		<b>제 목</b><br>
		<input type="text" name="title"><br><br>
		<b>내 용 [네이버 텍스트에디터]</b><br>
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