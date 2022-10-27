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
</head>
<body>
	<header> </header>
	
	<form id="frm">
		<ul class="title">
			<li>Title : </li>
			<li>${challengeData.uTitle }</li>
		</ul>
		<ul>
			<li>작성 일자 : </li>
			<li>${challengeData.uSaveDate }</li>
		</ul>
		<ul>
			<li>작성자 : </li>
			<li>${challengeData.uWriter }</li>
		</ul>
		<hr>
			<div class="content_wrap">
				작성 글 내용
				<div>${challengeData.uContent }</div>
			</div>
	
	
		<hr>
		<c:if test="${challengeData.uImgName == 'nan'}">
		<b>첨부된 이미지가 없음</b>
		</c:if>
		<c:if test="${challengeData.uImgName != 'nan'}">
			<img
				src="${contextPath}/download?uImgName=${challengeData.uImgName }"
				width="200px"></img>
		</c:if>
	</form>
	
	

	<%-- <c:if test="${levelData.id == loginUser }"> --%>
		<input type="button" value="글수정"
			onclick="location.href='${contextPath}/challengeModifyForm?uWriteNo=${challengeData.uWriteNo }'">
		<input type="button" value="글삭제"
			onclick="location.href='${contextPath}/challengeDelete?uWriteNo=${challengeData.uWriteNo }&uImgName${challengeData.uImgName }'">
<%-- 	</c:if> --%>
	<input type="button" value="글목록"
		onclick="location.href='${contextPath}/challengeAllList'">

	<footer></footer>

</body>
</html>