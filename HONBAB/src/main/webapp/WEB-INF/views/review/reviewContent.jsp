<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reviewContent</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
 	//Ajax??
 	function rep() {
		let form = {};
		let arr = $("#form").serializeArray(); //해당데이터 직렬화 처리 //[{name: "", value:""}, {name: "", value:""}]
		for(i=0; i<arr.length; i++){
			form[arr[i].name] = arr[i].value;
		}
		$.ajax({
			url: "addReply",
			type: "POST",
			data: JSON.stringify(form), 	//Ajax 사용하려면 의존성 추가
											<!-- JSON.stringify(문자열 json타입 변경)  -->
			contentType: "application/json; charset=utf-8",
			success: function(){
				alert("답글이 추가되었습니다..");
				reply_data();
			}, error:function(){
				alert("문제 발생");
			}
		})		
 	}
 	
 	function reply_data() {
		$.ajax({
			url: "replyData/"+${reviewContent.uSeq},
			type: "GET",
			dataType: "json",
			success: function(rep) {	
				let html = ""
				rep.forEach(function(redata) {
					let date = new Date(redata.uReDate)
					let writeDate = date.getFullYear()+"년" +
									(date.getMonth()+1)+"월" +
									date.getDate()+"일"
					html += "<hr><div align='left'><b>아이디 : </b>" + redata.uReNick + "님/";
					html += "<b>작성일</b> : " + writeDate + "<br>" 
					html += "<b>내용</b> : " + redata.uReComent + "</div>" 
				})
				$("#reply").html(html)
			}, error:function(){
				alert("데이터를 가져올 수 없습니다.");
			}
		})
	} 
</script>
</head>
<body onload="reply_data()">

	<c:import url="../main/header.jsp"/>
	<!-- write -->
	<table border="1">
		<tr>
			<th>글번호</th><td>${reviewContent.uSeq}</td>
		</tr>
		<tr>
			<th>글쓴이</th><td>${reviewContent.uNickName}</td>
		</tr>
		<tr>
			<th>제목</th><td>${reviewContent.uTitle}</td>
		</tr>
		<tr>
			<th>내용</th><td>${reviewContent.uContent}</td>
		</tr>
		<tr>
			<th>이미지</th>
			<td>
			<c:if test="${reviewContent.uImageName == 'None'}">
				<b>이미지가 없습니다..</b>
			</c:if>
			<c:if test="${reviewContent.uImageName != 'None'}">
				<img src="${contextPath }/review/download?imageFileName=${reviewContent.uImageName}" width="200px" height="200px">		
			</c:if>
			</td>
		</tr>
		<tr>
			<th>작성일</th><td>${reviewContent.uDate}</td>
		</tr>
		<tr>
			<th>조회수</th><td>${reviewContent.uViews}</td>
		</tr>
		<tr>
			<th>추천수</th><td>${reviewContent.uLike}</td>
		</tr>
	</table>
	
	<!-- buttons -->
	<input type="button" value="목록 돌아가기" onclick="location.href='${contextPath}/review/reviewAllList'"> &nbsp;
	<c:if test="${true == true}"> <!-- 로그인되어있고 , reviewContent.uNickName 과 일치하면 노출-->
	<input type="button" value="수정하기" onclick="location.href='${contextPath}/review/review_modify_form?uSeq=${reviewContent.uSeq}'"> &nbsp;
	<input type="button" value="삭제하기" onclick="location.href='${contextPath}/review/review_delete?uSeq=${reviewContent.uSeq}&imageFileName=${reviewContent.uImageName}'">
	</c:if>
	<a href="${contextPath}/review/reviewLike?uSeq=${reviewContent.uSeq}">좋아요♥</a>
	
	<!-- reply -->
	<h2>답글페이지</h2>
	
	<div id="reply">
	<!-- 해당글에 답변이 있으면 노출 -->
	</div>
	<hr>
	<c:if test="${true}">  <!-- 로그인되어있으면 노출 -->
	<form id="form">
		<input type="hidden" name="uSeq" value="${reviewContent.uSeq}">	
		<b>작성자 : ${reviewContent.uNickName}</b><br>
		<b>내용</b>
		<textarea id="content" name="content" rows="5" cols="30"></textarea><br>
		<button type="button" onclick="rep()" > 답글 달기 </button>&nbsp;
	</form>	
	</c:if>
	<c:import url="../main/footer.jsp"/>

</body>
</html>