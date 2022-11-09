<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!--우상  -->
<c:set var="contextPath" value="${pageContext.request.contextPath }"/> <!-- 우상 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메인페이지</title>
<style type="text/css">
.cd1 {
  padding-top: 2rem;
}
</style>
</head>

<body>
<div>
	<c:import url="../admin/boardManagement.jsp"></c:import>
</div>

<div class="cd1">

  <h1>ADMIN HOME</h1>
  <h2>${loginUser} 님 관리자로 로그인하셨습니다.</h2>
  <p>왼쪽 메뉴를 통해,</p>
  <p>1. 유저 ID 및 사업자 ID삭제가 가능합니다.</p>
  <p>&nbsp;&nbsp;&nbsp;유저 ID 및 사업자 ID삭제시, 해당 ID로 작성한 게시글이 모두 삭제됩니다.</p>
  <p>2. 관리자 ID로 접속시, 사용자의 글과 댓글을 삭제할 수 있습니다.</p>
  <p>3. 영업관리 메뉴에서 식당홍보게시글의 메인 노출 순서를 변경할 수 있습니다.</p>


</div>
</body>
</html>