<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
			url: "replyData/"+${findContent.writeNo},
			type: "GET",
			dataType: "json",
			success: function(rep) {	
				let html = ""
				rep.forEach(function(redata) {
					let date = new Date(redata.reDate)
					let writeDate = date.getFullYear()+"년" +
									(date.getMonth()+1)+"월" +
									date.getDate()+"일"
					html += "<hr><div align='left'><b>아이디 : </b>" + redata.reNick + "님/";
					html += "<b>작성일</b> : " + writeDate + "<br>" 
					html += "<b>내용</b> : " + redata.reComent + "</div>" 
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
	<table border="1">
		<tr>
			<th>글번호</th><td>${reviewContent.writeNo}</td>
		</tr>
		<tr>
			<th>글쓴이</th><td>${reviewContent.nickname}</td>
		</tr>
		<tr>
			<th>제목</th><td>${reviewContent.title}</td>
		</tr>
		<tr>
			<th>내용</th><td>${reviewContent.content}</td>
		</tr>
		<tr>
			<th>이미지</th>
			<td>
			<c:if test="${reviewContent.imgName == 'None'}">
				<b>이미지가 없습니다..</b>
			</c:if>
			<c:if test="${reviewContent.imgName != 'None'}">
				<img src="${contextPath }/review/download?imageFileName=${reviewContent.imgName}" width="200px" height="200px">		
			</c:if>
			</td>
		</tr>
		<tr>
			<th>작성일</th><td>${reviewContent.writeDate}</td>
		</tr>
		<tr>
			<th>조회수</th><td>${reviewContent.views}</td>
		</tr>
		<tr>
			<th>추천수</th><td>${reviewContent.likes}</td>
		</tr>
	</table>
	
	<input type="button" value="목록 돌아가기" onclick="location.href='${contextPath}/admin/honbabBoard'"> &nbsp;
	<input type="button" value="삭제하기" onclick="location.href='${contextPath}/admin/review_delete?writeNo=${reviewContent.writeNo}&imageFileName=${reviewContent.imgName}'">
	
	<hr>
	<c:if test="${true}">  <!-- 로그인되어있으면 노출 -->
	<form id="form">
		<input type="hidden" name="writeNo" value="${reviewContent.writeNo}">	
		<input type="hidden" name="id" value="${reviewContent.id}">	
		<b>작성자 : ${reviewContent.nickname}</b><br>
		<b>내용</b>
		<textarea id="coment" name="coment" rows="5" cols="30"></textarea><br>
		<button type="button" onclick="rep()" > 답글 달기 </button>&nbsp;
	</form>	
	</c:if>
	<c:import url="../main/footer.jsp"/>
</body>
</html>