<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>promotion/contentView.jsp</title>

<link
	href="${pageContext.request.contextPath}/resources/css/promo/view.css?ver=4"
	rel="stylesheet" />

<!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&family=Nunito+Sans:wght@400;600;700&display=swap"
	rel="stylesheet" />
<script type="text/javascript">
 	
 	/* function slide_click() {
		$("#first").slideDown("slow");
		$("#modal_wrap").show();
	}

 	function slide_hide() {
		$("#first").slideUp("fast");
		$("#modal_wrap").hide();
	} */
 	
 	//Ajax??
 	/* function rep() {
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
				/* slide_hide(); */
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
		
		} */
</script>

</head>
<body onload="reply_data()">

<!-- header -->
	<c:import url="../main/header.jsp" />


	<main>
		<div class="title_wrap">
			<div class="level">
				<span>${data.writeNo }.</span>
			</div>
			<div class="title">
				<div id="t">${data.title}</div>
			</div>
		</div>

		<div class="line"></div>

		<div class="writer_wrap">
			<span class="writer">by. ${data.id }</span> 
			<%-- <span class="date">${data.saveDate }</span>  --%>

		<%-- 	<div class="like">
				<a href="#" onclick="isLogin(${reviewContent.writeNo})"> <img
					id="heart" src="${contextPath}/resources/img/heart.svg"></a> <span
					class="age">${reviewContent.likes}</span>
			</div> --%>

			<c:if test="${data.imageFileName == 'Nan'}">
				<div id="imgx">
					<span>Θ</span>
				</div>
			</c:if>

			<c:if test="${data.imageFileName != 'Nan'}">
				<img
					src="${contextPath }/promotion/download?imageFileName=${data.imageFileName}"
					width="400px" style="float: right" />
			</c:if>
		</div>

		<div class="empty"></div>

		<div class="content_wrap">
			<div class="text">${data.content }</div>
		</div>

		<!-- buttons -->
		<input type="button" value="글목록"
			onclick="location.href='${contextPath}/promotion/promoAllList'">
		<c:if test="${data.id == loginUser || loginUser == 'admin'}">
			<!-- 로그인되어있고 , reviewContent.uNickname 과 일치하면 노출-->
			<input type="button" value="글수정" id="modify_btn"
				onclick="location.href='${contextPath}/promotion/promoModifyForm?writeNo=${data.writeNo }'">
			<input type="button" value="글삭제" id="delete_btn"
				onclick="location.href='${contextPath}/promotion/delete?writeNo=${data.writeNo }&imageFileName=${data.imageFileName }'">
		</c:if>
	</main>


 	<!-- <form class="rating" name="star" id="star" method="post">
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
</form>	 -->
<%-- 
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
					<b>평점</b> <input type="number" id="star" name="star" value="${data.star }" >
					<hr>  						
					<button type="button" onclick="rep()">답글</button>
					&nbsp;
					<button type="button" onclick="slide_hide()">취소</button>
					&nbsp;
				</form>
			</div>
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<h1 class="view_title" align="center">파트너 홍보</h1>
	<div class="content_view" align="center">
	 --%>
	
	
		<!-- <table border="1"> -->
<%-- 			<tr>
				<th width="200px">글번호</th>
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
	</div> --%>

	<%-- <section>
		<div class="plus">
			<a>+ 댓글</a>
		</div>
		<c:if test="${loginUser != null}">
			<div class="panel">
				<form id="frm" name="frm">
					<input type="hidden" name="writeNo"	value="${data.writeNo}">
					<div class="rep">
						<span>by. ${data.id }</span> <span>savedate</span><br>
						<input type="text" id="coment" name="coment"placeholder="10글자 이상 작성" />
						<button type="button" onclick="rep()">
							<img id="enter"
								src="${contextPath}/resources/img/arrow-return-left.svg">
						</button>
					</div>
					<div class="rep">
						<div id="reply">
							<!-- 해당글에 답변이 있으면 노출 -->
						</div>
					</div>
				</form>
			</div>
		</c:if>
	</section> --%>



<!-- footer -->
	<c:import url="../main/footer.jsp" />
	
	<script>
      var plus = document.getElementsByClassName("plus");
      var i;

      for (i = 0; i < plus.length; i++) {
        plus[i].addEventListener("click", function () {
          this.classList.toggle("active");
          var panel = this.nextElementSibling;
          if (panel.style.maxHeight) {
            panel.style.maxHeight = null;
          } else {
            panel.style.maxHeight = panel.scrollHeight + "px";
          }
        });
      }
    </script>


</body>
</html>