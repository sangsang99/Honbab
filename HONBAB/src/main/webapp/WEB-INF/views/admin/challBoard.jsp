<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
function user_check() {
	if(true){ //로그인 되어있는지 확인
		alert("로그인 필수")
		location.href="${contextPath }/member/login";			
	} 
}

function upViews(writeNo){
	location.href="upView?writeNo=" + writeNo;
}
</script>
<title>동형</title>
</head>
<body>
 <c:if test="${challengeList.size() == 0 }">
			<h1>등록된 글이 없습니다.</h1>
			</c:if>
<ul class="list_t">
				<li class="writeNo"><span> No. </span></li>
				<li class="lv"><span> 레벨 </span></li>
				<li class="ch_title"><span>제목</span></li>
				<li class="writer"><span>작성자</span></li>
				<li class="view"><span> 조회수 </span></li>
				<li class="date"><time> 작성일자 </time></li>
			</ul>
			<c:forEach var="dto" items="${challengeList }" varStatus="status">
			<ul class="list_c">
				<!-- 시퀀스 초기화 시키면 다시 1부터 매겨질 것이라 예상 : 왜인지 처음부터 4번으로 시작했고, 적었다 삭제한 글 4개, 현재 존재하는 글 4개 합산되어서 status가 12개로 계산되는듯-->
				<li class="writeNo"><span>${allCount - ((currentPage-1)*pageLetter + status.index)}</span></li>
				<li class="lv"><span>레벨 ${dto.chLevel }</span></li>
				<li class="ch_title">
					<a onclick="upView(${dto.writeNo}); return false" href="${contextPath }/admin/challContent?writeNo=${dto.writeNo }">${dto.title }</a>
				</li>
				<li class="writer"><span>${dto.nickName }</span></li>
				<li class="view"><span>${dto.views }</span></li>
				<li class="date"><span>${dto.saveDate }</span></li>
			</ul>
		</c:forEach>
</body>
</html>