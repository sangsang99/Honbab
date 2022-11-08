<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/login.jsp</title>
<link href="${contextPath}/resources/css/login.css?ver=4.4" rel="stylesheet" />
<!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Kumbh+Sans:wght@300;400;500;600;700&family=Noto+Sans+KR:wght@300;400;500;700&family=Nunito+Sans:wght@400;600;700&family=Ramabhadra&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript">
$(document).ready(function(){
		$('#business').hide(); 
		$('#admin').hide();
		$("input[name='chk_join']").change(function(){
			if($("input[name='chk_join']:checked").val() == '개인회원'){
				$('#business').hide();
				$('#admin').hide();
				$('#personal').show();
			}
			else if($("input[name='chk_join']:checked").val() == '사업자회원'){
				$('#personal').hide();
				$('#admin').hide();
				$('#business').show();
			}
			else if($("input[name='chk_join']:checked").val() == '관리자'){
				$('#personal').hide();
				$('#admin').show();
				$('#business').hide();
			}
		});
});
</script>
</head> 
<body>
	<c:import url="../main/header.jsp"/>
	
    <aside>
      <div class="aside_wrap">
        <div class="text">
          <span>안녕하시렵니까</span>
          <div>혼자 밥 먹기</div>
          <div>
            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Soluta, est! <br />
            Quos voluptatum sunt dolorem unde! Voluptatem pariatur cupiditate minima quidem voluptatum facilis aliquid,
            dignissimos, ab in illo nemo, molestiae tempore.
          </div>
        </div>
        <div class="honbab">
          <span>HONBAB</span>	
        </div>
      </div>
    </aside>
	
    <main>
      <div class="btn">
        <label>
          <span class="mem">개인회원</span>
          <input type="radio" name="chk_join" value="개인회원" checked="checked" />
        </label>
        <label>
          <span class="mem">사업자회원</span>
          <input type="radio" name="chk_join" value="사업자회원" />
        </label>
        <label>
          <span class="mem">관리자</span>
          <input type="radio" name="chk_join" value="관리자" />
        </label>
      </div>

      <div id="personal">
        <form class="login_form" action="${contextPath }/member/user_check" method="post" autocomplete="off">
          <ul>
            <li>
              <span class="index_en">Id</span>
              <input type="text" name="id" placeholder="아이디 입력" />
            </li>
            <hr />
            <div class="line"></div>
            <li>
              <span class="index_en">Password</span>
              <input type="password" name="pw" placeholder="비밀번호 입력" />
            </li>
            <hr />
            <div class="line"></div>
          </ul>
          <input type="submit" value="Login" />
        </form>
        <!-- <c:import url="../member/naver.jsp" /> -->
      </div>

      <div id="business">
        <form class="login_form" action="${contextPath }/member/bizuser_check" method="post">
          <ul>
            <li>
              <span class="index_en">Id</span>
              <input type="text" name="id" placeholder="사업자 아이디 입력" />
            </li>
            <hr />
            <div class="line"></div>
            <li>
              <span class="index_en">Password</span>
              <input type="password" name="pw" placeholder="사업자 비밀번호 입력" />
            </li>
            <hr />
            <div class="line"></div>
          </ul>
          <input type="submit" value="login" />
        </form>
      </div>

      <div id="admin">
        <form class="login_form" action="${contextPath }/member/adminUserCheck" method="post">
          <ul>
            <li>
              <span class="index_en">Id</span>
              <input type="text" name="id" placeholder="관리자 아이디 입력" />
            </li>
            <hr />
            <div class="line"></div>
            <li>
              <span class="index_en">Password</span>
              <input type="password" name="pw" placeholder="관리자 비밀번호 입력" />
            </li>
            <hr />
            <div class="line"></div>
          </ul>
          <input type="submit" value="login" />
        </form>
      </div>
    </main>
    
    
     <div class="innerfooter">
		<c:import url="../main/footer.jsp" />
	</div>
	

</body>
</html>