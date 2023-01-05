<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>level individual view</title>
<link
	href="${pageContext.request.contextPath}/resources/css/challenge/view.css?ver=4"
	rel="stylesheet" />
<!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" />
<link
	href="https://fonts.googleapis.com/css2?family=Kumbh+Sans:wght@300;400;500;600;700&family=Noto+Sans+KR:wght@300;400;500;700&family=Nunito+Sans:wght@400;600;700&family=Ramabhadra&display=swap"
	rel="stylesheet" />
<!-- script -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	function like() {
		var user = '${loginUser}';
		var heart = '${challengeData.likes }';

		if (user != '') { //로그인 되어있는지 확인
			if (heart != 0) {
				alert("다시 안좋아짐")
				heart = heart - 1;
			} else {
				alert("좋음")
				heart = heart + 1;
			}
		} else {
			alert("로그인 후  가능합니다.")

		}
		console.log(heart);
	}

	function getContextPath() {
		var hostIndex = location.href.indexOf(location.host)
				+ location.host.length;
		return location.href.substring(hostIndex, location.href.indexOf('/',
				hostIndex + 1));
	}
	
	function isLogin(writeNo) {
		var user = '${loginUser}';
		if(user != ''){
			location.href="${contextPath}/challengeLike?writeNo="+writeNo;
			return true;	
		} else{
			var goLogin = confirm("로그인 하신 유저만 좋아요를 누를 수 있어요. 로그인하러 가실래요?");
			if(goLogin){
				alert("goLogin true");
				location.href="${contextPath}/member/login";
				return false;
				
			}else{
				alert("goLogin false");
				location.href="${contextPath}/challengeView?writeNo="+writeNo;
				return false;
			}
			
		} 
	}
</script>
</head>
<body>
	<!-- header -->
	<c:import url="../main/header.jsp" />

	<main>
		<div class="title_wrap">
			<div class="level">
				<span>LV. ${challengeData.chLevel }</span> <span id="slash">/</span>
			</div>
			<div class="title">
				<div id="t">${challengeData.title }</div>
			</div>
		</div>

		<div class="line"></div>

		<div class="writer_wrap">
			<!-- <div class="wri_date"> -->
			<span class="writer">by. ${challengeData.nickName }</span> <span
				class="date">${challengeData.saveDate }</span>
			<!-- </div> -->

			<div class="like">
				<a href="#" onclick="isLogin(${challengeData.writeNo})">
				<c:if test="${likeIt == 'yes'}">
				<img id="heart" src="${contextPath}/resources/img/heart-fill.svg"></c:if>
				<c:if test="${likeIt == 'no'}">
				<img id="heart" src="${contextPath}/resources/img/heart.svg"></c:if>				
				</a>
				<span class="age">${challengeData.likes}</span>
					
			</div>
				
				<!-- </button> -->
			</div>

			<c:if test="${challengeData.imgName == 'nan'}">
				<div id="imgx">
					Θ
					<!--<span>Θ</span> -->
				</div>
			</c:if>

			<c:if test="${challengeData.imgName != 'nan'}">
				<div id="img">
					<img
						src="${contextPath}/download?imgName=${challengeData.imgName }"
						width="400px" style="float: right" />
				</div>
			</c:if>
		</div>
		<div class="empty"></div>

		<div class="content_wrap">
			<!-- <span class="index">내용</span> -->
			<div class="text">${challengeData.content }</div>
		</div>

		<input type="button" value="글목록"
			onclick="location.href='${contextPath}/challengeAllList'">
		<c:if test="${challengeData.id == loginUser || loginUser == 'admin'}">
			<input type="button" value="글수정" id="modify_btn"
				onclick="location.href='${contextPath}/challengeModifyForm?writeNo=${challengeData.writeNo }'"
				style="margin-left: 10px;">
			<input type="button" value="글삭제" id="delete_btn"
				onclick="location.href='${contextPath}/challengeDelete?writeNo=${challengeData.writeNo }&imgName${challengeData.imgName }'">
		</c:if>
	</main>

	<!-- footer -->
	<c:import url="../main/footer.jsp" />
	<style>.footer{position:static;}</style>

</body>
</html>