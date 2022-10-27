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

function upViews(uWriteNo){
	location.href="upView?uWriteNo=" + uWriteNo;
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
<title>혼밥 레벨</title>
    <style>
      * {
        margin: 0;
        padding: 0;
        list-style: none;
      }
      header,
      footer {
        background-color: beige;
        width: 100%;
        height: 100px;
      }
      footer {
        position: absolute;
        bottom: 0;
      }
      
      ul {
      display: flex;
      }
      
      ul li {
      margin:  0 50px;
      padding: 10px;
			text-align: center;
      }
      .index {
      width: 50px;}
      .title {
      width: 150px;
      }
      
      .list_t{
      font-weight: bold;
      font-size: 18px;
      }
    </style>
</head>
<!-- <body onload="user_check()"> -->
<body>
    <header>header</header>
    <h2>도전 혼밥</h2>
    <a href="javascript:showPopUp()">혼밥 레벨?</a>
    <form>
      <span>검색어로 검색</span>
      <input list="challengeSelect" name="levelS" id="levelS"/>
      <datalist id="challengeSelect">
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
      <input type="text" placeholder="검색어를 입력하세요." />
      <input type="submit" value="검색" name="keyword"/>
    </form>
    <br />
    <div class="list">
      <span>검색 결과</span>
      <hr />
      <br />
      <c:if test="${challengeList.size() == 0 }">
					<h1>등록된 글이 없습니다.</h1>
			</c:if>
			<ul class="list_t">
				<li class="index"><span> No. </span></li>
				<li class="lv"><span> 레벨 </span></li>
				<li class="title"><span>제목</span></li>
				<li class="writer"><span>작성자</span></li>
				<li class="view"><span> 조회수 </span></li>
				<li class="date"><time> 작성일자 </time></li>
			</ul>
 
			<c:forEach var="dto" items="${challengeList }">
      <ul class="list_c">
        <li class="index"><span>${dto.uWriteNo }</span></li>
				<li class="lv"><span>레벨 ${dto.uLevel }</span></li>
				<li class="title"><a onclick="upView(${dto.uWriteNo}); return false" href="${contextPath }/challengeView?uWriteNo=${dto.uWriteNo }">${dto.uTitle }</a></li>
				<li class="writer"><span>${dto.uWriter }</span></li>
				<li class="view"><span>${dto.uViews }</span></li>
				<li class="date"><span>${dto.uSaveDate }</span></li>
      </ul>
			</c:forEach>
    </div>
		<a href="${contextPath }/challengeWriteForm">글 쓰기</a>
		<br>
		
		<div>
			
			<c:forEach var="num" begin="1" end="${repeat }">
				<a href="challengeAllList?num=${num}">${num}</a>
			</c:forEach>

		</div>
		
		
    <!-- <footer></footer> -->

</body>
</html>