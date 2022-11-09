<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="${pageContext.request.contextPath}/resources/css/challenge/writeForm.css?ver=4"
	rel="stylesheet" />
<!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&family=Nunito+Sans:wght@400;600;700&display=swap"
	rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>

	<!-- header -->
	<c:import url="../main/header.jsp" />
	
		<aside>
		<div class="aside_wrap">
			<div class="text">
				<span>‘사람찾기’</span>
				<div>쓰세요</div>
				<div>
					글 쓰세요 알아서
				</div>
			</div>
		</div>
		<div class="honbab">
			<span>HONBAB</span>
		</div>
		<div class="innerfooter">
			<c:import url="../main/footer.jsp" />
		</div>
	</aside>
	
		<main>
		<div class="main_wrap">
			<form action="${contextPath}/find/find_Modify"
				enctype="multipart/form-data" method="post">
				<ul>
					<li>
						<span class="index_en">Title</span> 
						<input type="hidden" name="writeNo" value="${findContent.writeNo}"> <!-- 쿼리문(where)에 쓸거 -->
						<input type="text"placeholder="제목 작성" name="title" value="${findContent.title}" />
					</li>
					<hr />
					<div class="line"></div>
					<li>
						<span class="index_en">Writer</span>
						<input type="text" name="nickName" readonly="readonly" value="${findContent.nickName}">
					</li>
					<hr />
					<div class="line"></div>						
					<li>
						<span class="index_en">Age</span> 
						<input type="text" name="age" value="${findContent.age}">
					</li>
					<hr />
					<div class="line"></div>						
					<li>
						<span class="index_en">Gender</span> 
						<input type="radio" name="gen" value="남성" checked>남성
						<input type="radio" name="gen" value="여성">여성
					</li>	
					<hr />
					<div class="line"></div>					
					<li>
						<span class="index_en">Region</span> 
						<input type="text" name="region" maxlength="2" value="${findContent.region}">
					</li>
					<hr />
					<div class="line"></div>						
					<li>
						<span class="index_en">내용</span> 
						<textarea maxlength="999" name="content">${findContent.content }</textarea>
					</li>						
				</ul>
				<input type="submit" value="수정"> 
				<input type="button" value="글목록" onclick="location.href='${contextPath}/find/findAllList'"> 
			</form>
		</div>
	</main>
	
		
		
</body>
</html>