<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/register.jsp</title>
<!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com"  />
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&family=Nunito+Sans:wght@400;600;700&display=swap"
	rel="stylesheet" />
	
<!-- CSS -->
<link href="${pageContext.request.contextPath}/resources/css/home.css?ver=4" rel="stylesheet"/> 

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<!-- js -->
<script type="text/javascript">
$.getScript( '../resources/js/modify.js');

function readURL(input) {
	var file = input.files[0]; // 파일 정보
	if (file != "") {
		var reader = new FileReader();
		reader.readAsDataURL(file); // 파일 정보 읽어오기
		reader.onload = function(e) {// 읽기에 성공하면 결과 표시
			$("#preview").attr("src", e.target.result)
		}
	}
}
</script>

<!-- 주소 API START-->
<script type="text/javascript"> 
	function goPopup(){
		var pop = window.open("../juso/jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 0
	}
	
	function jusoCallBack(roadFullAddr, roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
			document.querySelector('input[name=addr]').value = roadFullAddr;
	}
</script> <!-- 주소 END -->

<style type="text/css">
body>.join_form_wrap {
	width: 650px;
	margin: 0 auto;
	margin-top: 50px;
}
</style> 
</head>
<body>
	<c:import url="../main/header.jsp"/>
	
	<div class="join_form_wrap modi_form_wrap">
		<h1 align="center">회원정보 수정</h1>
		<form class="join_form modi_form" id="biz_modify_frm" action="${contextPath }/member/bizModifySave" enctype="multipart/form-data" method="post">
			<ul>
				<li>
					<span class="index">아이디</span>
					<input type="text" id="biz_id" name="id" value="${info.id }" readonly>
				</li>
				<li>
					<span class="index">비밀번호</span>
					<input type="password" id="biz_pw" name="pw">
				</li>
				<li>
					<span class="index">비밀번호 확인</span>
					<input type="password" id="biz_repw" name="repw">
				</li>
				<li>
					<span class="index">상호명</span>
						<input type="text" id="biz_name" name="name" value="${info.name }"> 
				</li>
				<li>
					<span class="index">사업자명</span>
					<input type="text" id="biz_comName" name="comName" value="${info.comName }" readonly>
				</li>
				<li>
					<span class="index">연락처(사업자용)</span>
					<input type="tel" id="biz_tel" name="tel" value="${info.tel }">
				</li>
				<li>
					<span class="index">연락처(고객용)</span>
					<input type="tel" id="biz_num" name="biznum" value="${info.biznum }">
				</li>
				<li class="callBackDiv">
					<span class="index">식당위치</span>
					<input type="text" id="roadFullText" name="addr" width="400px" value="${info.addr }">
					<input type="button" id="FullAddrBtn" width="100px" onClick="goPopup();" value="주소검색"/>				
				</li>
				<li>
					<span class="index">이메일</span>
					<input type="text" id="biz_email" name="email" placeholder="이메일을 입력하세요." value="${info.email }">
				</li>
				<li>				
					<span class="index">사업자 등록증</span>			 	
					<c:if test="${info.bizFile == 'None'}">
						<span class="index_kr">첨부된 파일 없음</span>
					</c:if>					
					<c:if test="${info.bizFile != 'None'}">
						<img
							src="${contextPath }/member/download?imageFileName=${info.bizFile}"
							id="preview" width="100px" height="50px" style="position:static; float:right ;" />
					</c:if>	
					<input id="modyImage" type="file" name="image_file_name" onchange="readURL(this)"  width="400px">
					<input type="hidden" name="originFileName" value="${info.bizFile}"> <!-- 기존파일삭제시 -->					
				</li>
			</ul>
			<button type="button" name="modify" onclick="biz_modi_form_check(); return false;"> EDIT</button>
		</form>
	</div>
	
	<c:import url="../main/footer.jsp"/>
</body>
</html>