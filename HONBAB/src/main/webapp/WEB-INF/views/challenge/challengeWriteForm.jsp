<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>level write</title>
<script type="text/javascript">
	function challengeLv(e) {
		let level = document.getElementById("challenge");
		let value = level.options[level.selectedIndex].value;

		let text;
		if (value == 1) {
			text = "편의점에서 먹기 🥡";
		} else if (value == 2) {
			text = "학생 식당이나 구내 식당에서 먹기 🍱";
		} else if (value == 3) {
			text = "패스트푸드점에서 세트메뉴 먹기 🍔🍟🥤";
		} else if (value == 4) {
			text = "분식집, 김밥X국에서 먹기 🍜";
		} else if (value == 5) {
			text = "중국집, 백반집 등 일반 음식점에서 먹기 🥘🥄";
		} else if (value == 6) {
			text = "SNS 맛집에서 먹기🍝";
		} else if (value == 7) {
			text = "패밀리레스토랑에서 먹기 🍴🧆";
		} else if (value == 8) {
			text = "고기집, 횟집에서 먹기 🦪";
		} else if (value == 9) {
			text = "술집에서 혼자 술 마시기 🍺";
		}

		document.getElementById("text").innerText = text;
	}
</script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	function readURL(input) {
		var file = input.files[0]; // 파일 정보
		if (file != "") {
			var reader = new FileReader();
			reader.readAsDataURL(file); // 파일 정보 읽어옴
			reader.onload = function(e) { // 파일 읽은 결과 표시(성공 시)
				$("#preview").attr("src", e.target.result)
			}
		}
	}

	/*  			function login_chk() {
	 if(true){ //로그인 되어있는지 확인
	 alert("로그인 필수")
	 location.href="${contextPath }/member/login";			
	 }
	 } */
</script>
</head>
<!-- <body onload="login_chk()"> -->
<body>
	<c:import url="../main/header.jsp" />
	
	<div class="wrap" align="center">
		<div class="challenge_save write">
			<form action="${contextPath }/challengeSave"
				enctype="multipart/form-data" method="post">
				<select id="challenge" onchange="challengeLv(this)" name="chLevel">
					<option selected disabled hidden>레벨 선택</option>
					<option value="1">레벨 1</option>
					<option value="2">레벨 2</option>
					<option value="3">레벨 3</option>
					<option value="4">레벨 4</option>
					<option value="5">레벨 5</option>
					<option value="6">레벨 6</option>
					<option value="7">레벨 7</option>
					<option value="8">레벨 8</option>
					<option value="9">레벨 9</option>
				</select> 
				<span id="text"></span>
				
				<input type="hidden" value="${loginUser}" name="id" >
				<p>작성자</p>
				<input type="text" name="nickName" value="nickName" readonly="readonly">
				
				<p>제목</p>
				<input type="text" name="title" size="50"><br>

				<p>내용</p>
				<textarea rows="10" cols="50" name="content"></textarea>
				<br> 
				
				<b>첨부한 파일</b> 
				<input type="file" name="imgName" onchange="readURL(this)"><br>
				<img src="#" id="preview" width="100px"><br> <br> 
				
				<input type="submit" value="저장"> &nbsp; 
				<input type="button" value="글목록" onclick="location.href='${contextPath}/challengeAllList'">
			</form>
		</div>
	</div>

	<c:import url="../main/footer.jsp" />
</body>
</html>