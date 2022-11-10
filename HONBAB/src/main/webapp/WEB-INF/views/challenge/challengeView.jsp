<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>level individual view</title>
<link href="${pageContext.request.contextPath}/resources/css/challenge/view.css?ver=4" rel="stylesheet" />
	<!-- font -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Kumbh+Sans:wght@300;400;500;600;700&family=Noto+Sans+KR:wght@300;400;500;700&family=Nunito+Sans:wght@400;600;700&family=Ramabhadra&display=swap"
      rel="stylesheet"
    />
<!-- script -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
function like() {
	var user = '${loginUser}';	
	var heart = '${challengeData.likes }';
	
	if(user != '') { //로그인 되어있는지 확인
		if(heart != 0){ 
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
</script>
</head>
<body>
	<!-- header -->
	<c:import url="../main/header.jsp"/>

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
			<span class="writer">by. ${challengeData.nickName }</span>
			<span class="date">${challengeData.saveDate }</span>
			<!-- </div> -->

			<div class="like">
				<input type="hidden" id="likeChk" value="${challengeData.likes }">
<!-- 				<button type="button" class="btn like-btn" id="likeBtn"> -->
				<a class="text-dark heart" style="text-decoration-line: none;" onclick="like();">
					<img id="heart" src="${contextPath}/resources/img/heart.svg">
					<c:out value="${challengeData.likes}"/> 
				</a>
<!-- 				</button> -->
<%-- 				<span>${challengeData.likes}</span> --%>
			</div>
		<%-- 				
			<c:choose>
				<c:when test="${defaultLike == 0 || defaultLike == null}">
			</c:when>
					
				<c:when test="${like == 1}">
					<input type="hidden" id="likeChk" value=w"${like }">
					<button type="button" class="btn notLike-btn" id="notLikeBtn">💢</button>
				</c:when>
			</c:choose> 
		--%>

			<c:if test="${challengeData.imgName == 'nan'}">
				<div id="imgx">
					Θ
<!-- 					<span>Θ</span> -->
				</div>
			</c:if>
			
			<c:if test="${challengeData.imgName != 'nan'}">
				<div id="img">
					<img src="${contextPath}/download?imgName=${challengeData.imgName }" width="400px" style="float: right" />
				</div>
			</c:if>
		</div>
		<div class="empty"></div>

		<div class="content_wrap">
			<!-- <span class="index">내용</span> -->
			<div class="text">
				${challengeData.content }
			</div>
		</div>
	
		<input type="button" value="글목록" onclick="location.href='${contextPath}/challengeAllList'">
		<c:if test="${challengeData.id == loginUser || loginUser == 'admin'}">
			<input type="button" value="글수정" id="modify_btn" 
				onclick="location.href='${contextPath}/challengeModifyForm?writeNo=${challengeData.writeNo }'" style="margin-left: 10px;">
			<input type="button" value="글삭제" id="delete_btn" 
				onclick="location.href='${contextPath}/challengeDelete?writeNo=${challengeData.writeNo }&imgName${challengeData.imgName }'">
		</c:if>
	</main>

	<!-- footer -->
	<c:import url="../main/footer.jsp"/>
	
<%-- 	<form id="frm">
		<ul class="ch_title">
			<li>Title :</li>
			<li><b>${challengeData.title }</b></li>
		</ul>
		<ul>
			<li>작성 일자 :</li>
			<li>${challengeData.saveDate }</li>
		</ul>
		<ul>
			<li>작성자 :</li>
			<!-- 추후 닉네임으로 바꿀것 -->
			<li>${challengeData.nickName }</li>
		</ul>
		<hr>
		<div class="content_wrap">
			작성 글 내용
			<div>${challengeData.content }</div>
		</div>
		<hr>
		<c:if test="${challengeData.imgName == 'nan'}">
			<b>첨부된 이미지가 없음</b>
		</c:if>
		<c:if test="${challengeData.imgName != 'nan'}">
			<img src="${contextPath}/download?imgName=${challengeData.imgName }"
				width="200px"></img>
		</c:if>
	</form>

	<div id="like">
		<c:choose>
			<c:when test="${like == 0 || like == null}">
				<!-- 현재는 아무런 데이터가 없는데.. 왜지  기본값 0 줬는데 -->
				<button type="button" class="btn like-btn" id="likeBtn">🤍</button>
				<input type="hidden" id="likeChk" value="${like }">
			</c:when>
			<c:when test="${like == 1}">
				<button type="button" class="btn notLike-btn" id="notLikeBtn">💢</button>
				<input type="hidden" id="likeChk" value="${like }">
			</c:when>
		</c:choose>

	</div>

	<c:if test="${challengeData.id == loginUser }">
		<input type="button" value="글수정"
			onclick="location.href='${contextPath}/challengeModifyForm?writeNo=${challengeData.writeNo }'">
		<input type="button" value="글삭제"
			onclick="location.href='${contextPath}/challengeDelete?writeNo=${challengeData.writeNo }&imgName${challengeData.imgName }'">
	</c:if>

	<input type="button" value="글목록"
		onclick="location.href='${contextPath}/challengeAllList'">

	<c:import url="../main/footer.jsp" /> --%>

</body>
</html>