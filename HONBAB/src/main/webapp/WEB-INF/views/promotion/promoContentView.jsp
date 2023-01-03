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
<link rel="preconnect" href="https://fonts.gstatic.com"  />
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

	<!-- footer -->
	<c:import url="../main/footer.jsp" />
	<style>.footer{position:static;}</style>
	
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