<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>혼밥 레벨</title>
<link href="${contextPath}/resources/css/challenge/allList.css?ver=4.4" rel="stylesheet" />
<!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Kumbh+Sans:wght@300;400;500;600;700&family=Noto+Sans+KR:wght@300;400;500;700&family=Nunito+Sans:wght@400;600;700&family=Ramabhadra&display=swap" rel="stylesheet">
<script type="text/javascript">
function user_check() {
	var user = '${loginUser}';	
	if(user != ''){ //로그인 되어있는지 확인
		location.href="challengeWriteForm";			
	} else {
		alert("로그인 후 작성 가능합니다.")
/* 		location.href="member/login";		 */	
/* 		location.href="${contextPath }/member/login";			 */
	}
}

function updateLike(writeNo){
	location.href="updateLike?writeNo=" + writeNo;
}

function showPopUp() {
	let width = 500;
	let height = 500;
	
	let left = (window.screen.width / 2) - (width/2);
	let top = (window.screen.height / 4);
	
	let windowStatus = 'width='+width+', height='+height+', left='+left+', top='+top+', scrollbars=yes, status=yes, resizable=yes, titlebar=yes';
	
	const url = "${contextPath }/challengePop";
	
	window.open(url, "hello popup", windowStatus);
}

function getLevelValue() {
frm.level.value = "<%=request.getParameter("level")%>";
frm.keyword.value = "<%=request.getParameter("keyword")%>";	
}

</script>
</head>
<body onload="getLevelValue()">
	<!-- header -->
	<c:import url="../main/header.jsp"/>
	
	<section>
     <form id="challengeSearch" name="challengeSearch" action="${contextPath }/challengeSearch"	enctype="multipart/form-data" method="post" autocomplete="off">
        <div class="search">
          <div id="searchForm">
          <select id="level" name="level">
            <option value="1">레벨 1</option>
            <option value="2">레벨 2</option>
            <option value="3">레벨 3</option>
            <option value="4">레벨 4</option>
            <option value="5">레벨 5</option>
            <option value="6">레벨 6</option>
            <option value="7">레벨 7</option>
            <option value="8">레벨 8</option>
            <option value="9">레벨 9</option>
          </select>
	          <input type="text" id="keyword" name="keyword" class="searchKey" placeholder="검색어를 입력하세요." />
    	      <input type="submit" value="검색" />
    	      <%-- <img id="magnifier" src="${contextPath}/resources/img/search.svg"> --%>
          </div>
    	    <br>
	    		<a href="javascript:showPopUp()" id="levelGuide">혼밥 레벨?</a>
			</div>
		</form>
	</section>

	<main>
<!--       <span>검색 결과</span> -->
		<div class="index_wrap">
      <ul class="index">
        <li class="writeNo">
          <span>NO</span>
        </li>
        <li class="lv">
        	<span>LV</span>
        </li>
        <li class="ch_title">
          <span>TITLE</span>
        </li>
        <li class="writer">
          <span>WRITER</span>
        </li>
        <li class="date">
          <span>DATE</span>
        </li>
        <li class="view">
          <span>VIEWS</span>
        </li>
      </ul>
    </div>
		<c:if test="${challengeList.size() == 0 }">
			<h1>LV. <%=request.getParameter("level")%> '<%=request.getParameter("keyword")%>'에 해당하는 글이 없습니다.</h1>
		</c:if>

		<c:forEach var="dto" items="${challengeList }" varStatus="status">

			<div class="content_wrap">
	      <ul class="index">
	        <li class="writeNo">
	        	<c:set var="number" value="${allCount - ((currentPg-1) * pageLetter + status.index)}"/>
	          <span>${number}</span>
	        </li>
	        <li class="lv">
	          <span>레벨 ${dto.chLevel }</span>
	        </li>
	        <li class="ch_title">
	          <a onclick="upView(${dto.writeNo}); return false" href="${contextPath }/challengeView?writeNo=${dto.writeNo }">${dto.title }</a>
	        </li>
	        <li class="writer">
	          <span>${dto.nickName }</span>
	        </li>
	        <li class="date">
	          <span>${dto.saveDate }</span>
	        </li>
	        <li class="view">
	          <span>${dto.views }</span>
	        </li>
	      </ul>
	    </div>
		</c:forEach>
		<c:set var="no" value="${no - 1}"></c:set>
		<c:if test="${loginUser != null}">
		<div id="writebtn">
			<input type="button" onclick="user_check()" value="글 쓰기">
		</div>
		</c:if>
		<div class="paging">
			<c:forEach var="num" begin="1" end="${repeat }">
				<a href="${contextPath }/challengeAllList?num=${num}">${num}</a>
			</c:forEach>
		</div>
   </main>

	<!-- footer -->
	<c:import url="../main/footer.jsp"/>

</body>
</html>