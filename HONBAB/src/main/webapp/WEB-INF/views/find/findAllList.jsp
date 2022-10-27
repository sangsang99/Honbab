<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
<script type="text/javascript">
	function findWrite() {
		if(true){ 
			location.href="findWriteForm";			
		}
	}
	
	function upViews(seq){
		location.href="upViews?uSeq=" + seq;
	}
</script>
</head>
<body>
	<c:import url="../main/header.jsp"/>

<select id="region" name="region">
		    		<option value="0">거주지역</option>
		    		<option value="1">서울</option>
		    		<option value="2">부산</option>
		    		<option value="3">대구</option>
		    		<option value="4">인천</option>
		    		<option value="5">광주</option>
		    		<option value="6">대전</option>
		    		<option value="7">울산</option>
		    		<option value="8">강원</option>
		    		<option value="9">경기</option>
		    		<option value="10">경남</option>
		    		<option value="11">경북</option>
		    		<option value="12">전남</option>
		    		<option value="13">전북</option>
		    		<option value="14">제주</option>
		    		<option value="15">충남</option>
		    		<option value="16">충북</option>
	</select>
	<select id="gender" name="gender">
		    		
		    			<option value="0">성별</option>
			    		<option value="1">남성</option>
			    		<option value="2">여성</option>		
	</select>
	
	<select id="Age" name="Age" >
		    		<option value="0" >나이대</option>
		    		<option value="1">10대 이하</option>
		    		<option value="1">10대</option>
		    		<option value="2">20대</option>
		    		<option value="3">30대</option>
		    		<option value="4">40대 그외</option>
		    	</select>
		    	<input type="button" value="검색하기"><br><br>
		    	
		    	<input type="button" value="글쓰기" onclick="findWrite()">
	<table border="1">
		<tr>
			<th> 글번호 </th>
			<th> 닉네임 </th>
			<th> 제 목 </th>
			<th> 나 이 </th>
			<th> 지 역 </th>
			<th> 성 별 </th>
			<th> 작성일 </th>
			<th> 조회수 </th>
		</tr>
		<c:if test="${findAllList.size() == 0}">
				<tr>
					<th colspan="8">작성된 글이 없습니다.</th>
				</tr>			
			</c:if>
		<c:forEach var="find" items="${findAllList}">
		<tr>
			<td>${find.uSeq }</td>
			<td>${find.uNickName }</td>
			<td width="200px">
				<a href="#" onclick="upViews(${find.uSeq}); return false">${find.uTitle}</a>
			</td>
			<td>${find.uAge }</td>
			<td>${find.uRegion }</td>
			<td>${find.uGen }</td>
			<td>${find.uDate }</td>
			<td>${find.uViews }</td>
		</tr>	
		</c:forEach>
		</table>

	<c:if test="${startPage > block }">
		<a href="findAllList?num=${startPage-1}" id="paging">◀</a>
	</c:if>
	<c:forEach var = "num" begin="${startPage}" end="${endPage }">
		<a href="findAllList?num=${num }">[${num }]</a>
	</c:forEach>
	<c:if test="${endPage < repeat}">
		<a href="findAllList?num=${endPage + 1}" id="paging">▶</a>
	</c:if>

	<c:import url="../main/footer.jsp"/>
</body>
</html>