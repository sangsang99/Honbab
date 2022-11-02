<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
					<td><a href="${contextPath }/admin/promoContent?writeNo=${dto.writeNo}">${dto.title}</a></td>
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
</body>
</html>