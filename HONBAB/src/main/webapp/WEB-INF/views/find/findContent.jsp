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
									html += "<div class='re_wrap'><div id='re' align='left'><b>by. </b>" + redata.reNick + "님 / ";
					html += writeDate + "<br>" 
					html += redata.reComent + "</div>"
					html += "<a id='re_del' onclick=del(${findContent.writeNo})>댓글 삭제</a></div>";
				})
				$("#reply").html(html)
			}, error:function(){
				alert("데이터를 가져올 수 없습니다.");
			}
		})
	} 
 	
 	function del(writeGroup){
 		var chk = confirm("정말 삭제하실껀가요?");
 		if(chk){
 			location.href='delete1?writeGroup='+writeGroup;
 		}
 	}
</script>
</head>
<body onload="reply_data()">
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
		<span class="date">${findContent.writeDate}</span><br>
		<span class="age">나이 ${findContent.age}</span><br>
		<span class="gen">성별 ${findContent.gen}</span><br>
		<span class="reg">지역 ${findContent.region}</span><br>
		<span class="view">조회수 ${findContent.views}</span>
	</div>
		<div class="empty"></div>

		<div class="content_wrap">
			<div class="text">
				${findContent.content}
			</div>
		</div>

		<input type="button" value="글목록"
			onclick="location.href='${contextPath}/find/findAllList'">
			<c:if test="${loginUser == findContent.id || loginUser == 'admin'}">
			<input type="button" value="글수정" id="modify_btn"
				onclick="location.href='${contextPath}/find/find_modify_form?writeNo=${findContent.writeNo}'">
			<input type="button" value="글삭제" id="delete_btn"
				onclick="location.href='${contextPath}/find/find_delete?writeNo=${findContent.writeNo}'">
		</c:if>
	</main>

    <section>
    <div class="plus"><a>+ 댓글</a></div>
		<c:if test="${loginUser != null}">
      <div class="panel">
				<form id="form" name="form">        
					<input type="hidden" name="writeNo" value="${findContent.writeNo}">
	        <div class="rep">
	          <span>by. ${findContent.nickName}</span>
	          <span>savedate</span><br>
		     		<input type="text" id="coment" name="coment" placeholder="10글자 이상 작성" />
   					<button type="button" onclick="rep()">
		     			<img id="enter" src="${contextPath}/resources/img/arrow-return-left.svg">
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



	<%-- <div id="reply">
		<!-- 해당글에 답변이 있으면 노출 -->
	</div>
	<hr>
	<c:if test="${loginUser != null}">
		<!-- 로그인되어있으면 노출 -->
		<form id="form">
			<input type="hidden" name="writeNo" value="${findContent.writeNo}">
			<input type="hidden" name="id" value="${reviewContent.id}">
			<b>작성자 : ${findContent.nickName}</b><br> <b>내용</b>
			<textarea id="coment" name="coment" rows="5" cols="30"></textarea>
			<br>
			<button type="button" onclick="rep()">답글 달기</button>
			&nbsp;
		</form>
	</c:if> --%>

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