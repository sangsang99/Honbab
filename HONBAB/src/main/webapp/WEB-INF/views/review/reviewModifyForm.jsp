<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reviewModify</title>
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
	<form action="${contextPath}/review/review_modify" enctype="multipart/form-data" method="post">
		<input type="hidden" name="uSeq" value="${reviewContent.uSeq }">
		<input type="hidden" name="originFileName" value="${reviewContent.uImageName }"> <!-- 이미지 변경시 해당 파일 삭제 -->
		
		<b>작성자</b><br>
		<input type="text" name="nickName" value="${reviewContent.uNickName}" readonly><br> 
		<b>제 목</b><br>
		<input type="text" name="title" value="${reviewContent.uTitle}"><br><br>
		<b>내 용</b><br>
		<textarea cols="20" rows="5" name="content">${reviewContent.uContent}</textarea><br>
		<b>파일 첨부</b><br>
		<input type="file" name="image_file_name" onchange="readURL(this)">
		<b>이미지 미리보기</b>
		<img src="${contextPath }/download?imageFileName=${reviewContent.uImageName}" id=preview width="100px" height="100px"> <br><br>
		<input type="submit" value="수정완료">
		<input type="button" value="글목록" onclick="location.href='${contextPath }/boardAllList'">
	</form>	
	<c:import url="../main/footer.jsp"/>
	
</body>
</html>