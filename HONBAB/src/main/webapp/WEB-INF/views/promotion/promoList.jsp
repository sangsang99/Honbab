<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>promotion/promoList.jsp</title>

<style type="text/css">
.login{
	text-align: center;
	height: 300px;
}
</style>
</head>
<body>
	
	<div class="wrap" align="center">
		<br>
		<h1 align="center">홍보게시판</h1>
		<br>
		<table class="table table_hover" border="1">
			<tr>
				<th width="100px">번호</th>
				<th width="150px">id</th>
				<th width="200px">제 목</th>
				<th width="200px">날 짜</th>
				<th width="100px">조회수</th>
				<th width="150px">이미지 이름</th>
			</tr>
			<c:if test="${promoList.size() == 0}">
				<tr>
					<th colspan="6">내용이 없습니다.</th>
				</tr>			
			</c:if>
			<c:forEach var="dto" items="${promoList}">
				<tr>
					<td>${dto.writeNo }</td>
					<td>${dto.id }</td>
					<td><a href="${contextPath }/promotion/contentView?writeNo=${dto.writeNo}">${dto.title}</a></td>
					<td>${dto.saveDate}</td>
					<td>${dto.hit }</td>
					<td>${dto.imageFileName }</td>
				</tr>
			</c:forEach>
			<!--  페이징  -->
			<tr>
				<td colspan="6" align="center">
					<c:forEach var = "num" begin="1" end="${repeat}">
						<a href="promoList?num=${num }">[${num }]</a>
					</c:forEach>
				</td>
			</tr>
			<tr>
				<td colspan="6">
					<a href="${contextPath }/promotion/writeForm">글작성</a>
				</td>
			</tr>
			<tr>
				<td colspan="6">
					<a href="${contextPath }/index">메인화면</a>
				</td>
			</tr>
			
		</table>
	</div>
	
</body>
</html>