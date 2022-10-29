<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
<style>
main{
	width:90%;
	display: block;
	margin: 0 auto;
}
.banner>img{
	width: 100%; 
	height: 300px;
}
.banner{
	text-align: center;
}
.board{
display: flex;
}
.board>div{
border: 1px solid gold; 
flex: 1;
}
</style>
</head>
<body>
	<header>
	<c:import url="main/header.jsp"/>
	</header>
	
	<main>
	
	<div class="banner">
		[사장님홍보글]
		<img src="https://colorate.azurewebsites.net/SwatchColor/5F5F5F" >
	</div>
		
	<div class="board">
		<div>
			<%-- <c:import url="main/Board01.jsp"/> --%>
			<b>[사람찾기 = board1]</b>
			<a id="find" href="${contextPath}/find/findAllList">더 많은 사람 찾기</a>
			<c:import url="find/bestFind.jsp"/>
		</div>
		<div>
			<!--<c:import url="main/Board02.jsp"/>-->
			<b>[혼밥후기 = board2]</b>
			<a id="review" href="${contextPath}/review/reviewAllList">더 많은 혼밥 후기</a>
			<c:import url="review/bestReview.jsp"/>
		</div>
	</div>
	
	<div>
		<c:import url="main/Board03.jsp"/>
		
	</div>
	</main>
	
	
	<footer>
	<c:import url="main/footer.jsp"/>
	</footer>
</body>
</html>