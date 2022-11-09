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
	href="${pageContext.request.contextPath}/resources/css/find/writeForm.css?ver=4"
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
		<div class="honbab">
			<span>FIND</span>
		</div>
			<div class="text">
				<span>‘사람찾기’</span>
				<div>쓰세요</div>
				<div>
					글 쓰세요 알아서
				</div>
			</div>
		</div>
		<div class="innerfooter">
			<c:import url="../main/footer.jsp" />
		</div>
	</aside>

	
		<main>
		<div class="main_wrap">
			<form action="${contextPath}/find/find_Modify" enctype="multipart/form-data" method="post">
				<ul>
					<li>
						<span class="index_kr">제목</span> 
						<input type="hidden" name="writeNo" value="${findContent.writeNo}"> <!-- 쿼리문(where)에 쓸거 -->
						<input type="text"placeholder="제목 작성" name="title" value="${findContent.title}" />
					</li>
					<hr />
					<div class="line"></div>
					<li>
						<span class="index_kr">작성자</span> 
						<input type="text" name="nickName" readonly="readonly" value="${findContent.nickName}">
					</li>
					<hr />
					<div class="line"></div>						
					<li>
						<span class="index_kr">나이</span> 
						<input type="text" name="age" value="${findContent.age}">
					</li>
					<hr />
					<div class="line"></div>						
					<li class="gender">
						<span class="index_kr">성별</span> 
						<div class="btn">
							<label>
	            	<span class="g">남성</span>
	              <input type="radio" name="gen" value="남성" checked />
	            </label>
	            <label>
	              <span class="g">여성</span>
	              <input type="radio" name="gen" value="여성" />
	            </label>
          	</div>  
					</li>	
					<hr />
					<div class="line"></div>					
					<li class="reg_text">
						<span class="index_kr" id="reg">지역</span> 
						<input type="text" name="region" maxlength="2" value="${findContent.region}">
					</li>
					<hr />
					<div class="line"></div>						
					<li class="content">
						<span class="index_kr">내용</span> 
						<textarea maxlength="999" name="content">${findContent.content }</textarea>
					</li>						
				</ul>
				<input type="submit" value="수정"> 
				<input type="button" value="목록" onclick="location.href='${contextPath}/find/findAllList'"> 
			</form>
		</div>
	</main>
	
		
		
</body>
</html>