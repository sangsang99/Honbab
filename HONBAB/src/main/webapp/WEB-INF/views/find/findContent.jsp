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
					let date = new Date(redata.uReDate)
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
<body>
<c:import url="../main/header.jsp"/>
	<table border="1">
		<tr>
			<th>글번호</th><td>${findContent.writeNo}</td>
		</tr>
		<tr>
			<th>닉네임</th><td>${findContent.nickName}</td>
		</tr>
		<tr>
			<th>제목</th><td>${findContent.title}</td>
		</tr>
		<tr>
			<th>내용</th><td>${findContent.content}</td>
		</tr>
		<tr>
			<th>나이</th><td>${findContent.age}</td>
		</tr>
		<tr>
			<th>성별</th><td>${findContent.gen}</td>
		</tr>
		<tr>
			<th>지역</th><td>${findContent.region}</td>
		</tr>
		<tr>
			<th>작성일</th><td>${findContent.writeDate}</td>
		</tr>
		<tr>
			<th>조회수</th><td>${findContent.views}</td>
		</tr>
	</table>
	
	
	<input type="button" value="목록 돌아가기" onclick="location.href='${contextPath}/find/findAllList'"> &nbsp;
	<c:if test="${true == true}">
	<input type="button" value="수정하기" onclick="location.href='${contextPath}/find/find_modify_form?writeNo=${findContent.writeNo}'"> &nbsp;
	<input type="button" value="삭제하기" onclick="location.href='${contextPath}/find/find_delete?writeNo=${findContent.writeNo}'">
	</c:if>
	
	<h2>답글페이지</h2>
	
	<div id="reply">
	<!-- 해당글에 답변이 있으면 노출 -->
	</div>
	<hr>
	<c:if test="${true}">  <!-- 로그인되어있으면 노출 -->
	<form id="form">
		<input type="hidden" name="writeNo" value="${findContent.writeNo}">	
		<b>작성자 : ${findContent.nickName}</b><br>
		<b>내용</b>
		<textarea id="coment" name="coment" rows="5" cols="30"></textarea><br>
		<button type="button" onclick="rep()" > 답글 달기 </button>&nbsp;
	</form>	
	</c:if>
	<c:import url="../main/footer.jsp"/>
</body>
</html>