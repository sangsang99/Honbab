<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영업 관리(우상)</title>
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&family=Nunito+Sans:wght@400;600;700&display=swap"
	rel="stylesheet" />

<style type="text/css">
.scroll {
	width: 888px;
	height: 222px;
	overflow: auto;
	border: 1px solid skyblue
}

.scroll table {
	white-space: nowrap;
	border-collapse: collapse;
}

li, span{
	display: inline-block;
}

.menu{
	display: block;
}

.cd1 {
  padding-top: 2rem;
}

td {
	width: 130px;
}

.title{
	width: 300px;
}
</style>


<script type="text/javascript">
	function count_chk(obj) {
		var adNo = document.getElementsByName("adNo");
		var chkBox = document.getElementsByName("chk");
		var chkCnt = 0;
		for (var i = 0; i < chkBox.length; i++) {
			if (chkBox[i].checked) {
				chkCnt++;
				adNo[i].disabled = false;
			} else {
				adNo[i].disabled = true;
			}
		}
		if (chkCnt > 5) {
			alert("5개까지만 체크가능");
			obj.checked = false;
			return false;
		}
	}
	
	function setad() {
		document.getElementById('setAD').submit();
	}
	
	function goNoticeForm() {
		location.href='${contextPath}/oper/writeNoticeForm';
	}
</script>
</head>
<body>
	
	<div>
		<c:import url="../admin/boardManagement.jsp"></c:import>
	</div>
	<div class="cd1">
		<h2>현재 설정된 홍보 리스트 미리보기</h2>
		<table border="1">
			<tr>
				<td>글번호</td>
				<td class="title">제목</td>
				<td>작성일</td>
				<td>홍보번호</td>
			</tr>
			<c:forEach var="promoAD" items="${promoListAD}">
				<tr>
					
					<td>${promoAD.writeNo }</td>
					
					<td><a
						href="${contextPath}/promotion/contentView?writeNo=${promoAD.writeNo } ">${promoAD.title}</a></td>
					
					<td>${promoAD.saveDate }</td>
					
					<td>${promoAD.addto.adNo}</td>
				</tr>
			</c:forEach>
		</table>
		<br> <br>
		<hr>

		<h2>홍보 순서관리</h2>
		<p>광고글은 5개까지만 가능합니다</p>
		<p>체크박스를 눌러야 number(순서) 설정이 가능합니다[1번이 1순위]</p>
		<p>제출하는 순간 기존 광고 순서는 삭제되니 신중하게 작성해주세요</p>
		<div class="scroll">
			<form name="setAD" id="setAD" action="${contextPath}/oper/setAD" method="post">
				<table>
					<tr>
						<td><span>글번호</span></td>
						<td class="title"><span>제목</span></td>
						<td><span>작성일</span></td>
						<td><span>작성자</span></td>
						<td><span>홍보순서</span></td>
					</tr>		
					<c:forEach var="promo" items="${promoAllList}">
					<tr>
						<td><span>${promo.writeNo }</span></td>
						<td class="title"><a href="${contextPath }/promotion/contentView?writeNo=${promo.writeNo}">${promo.title}</a></td>
						<td><span>${promo.saveDate}</span></td>
						<td><span>${promo.id }</span></td>
						<td><span>
							<input type="checkbox" name="chk" onclick="count_chk(this)" value="${promo.writeNo}">
							<input type="number" name="adNo" min="1" max="5" disabled></span></td>
					</tr>
					</c:forEach>			
				</table>
			</form>
		</div>
		<input type="button" value="설정완료" onclick="setad()">
		<br> <br>
		<hr>

		<h2>공지사항[beta]</h2>
		<div class="">
		<ul class="">
		<li class="">글번호</li>
		<li class="">제목</li>
		<li class="">작성일</li>
			</ul>
				</div>
		<div class="">
			<ul class="">
			<c:forEach var="notice" items="${noticeList}">	
					<li class="">${notice.writeNo }</li>					
					<li class=""><a
						href="${contextPath}/oper/noticeConetentView?writeNo=${notice.writeNo } ">${notice.title}</a></li>				
					<li class="">${notice.writeDate }</li>
					<br>
			</c:forEach>
			</ul>
			<input type="button" value="공지글쓰기" onclick="goNoticeForm()">
		</div>
	</div>
</body>

</html>