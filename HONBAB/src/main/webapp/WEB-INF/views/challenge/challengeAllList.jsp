<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>혼밥 레벨</title>
<link href="${pageContext.request.contextPath}/resources/css/challenge/allList.css?ver=4" rel="stylesheet" />
<!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Kumbh+Sans:wght@300;400;500;600;700&family=Noto+Sans+KR:wght@300;400;500;700&family=Nunito+Sans:wght@400;600;700&family=Ramabhadra&display=swap" rel="stylesheet">
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

function showPopUp() {
	let width = 500;
	let height = 500;
	
	let left = (window.screen.width / 2) - (width/2);
	let top = (window.screen.height / 4);
	
	let windowStatus = 'width='+width+', height='+height+', left='+left+', top='+top+', scrollbars=yes, status=yes, resizable=yes, titlebar=yes';
	
	const url = "${contextPath }/challengePop";
	
	window.open(url, "hello popup", windowStatus);
}
</script>
</head>
<!-- <body onload="user_check()"> -->
<body>
	<!-- header -->
	<c:import url="../main/header.jsp"/>
	
	<section>
     <form>
        <div class="search">
<!--           <span id="keySearch">검색어로 검색</span> -->
          <div id="searchForm">
          <input list="challengeSelect" name="levelS" id="levelS" />
          <datalist id="challengeSelect" style="width: 50px">
            <option value="레벨 1" label="편의점"></option>
            <option value="레벨 2" label="학생 식당, 구내 식당"></option>
            <option value="레벨 3" label="패스트푸드점"></option>
            <option value="레벨 4" label="분식집"></option>
            <option value="레벨 5" label="일반 음식점"></option>
            <option value="레벨 6" label="맛집"></option>
            <option value="레벨 7" label="패밀리레스토랑"></option>
            <option value="레벨 8" label="고기집, 횟집"></option>
            <option value="레벨 9" label="술집"></option>
          </datalist>
	          <input type="text" class="searchKey" placeholder="검색어를 입력하세요." />
    	      <input type="submit" value="검색" name="search" />
          </div>
    	      <br>
	    	<a href="javascript:showPopUp()" id="levelGuide">혼밥 레벨?</a>
        </div>
      </form>
	</section>
    
    <main>
<!--       <span>검색 결과</span> -->
    <c:if test="${challengeList.size() == 0 }">
		<h1>등록된 글이 없습니다.</h1>
	</c:if>
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
		
		<%-- <c:set var="no" value="${allCount - ((currentPage - 1) * 8)}" /> --%>
		<c:forEach var="dto" items="${challengeList }" varStatus="status">
			<div class="content_wrap">
	        <ul class="index">
	          <li class="writeNo">
	            <span>${allCount - ((currentPage-1) * pageLetter + status.index)}</span>
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
		<%-- <c:set var="no" value="${no -1 }"></c:set> --%>
	
		<div id="writebtn">
			<a href="${contextPath }/challengeWriteForm">글 쓰기</a>
		</div>
		<div class="paging">
			<c:forEach var="num" begin="1" end="${repeat }">
				<a href="challengeAllList?num=${num}">${num}</a>
			</c:forEach>
		</div>
    </main>

	<!-- footer -->
	<c:import url="../main/footer.jsp"/>

</body>
</html>