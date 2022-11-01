<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeContent(우상)</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
//Ajax??
	function rep() {
		
		var repTest = /^[\w\Wㄱ-ㅎㅏ-ㅣ가-힣]{10,300}$/;
	
		//유효성 검사
		if(!repTest.test(document.form.coment.value)){
			alert("댓글내용을 10자이상 작성해주세요");
			document.form.coment.focus();
		}
		else{
			let form = {};
			let arr = $("#form").serializeArray();
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
	}
	
	function reply_data() {
	$.ajax({
		url: "replyData/"+${noticeContent.writeNo},
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
<body>
	<b>제  목</b>${noticeContent.title } <br>
	<b>내  용</b>${noticeContent.content } <br>
	<b>글번호</b>${noticeContent.writeNo } <br>
	<b>작성일</b>${noticeContent.writeDate } <br>
	<b>조회수</b>${noticeContent.views } <br>

	<a href="${contextPath }/oper/deleteNoticeContent?writeNo=${noticeContent.writeNo }">글삭제 버튼</a>
	<a href="${contextPath }/oper/modifyNoticeContent?writeNo=${noticeContent.writeNo }">글수정 버튼</a>
	
	<!-- reply -->
	<h2>답글페이지</h2>
	
	<div id="reply">
	<!-- 해당글에 답변이 있으면 노출 -->
	</div>
	<hr>
	<form id="form" name="form">
		<input type="hidden" name="writeNo" value="${noticeContent.writeNo}">	
		<input type="text" name="id" value="Honbab관리자">	
		<b>내용</b> <b id="notice">10글자 이상 작성해야합니다.</b>
		<textarea id="coment" name="coment" rows="5" cols="30"></textarea><br>
		<button type="button" onclick="rep()" > 답글 달기 </button>&nbsp;
	</form>	
</body>
</html>