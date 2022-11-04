<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영업 관리(우상)</title>
<script type="text/javascript">
	function count_chk(obj) {
		var adNo = document.getElementsByName("adNo");
		var chkBox = document.getElementsByName("chk");
		var chkCnt = 0;
		for (var i = 0; i < chkBox.length; i++) {
			if(chkBox[i].checked){			
				chkCnt++; 			
				adNo[i].disabled = false;
			}else{
				adNo[i].disabled = true;
			}
		}
		if(chkCnt > 5){
			alert("5개까지만 체크가능");
			obj.checked = false;
			return false;
		}
	}
</script>
</head>
<body>
	

	<h3>홍보 순서관리</h3>
	<form name="setAD" id="setAD" action="${contextPath}/oper/setAD" method="post">	
		<table border="1">
			<c:forEach var="promo" items="${promoList}">
			<tr>
				<td>글번호 </td><td>${promo.writeNo }</td>
				<td>제목</td><td><a href="${contextPath}/promotion/contentView?writeNo=${promo.writeNo } ">${promo.title}</a></td>
				<td>작성일 </td><td>${promo.saveDate }</td>
				<td>홍보순서</td>
					<td><input type="checkbox" name="chk" onclick="count_chk(this)" value="${promo.writeNo}">
						<input type="number" name="adNo" min="1" max="5" disabled></td>
			</tr> 
			</c:forEach>
		</table>
		<input type="submit" value="설정완료">
	</form>
	<br>
	
	<p>광고글은 5개</p>
	<p>체크박스는 5개까지 가능하도록 했으며</p>
	<p>체크박스를 눌러야  number 설정 가능</p>
	<p>체크된 wrtieno와 홍보순서로 설정한 number값 post로 전송</p>

		

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