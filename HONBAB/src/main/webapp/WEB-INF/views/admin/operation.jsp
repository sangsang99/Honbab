<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영업 관리(우상)</title>
</head>
<body>
	

	<h3>홍보 순서관리</h3>
	<form name="setAD" id="setAD" action="${contextPath}/oper/setAD" method="post">
		1순<input type="number">
		2순<input type="number">
		3순<input type="number">
		<input type="submit" value="설정완료">
	</form>
	<br>
	<table border="1">
	<c:forEach var="promo" items="${promoList}">
		<tr>
			<td>글번호 </td><td>${promo.writeNo }</td>
			<td>제목</td><td><a href="${contextPath}/promotion/contentView?writeNo=${promo.writeNo } ">${promo.title}</a></td>
			<td>작성일 </td><td>${promo.saveDate }</td>
			<td>홍보</td><td>checkbox</td>
		</tr> 
	</c:forEach>
	</table>
	<p>상단에 3개가 셀렉트로 되어있고 글번호 누르면 정렬됨 폼에다가 값 3개 넣고 등록 하면 컨트롤러로 보내지는 느낌??	</p>
	<p>게시글을 보여주고 체크박스 를 설정할 수 있고 ?	</p>
	<p>게시글을 보여주고 넘버 INPUT을 옆에 설정할 수 있고? ★ 그다음 유효성검사에서 중복값 있으면 안되게 설정	</p>
		

	<h3>2. 게시글 리스트 최신순 정렬(제목누르면 들어가짐)</h3>
	<table border="1">
	<c:forEach var="notice" items="${noticeList}">
		<tr>
			<td>글번호 </td><td>${notice.writeNo }</td>
			<td>제목</td><td><a href="${contextPath}/oper/noticeConetentView?writeNo=${notice.writeNo } ">${notice.title}</a></td>
			<td>작성일 </td><td>${notice.writeDate }</td>
		</tr> 
	</c:forEach>
	</table>
	
	<a href="${contextPath}/oper/writeNoticeForm">게시글 쓰기 버튼</a>
	일단 요정도 ㅎㅎ
</body>
</html>