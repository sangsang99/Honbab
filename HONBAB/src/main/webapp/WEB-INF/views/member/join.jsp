<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/join.jsp</title>
<!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com"  />
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&family=Nunito+Sans:wght@400;600;700&display=swap"
	rel="stylesheet" />
	
<!-- CSS Core -->
<link href="${pageContext.request.contextPath}/resources/css/home.css?ver=4" rel="stylesheet"/> 

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<!-- radio btn -->
<script type="text/javascript">
$.getScript( '../resources/js/join.js');

$(document).ready(function(){
	$('#biz_join_form_wrap').hide(); 
	$("input[name='btn_join']").change(function(){
		if($("input[name='btn_join']:checked").val() == '사업자회원'){
			$('#biz_join_form_wrap').show();
			$('#join_form_wrap').hide();
		}
		else if($("input[name='btn_join']:checked").val() == '일반회원'){
			$('#biz_join_form_wrap').hide();
			$('#join_form_wrap').show();
		}
	});
});
</script> <!-- radio btn end -->

<!-- 주소 API START-->
<script type="text/javascript"> 
	function goPopup(){
		var pop = window.open("../juso/jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 0
	}
	
	function jusoCallBack(roadFullAddr, roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
/* 			document.bizRegister.roadFullAddr.value = roadFullAddr; */
			document.querySelector('#roadFullText') = roadFullAddr;
	}
</script>

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script> <!-- 주소 API END-->

<script type="text/javascript">
<!-- File 미리보기 -->
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

<style type="text/css">
body>.join_form_wrap {
	width: 650px;
	margin: 0 auto;
	margin-top: 50px;
}

body>.biz_join_form_wrap {
	width: 650px;
	margin: 0 auto;
	margin-top: 50px;
}

li>#gender, #city{
	margin-left: 6rem;
	padding: 0;
	border: 0;
	font-size: 100%;
	vertical-align: baseline;
	list-style: none;
}


</style> 
</head>
<body>
	<!-- main -->
	<c:import url="../main/header.jsp"/>
	
	<div id="join_form_wrap" class="join_form_wrap">
		<h1 align="center">회원 가입</h1>
		<form class="join_form" id="join_form" action="${contextPath}/member/join" method="post">
			<ul>
				<li>
					<span class="index">아이디</span>
					<input type="text" id="id" name="id" placeholder="아이디를 입력하세요.">
			<!-- <button type="button" name="check" onclick="id_check(); return false;">중복확인</button> -->
				</li>
				<li>
					<span class="index">비밀번호</span>
					<input type="password" id="pw" name="pw" placeholder="비밀번호를 입력하세요.">
				</li>
				<li>
					<span class="index">비밀번호 확인</span>
					<input type="password" id="repw" name="repw" placeholder="비밀번호를 다시입력하세요.">
				</li>
				<li>
					<span class="index">이름</span>
					<input type="text" id="name" name="name" placeholder="이름을 입력하세요."> 
				</li>
				<li>
					<span class="index">닉네임</span>
					<input type="text" id="nickName" name="nickName" placeholder="닉네임을 입력하세요."><!-- 
					<button type="button" name="check" onclick="id_check(); return false;">중복확인</button> -->
				</li>
				<li>
					<span class="index">전화번호</span>
					<input type="tel" id="tel" name="tel" placeholder="숫자만 입력하세요.">
				</li>
				<li>
					<span class="index">거주지</span>
					<c:import url="../member/region.jsp"/>
				</li>
				<li>
					<span class="index">성별&nbsp;</span>
					<select id="gender" name="gender" size="1">
						<option value="">-선택하세요-</option>
						<option value="m">남자</option>
						<option value="f">여자</option>
					</select>
				</li>
				<li>
					<span class="index">이메일</span>
					<input type="text" id="email" name="email" placeholder="이메일을 입력하세요.">
				</li>
			</ul>
			<button type="button" name="join" onclick="joinform_check(); return false;"> JOIN</button>
		</form>
	</div>

	
	<!-- 사장님 회원가입 -->
	<div id="biz_join_form_wrap" class="join_form_wrap">
		<h1 align="center">사업자 회원 가입</h1>
		<form class="join_form" id="biz_join_form" action="${contextPath}/member/biz_join" enctype="multipart/form-data" method="post">
			<ul>
				<li>
					<span class="index">아이디</span>
					<input type="text" id="biz_id" name="id" placeholder="아이디를 입력하세요.">
				</li>
				<li>
					<span class="index">비밀번호</span>
					<input type="password" id="biz_pw" name="pw" placeholder="비밀번호를 입력하세요.">
				</li>
				<li>
					<span class="index">비밀번호 확인</span>
					<input type="password" id="biz_repw" name="repw" placeholder="비밀번호를 다시입력하세요.">
				</li>
				<li>
					<span class="index">상호명</span>
						<input type="text" id="biz_name" name="name" placeholder="고객에게 노출될 상호명을 입력하세요"> 
				</li>
				<li>
					<span class="index">사업자명</span>
					<input type="text" id="biz_comName" name="comName" placeholder="사업자 등록증 상의 기업명 입력하세요.">
				</li>
				<li>
					<span class="index">연락처(사업자용)</span>
					<input type="tel" id="biz_tel" name="tel" placeholder="사이트 관리자와 연락할 번호를 입력하세요.">
				</li>
				<li>
					<span class="index">연락처(고객용)</span>
					<input type="tel" id="biz_num" name="biznum" placeholder="고객에게 노출될 번호를 입력하세요.">
				</li>
				<li class="callBackDiv">
					<span class="index">식당위치</span>
					<input type="text" id="roadFullText" name="addr" width="400px">
					<input type="button" id="FullAddrBtn" width="100px" onClick="goPopup();" value="주소검색"/>				
				</li>
				<li>
					<span class="index">이메일</span>
					<input type="text" id="biz_email" name="email" placeholder="이메일을 입력하세요.">
				</li>
				<li class="upload_file">
					<span class="index_kr">사업자등록증</span> 
					<input type="file" name="image_file_name" onchange="readURL(this)">
					<img src="#" id="preview" width="100px" height="50px">
				</li>
			</ul>
			<button type="button" name="join" onclick="biz_joinform_check(); return false;"> Biz-JOIN</button>
		</form>	
	</div>
	
	<!-- radio btn -->
    <div class="btn-join">
      <label>
        <span class="mem">일반회원</span>
        <input type="radio" name="btn_join" value="일반회원" checked="checked"/>
      </label>
      <label>
        <span class="mem">사업자회원</span>
        <input type="radio" name="btn_join" value="사업자회원"/>
      </label>
    </div>
	
	<c:import url="../main/footer.jsp"/>

</body>
</html>