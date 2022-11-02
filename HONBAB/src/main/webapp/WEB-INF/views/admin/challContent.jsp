<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
	

		<input type="button" value="글삭제"
			onclick="location.href='${contextPath}/admin/challengeDelete?writeNo=${challengeData.writeNo }&imgName${challengeData.imgName }'">
	
	<input type="button" value="글목록"
		onclick="location.href='${contextPath}/admin/challBoard'">
</body>
</html>