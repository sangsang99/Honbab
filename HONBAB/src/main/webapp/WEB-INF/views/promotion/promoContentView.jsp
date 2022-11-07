<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>promotion/contentView.jsp</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
 	
 	function slide_click() {
		$("#first").slideDown("slow");
		$("#modal_wrap").show();
	}

 	function slide_hide() {
		$("#first").slideUp("fast");
		$("#modal_wrap").hide();
	}
 	
 	//Ajax??
 	function rep() {
		let form = {};
		let arr = $("#frm").serializeArray(); //해당데이터 직렬화 처리 //[{name: "", value:""}, {name: "", value:""}]
		for(i=0; i<arr.length; i++){
			form[arr[i].name] = arr[i].value;
		}
		$.ajax({
			url: "addReply",
			type: "POST",
			data: JSON.stringify(form), 	//Ajax 사용하려면 의존성 추가
											<!-- JSON.stringify(문자열 json타입 변경)-->
			contentType: "application/json; charset=utf-8",
			success: function(){
				alert("답글이 추가되었습니다..");
				slide_hide();
				reply_data();
			}, error:function(){
				alert("문제 발생");
			}
		})		
 	}
 	
 	
 	function reply_data() {
		$.ajax({
			url: "replyData/"+${data.writeNo},
			type: "GET",
			dataType: "json",
			success: function(rep) {				
				let html = ""
				rep.forEach(function(redata) {
					let date = new Date(redata.write_date)
					let writeDate = date.getFullYear()+"년" +
									(date.getMonth()+1)+"월" +
									date.getDate()+"일" + 
									date.getHours()+"시"	
					// let star = new Star(redata.star)  
									/* date.getMinutes()+"분"
									date.getSeconds()+"초"; */
							
					html += "<div align='left'><b>아이디 : </b>" + redata.id + "님/";
					html += "<b>작성일</b> : " + writeDate + "<br>" 
					html += "<b>제목</b> : " + redata.title + "<br>" 
					html += "<b>내용</b> : " + redata.content + "<br>"
					html += "<b>평점</b> : " + redata.star + "<hr>" 				
				})
				$("#reply").html(html)
			}, error:function(){
				alert("데이터를 가져올 수 없습니다.");
			}
		})
		
		}
</script>
<style type="text/css">
.login {
	text-align: center;
	height: 300px;
}

#modal_wrap {
	display: none;
	position: fixed;
	z-index: 9;
	margin: 0 auto;
	top: 0;
	left: 0;
	right: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.4);
}

#first {
	display: none;
	position: fixed;
	z-index: 10;
	margin: 0 auto;
	top: 30px;
	left: 0;
	right: 0;
	width: 300px;
	height: 350px;
	background-color: rgba(212, 244, 250, 0.9);
}

.view_title {
	text_align: center;
}

#star fieldset{
    display: inline-block;
    direction: rtl;
    border:0;
}
#star fieldset legend{
    text-align: right;
}
#star input[type=radio]{
    display: none;
}
#star label{
    font-size: 3em;
    color: transparent;
    text-shadow: 0 0 0 #f0f0f0;
}
#star label:hover{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#star label:hover ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#star input[type=radio]:checked ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#reviewContents {
    width: 100%;
    height: 150px;
    padding: 10px;
    box-sizing: border-box;
    border: solid 1.5px #D3D3D3;
    border-radius: 5px;
    font-size: 16px;
    resize: none;
}
</style>
</head>
<body onload="reply_data()">

 	<form class="rating" name="star" id="star" method="post">
	<fieldset>
		<span class="text-bold">평균 평점</span>
		<input type="radio" name="reviewStar" value="5" id="rate1"><label
			for="rate1">★</label>
		<input type="radio" name="reviewStar" value="4" id="rate2"><label
			for="rate2">★</label>
		<input type="radio" name="reviewStar" value="3" id="rate3"><label
			for="rate3">★</label>
		<input type="radio" name="reviewStar" value="2" id="rate4"><label
			for="rate4">★</label>
		<input type="radio" name="reviewStar" value="1" id="rate5"><label
			for="rate5">★</label>
	</fieldset>
	<div>
		<textarea class="col-auto form-control" type="text" id="reviewContents"
				  placeholder="당사 파트너 업체들에 대한 여러분의 소중한 평가는 저희 서비스 향상에 큰 도움이 됩니다"></textarea>
	</div>
</form>	

	<div id="modal_wrap">
		<div id="first">
			<div style="width: auto; margin: 0 auto; padding-top: 20px;">
				<form id="frm">
					<input type="hidden" name="write_no" value="${data.writeNo }">

					<b>답글페이지</b>
					<hr>
					<b>작성자 : ${loginUser }</b>
					<hr>
					<b>제목 </b> <input type="text" id="title" name="title" size="30">
					<hr>															
					<b>내용</b>					
					<textarea id="content" name="content" rows="5" cols="30"></textarea>
					<hr>
					<b>평점</b> <input type="number" id="star" name="star" value="${data.star }" --%>>
					<hr>  						
					<button type="button" onclick="rep()">답글</button>
					&nbsp;
					<button type="button" onclick="slide_hide()">취소</button>
					&nbsp;
				</form>
			</div>
		</div>
	</div>


	<h1 class="view_title" align="center">파트너 홍보</h1>
	<div class="content_view" align="center">
		<table border="1">
			<tr>
				<th width="100px">글번호</th>
				<td width="200px">${data.writeNo }</td>
				<th width="100px">작성자</th>
				<td width="200px">${data.id }</td>
			</tr>
			<tr>
				<th width="100px">제목</th>
				<td width="200px">${data.title }</td>
				<th width="100px">작성일</th>
				<td width="200px">${data.saveDate }</td>
			</tr>
			<tr>
				<th>내용</th>				
				<td>${data.content }</td>
				<td colspan="2"><c:if test="${data.imageFileName == 'nan'}">
						<b>이미지가 없습니다..</b>
					</c:if> <c:if test="${data.imageFileName != 'nan'}">
						<img
							src="${contextPath }/promotion/download?imageFileName=${data.imageFileName}"
							width="90%" height="90%">

					</c:if></td>
			</tr>
			<tr>
				<td colspan="4" align="center">
					<div id="reply"></div> <c:if test="${data.id == loginUser}">
						<input type="button" value="수정하기"
							onclick="location.href='${contextPath}/promotion/promoModifyForm?writeNo=${data.writeNo }'"> &nbsp;
					<input type="button" value="삭제하기"
							onclick="location.href='${contextPath}/promotion/delete?writeNo=${data.writeNo }&imageFileName=${data.imageFileName }'">
					</c:if> <input type="button" value="평점/답글달기" onclick="slide_click()">
					&nbsp; <input type="button" value="글목록"
					onclick="location.href='${contextPath}/promotion/promoAllList'">
				</td>
			</tr>
		</table>
	</div>



</body>
</html>