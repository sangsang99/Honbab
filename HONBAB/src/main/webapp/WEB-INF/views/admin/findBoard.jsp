<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ taglib prefix="fmt" uri= "http://java.sun.com/jsp/jstl/fmt" %> --%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동형</title>
<!-- <script src="http://code.jquery.com/jquery-1.6.4.min.js"></script> -->
<script type="text/javascript">
	function findWrite() {
		if(true){ 
			location.href="findWriteForm";			
		}
	}
	
	function upViews(writeNo){
		location.href="upViews?writeNo=" + writeNo;
	}
	
	 $(function(){
		var chkObj = document.getElementsByName("RowCheck");
		var rowCnt = chkObj.length;
		
		$("input[name='allCheck']").click(function(){
			var chk_listArr = $("input[name='RowCheck']");
			for(var i=0; i<chk_listArr.length; i++){
				chk_listArr[i].checked = this.checked;
			}
		});
		$("input[name='RowCheck']").click(function(){
			if($("input[name='RowCheck']:checked").length == rowCnt){
				$("input[name='allCheck']")[0].checked = true;
			}
			else{
 				$("input[name='allCheck']")[0].checked = false;
			}
		});
	});
	/*function deleteValue(){
		var url = "delete"; 	// Controller로 보내는 URL
		var valueArr = new Array();
		var list = $("input[name='RowCheck']");
		for(var i = 0; i < list.length; i++){
			if(list[i].checked){	//선택되어 있으면 배열에 값을 저장함
				valueArr.push(list[i].value);
			}
		}
		if(valueArr.length == 0){
			alert("선택된 글이 없습니다");
		}
		else{ 
			var chk = confirm("정말 삭제하시겠습니까?");
			$.ajax({
				url : url,				// 전송 URL
				type : 'POST',			// POST 방식(보내는 방식)
				traditional : true,
				date : { 
					valueArr : valueArr	// 보내고자 하는 data 변수 설정
				},
				success: function(jdata){
					if(jdata = 1){
						if(jdata = 1){
							alert("삭제 성공");
							location.replace("findBoard")	// findBoard로 페이지 새로고침
						}
						else{
							alert("삭제 실패");
						}
					}
			});
		}
	} */
	
</script>
</head>
<body>
	<table border="1">
		
		<tr>
		 	<!-- <th scope="col"><input id="allCheck" type="checkbox" name="allCheck"/></th> -->
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
		</table>
			
		<!-- <input type="button" value="삭제" class="btn btn-outline-info" onclick="deleteValue();"> -->
	<c:if test="${startPage > block }">
		<a href="findBoard?num=${startPage-1}" id="paging">◀</a>
	</c:if>
	<c:forEach var = "num" begin="${startPage}" end="${endPage }">
		<a href="findBoard?num=${num }">[${num }]</a>
	</c:forEach>
	<c:if test="${endPage < repeat}">
		<a href="findBoard?num=${endPage + 1}" id="paging">▶</a>
	</c:if>

	<c:import url="../main/footer.jsp"/>
</body>
</html>