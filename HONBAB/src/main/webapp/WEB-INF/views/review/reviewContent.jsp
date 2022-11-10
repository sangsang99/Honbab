<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reviewContent</title>
<link
	href="${pageContext.request.contextPath}/resources/css/review/view.css?ver=4"
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
 		
 		var repTest = /^[\w\Wㄱ-ㅎㅏ-ㅣ가-힣]{10,300}$/;
		
 		//유효성 검사
 		if(!repTest.test(document.form.coment.value)){
 			alert("댓글내용을 10자이상 작성해주세요");
 			document.form.coment.focus();
 		}
 		else{
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
 	}
 	
 	function reply_data() {
		$.ajax({
			url: "replyData/"+${reviewContent.writeNo},
			type: "GET",
			dataType: "json",
			success: function(rep) {	
				let html = ""
				rep.forEach(function(redata) {
					let date = new Date(redata.reDate)
					let writeDate = date.getFullYear()+"년" +
									(date.getMonth()+1)+"월" +
									date.getDate()+"일"
					html += "<div class='re_wrap'><div id='re' align='left'><b>by. </b>" + redata.reNick + "님 / ";
					html += writeDate + "<br>" 
					html += redata.reComent + "</div>"
					html += "<a id='re_del' onclick=del(${reviewContent.writeNo})>댓글 삭제</a></div>";
				/* 	html += "<input type= button value='댓글삭제' id='re_del' onclick=del(${reviewContent.writeNo})></div>"; */
				})
				$("#reply").html(html)
			}, error:function(){
				alert("데이터를 가져올 수 없습니다.");
			}
		})
	} 

		
	function isLogin(writeNo) {
		var user = '${loginUser}';
		if(user != ''){
			location.href="${contextPath}/review/reviewLike?writeNo="+writeNo;
			return true;	
		} else{
			var goLogin = confirm("로그인 하신 유저만 좋아요를 누를 수 있어요. 로그인하러 가실래요?");
			if(goLogin){
				alert("goLogin true");
				location.href="${contextPath}/member/login";
				return false;
				
			}else{
				alert("goLogin false");
				location.href="${contextPath}/review/reviewContent?writeNo="+writeNo;
				return false;
			}
			
		} 
	}
	
	function del(writeGroup){
 		var chk = confirm("정말 삭제하실껀가요?");
 		if(chk){
 			location.href='delete2?writeGroup='+writeGroup;
 		}
 	}
 	
</script>
</head>
<body onload="reply_data()">

	<c:import url="../main/header.jsp" />
	<!-- write -->

	<main>
		<div class="title_wrap">
			<div class="level">
				<span>${reviewContent.writeNo}.</span>
			</div>
			<div class="title">
				<div id="t">${reviewContent.title}</div>
			</div>
		</div>

		<div class="line"></div>

		<div class="writer_wrap">
			<span class="writer">by. ${reviewContent.nickname}</span> <span
				class="date">${reviewContent.writeDate}</span> <span class="view">${reviewContent.views}</span>

			<div class="like">
				<a href="#" onclick="isLogin(${reviewContent.writeNo})">
				<c:if test="${likeIt == 'yes'}">
				<img id="heart" src="${contextPath}/resources/img/heart-fill.svg"></c:if>
				<c:if test="${likeIt == 'no'}">
				<img id="heart" src="${contextPath}/resources/img/heart.svg"></c:if>				
				</a>
				<span class="age">${reviewContent.likes}</span>
					
			</div>

			<c:if test="${reviewContent.imgName == 'None'}">
				<div id="imgx">
					<span>Θ</span>
				</div>
			</c:if>

			<c:if test="${reviewContent.imgName != 'None'}">
				<img
					src="${contextPath }/review/download?imageFileName=${reviewContent.imgName}"
					width="400px" style="float: right" />
			</c:if>
		</div>

		<div class="empty"></div>

		<div class="content_wrap">
			<div class="text">${reviewContent.content}</div>
		</div>

		<!-- buttons -->
		<input type="button" value="글목록"
			onclick="location.href='${contextPath}/review/reviewAllList'">
		<c:if test="${loginUser == reviewContent.id || loginUser == 'admin'}">
			<!-- 로그인되어있고 , reviewContent.uNickname 과 일치하면 노출-->
			<input type="button" value="글수정" id="modify_btn"
				onclick="location.href='${contextPath}/review/review_modify_form?writeNo=${reviewContent.writeNo}'">
			<input type="button" value="글삭제" id="delete_btn"
				onclick="location.href='${contextPath}/review/review_delete?writeNo=${reviewContent.writeNo}&imageFileName=${reviewContent.imgName}'">
		</c:if>
	</main>

	<section>
		<div class="plus">
			<a>+ 댓글</a>
		</div>
		<c:if test="${loginUser != null}">
			<div class="panel">
				<form id="form" name="form">
					<input type="hidden" name="writeNo"	value="${reviewContent.writeNo}">
					<div class="rep">
						<span>by. ${reviewContent.nickname}</span> <span>savedate</span><br>
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
	</section>


	<%-- <!-- reply -->
	<h2>답글페이지</h2>

	<div id="reply">
		<!-- 해당글에 답변이 있으면 노출 -->
	</div>
	<hr>
	<c:if test="${loginUser != null}">
		<!-- 로그인되어있으면 노출 -->
		<form id="form" name="form">
			<input type="hidden" name="writeNo" value="${reviewContent.writeNo}">
			<input type="hidden" name="id" value="${reviewContent.id}"> <b>작성자
				: ${reviewContent.nickname}</b><br> <b>내용</b> <b id="notice">10글자
				이상 작성해야합니다.</b>
			<textarea id="coment" name="coment" rows="5" cols="30"></textarea>
			<br>
			<button type="button" onclick="rep()">답글 달기</button>
			&nbsp;
		</form>
	</c:if>
 --%>
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