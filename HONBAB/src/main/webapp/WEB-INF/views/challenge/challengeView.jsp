<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>level individual view</title>
<style type="text/css">
	* {
	margin: 0;
	padding: 0;
	list-style: none;
	}
	
	ul {
	display: flex;
	}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">

	$('#likeBtn').click(function() {
		likeUpdate();
	});
	
	function likeUpdate() {
		let root = getContextPath();
		likeurl = "/likeUpdate",
		likeWriteNo = $('#likeWriteNo').val(),
		/* likeId = $('#likeId').val(),
		likeNickName = $('#likeNickName').val(), */
		count = $('#like').val(),
		data = {"likeWriteNo" : likeWriteNo,
				/* "likeId" : likeId,
				"likeNickName" : likeNickName */
				"count" : count
				};
		
		$.ajax({
			url : root + likeurl,
			type : 'POST',
			contentType: 'application/json',
			data : JSON.stringify(data),
			success : function(result){
				console.log("수정" + result.result);
				if(count == 1){
					console.log("좋아요 취소");
					$('#notLikeBtn').attr('class','btn like-btn');
					$('#likeBtn').attr('class','btn notLike-btn');
				}else if(count == 0 || count == null){
					console.log("좋아요!");
					$('#like').val(1);
					$('#like').val(0);
				}
			}, error : function(result){
				console.log("에러" + result.result)
			}
			
			});
		};	
		
		function getContextPath() {
		    var hostIndex = location.href.indexOf( location.host ) + location.host.length;
		    return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
		} 
</script>
</head>
<body>
	<c:import url="../main/header.jsp"/>
	
	<form id="frm">
		<ul class="ch_title">
			<li>Title : </li>
			<li><b>${challengeData.title }</b></li>
		</ul>
		<ul>
			<li>작성 일자 : </li>
			<li>${challengeData.saveDate }</li>
		</ul>
		<ul>
			<li>작성자 : </li>
			<!-- 추후 닉네임으로 바꿀것 -->
			<li>${challengeData.nickName }</li>
		</ul>
		<hr>
		<div class="content_wrap"> 작성 글 내용
			<div>${challengeData.content }</div>
		</div>
		<hr>
		<c:if test="${challengeData.imgName == 'nan'}">
		<b>첨부된 이미지가 없음</b>
		</c:if>
		<c:if test="${challengeData.imgName != 'nan'}">
			<img
				src="${contextPath}/download?imgName=${challengeData.imgName }"
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

	<c:import url="../main/footer.jsp"/>

</body>
</html>