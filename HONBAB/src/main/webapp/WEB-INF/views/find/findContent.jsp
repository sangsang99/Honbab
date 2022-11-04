<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="${pageContext.request.contextPath}/resources/css/find/view.css?ver=4"
	rel="stylesheet" />
<!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Kumbh+Sans:wght@300;400;500;600;700&family=Noto+Sans+KR:wght@300;400;500;700&family=Nunito+Sans:wght@400;600;700&family=Ramabhadra&display=swap"
	rel="stylesheet" />
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
<body>
	<!-- header -->
	<c:import url="../main/header.jsp" />

	<!-- body -->
	<main>
		<div class="title_wrap">
			<div class="level">
				<span>${findContent.writeNo}.</span>
			</div>
			<div class="title">
				<div id="t">${findContent.title }</div>
			</div>
		</div>
		<div class="line"></div>

	<div class="writer_wrap">
		<span class="writer">by. ${findContent.nickName}</span> 
		<span class="date">${findContent.writeDate}</span>
		<span class="age">${findContent.age}</span>
		<span class="gen">${findContent.gen}</span>
		<span class="reg">${findContent.region}</span>
		<span class="view">${findContent.views}</span>
	</div>
		<div class="empty"></div>

		<div class="content_wrap">
			<div class="text">
				${findContent.content}
			</div>
		</div>

		<input type="button" value="글목록"
			onclick="location.href='${contextPath}/find/findAllList'">
			<c:if test="${true == true}">
			<input type="button" value="글수정" id="modify_btn"
				onclick="location.href='${contextPath}/find/find_modify_form?writeNo=${findContent.writeNo}'">
			<input type="button" value="글삭제" id="delete_btn"
				onclick="location.href='${contextPath}/find/find_delete?writeNo=${findContent.writeNo}'">
		</c:if>

	</main>

	<div id="reply">
		<!-- 해당글에 답변이 있으면 노출 -->
	</div>
	<hr>
	<c:if test="${true}">
		<!-- 로그인되어있으면 노출 -->
		<form id="form">
			<input type="hidden" name="writeNo" value="${findContent.writeNo}">
			<b>작성자 : ${findContent.nickName}</b><br> <b>내용</b>
			<textarea id="coment" name="coment" rows="5" cols="30"></textarea>
			<br>
			<button type="button" onclick="rep()">답글 달기</button>
			&nbsp;
		</form>
	</c:if>

	<!-- footer -->
	<c:import url="../main/footer.jsp" />
</body>
</html>