<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
<!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&family=Nunito+Sans:wght@400;600;700&display=swap"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/css/find/allList.css?ver=4"
	rel="stylesheet" />
<script type="text/javascript">
	function findWrite() {
		if(true){ 
			location.href="findWriteForm";			
		}
	}
	
	function upViews(writeNo){
		location.href="upViews?writeNo=" + writeNo;
	}
</script>
</head>
<body>
	<!-- header -->
	<c:import url="../main/header.jsp" />

	<section>
		<form action="${contextPath}/find/search" enctype="multipart/form-data" method="post">
			<div class="search">
				<select id="region" name="region">
					<option value="">거주지역</option>
					<option value="서울">서울</option>
					<option value="부산">부산</option>
					<option value="대구">대구</option>
					<option value="인천">인천</option>
					<option value="광주">광주</option>
					<option value="대전">대전</option>
					<option value="울산">울산</option>
					<option value="강원">강원</option>
					<option value="경기">경기</option>
					<option value="경남">경남</option>
					<option value="경북">경북</option>
					<option value="전남">전남</option>
					<option value="전북">전북</option>
					<option value="제주">제주</option>
					<option value="충남">충남</option>
					<option value="충북">충북</option>
				</select> 
				<select id="gender" name="gender">

					<option value="">성별</option>
					<option value="남성">남성</option>
					<option value="여성">여성</option>
				</select> <select id="age" name="age">
					<option value="10">나이대</option>
					<option value="20">20대 이하</option>
					<option value="30">30대</option>
					<option value="40">40대 이상</option>
				</select> 
				<input type="submit" value="검색하기">
			</div>
		</form>
	</section>
	<main>
	<div class="index_wrap">
		<ul class="index">
			<li class="writeNo"><span>NO</span></li>
			<li class="title"><span>TITLE</span></li>
			<li class="writer"><span>WRITER</span></li>
			<li class="age"><span>AGE</span></li>
			<li class="reg"><span>REGION</span></li>
			<li class="gender"><span>GENDER</span></li>
			<li class="date"><span>DATE</span></li>
			<li class="view"><span>VIEWS</span></li>
		</ul>
	</div>

	<!-- 	<table border="1"> -->
	<!-- 		<tr>
			<th> 글번호 </th>
			<th> 닉네임 </th>
			<th> 제 목 </th>
			<th> 나 이 </th>
			<th> 지 역 </th>
			<th> 성 별 </th>
			<th> 작성일 </th>
			<th> 조회수 </th>
		</tr> -->

		<c:if test="${findAllList.size() == 0}">
			<h1>등록된 글이 없습니다.</h1>
		</c:if>

		<c:forEach var="find" items="${findAllList }" varStatus="status">
			<div class="content_wrap">
				<ul class="index">
					<li class="writeNo"><span>${find.writeNo }</span></li>
					<li class="title">
						<a href="#" onclick="upViews(${find.writeNo}); return false">${find.title}</a>
					</li>
					<li class="writer"><span>${find.nickName }</span></li>
					<li class="age"><span>${find.age }</span></li>
					<li class="reg"><span>${find.region }</span></li>
					<li class="gender"><span>${find.gen }</span></li>
					<li class="date"><span>${find.writeDate }</span></li>
					<li class="view"><span>${find.views }</span></li>
				</ul>
			</div>
		</c:forEach>

		<%-- 		<c:forEach var="find" items="${findAllList}">
		<tr>
			<td>${find.writeNo }</td>
			<td>${find.nickName }</td>
			<td width="200px">
				<a href="#" onclick="upViews(${find.writeNo}); return false">${find.title}</a>
			</td>
			<td>${find.age }</td>
			<td>${find.region }</td>
			<td>${find.gen }</td>
			<td>${find.writeDate }</td>
			<td>${find.views }</td>
		</tr>	
		</c:forEach>
		</table> --%>
		<c:if test="${loginUser != null}">
		<div id="writebtn">
			<input type="button" value="글쓰기" onclick="findWrite()">
		</div>
		</c:if>
		
		<c:if test="${!isSearchPage}">
		<div class="paging">
			<c:if test="${startPage > block }">
				<a href="findAllList?num=${startPage-1}" id="paging">◀</a>
			</c:if>
			<c:forEach var="num" begin="${startPage}" end="${endPage }">
				<a href="findAllList?num=${num }">${num }</a>
			</c:forEach>
			<c:if test="${endPage < repeat}">
				<a href="findAllList?num=${endPage + 1}" id="paging">▶</a>
			</c:if>
		</div>
		</c:if>
		<c:if test="${isSearchPage}">
			<div class="paging">
				<c:if test="${startPage > block }">
					<a href="search?num=${startPage-1}" id="paging">◀</a>
				</c:if>
				<c:forEach var="num" begin="${startPage}" end="${endPage }">
					<a href="search?num=${num }">${num }</a>
				</c:forEach>
				<c:if test="${endPage < repeat}">
					<a href="search?num=${endPage + 1}" id="paging">▶</a>
				</c:if>
			</div>
		</c:if>
	</main>

	<!-- footer -->
	<c:import url="../main/footer.jsp" />
</body>
</html>