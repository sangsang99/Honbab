<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>challengeBest</title>
<link
	href="${pageContext.request.contextPath}/resources/css/best.css?ver=4"
	rel="stylesheet" />
<!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Kumbh+Sans:wght@300;400;500;600;700&family=Noto+Sans+KR:wght@300;400;500;700&family=Nunito+Sans:wght@400;600;700&family=Ramabhadra&display=swap" rel="stylesheet">
</head>
<body>
    <main>
      <div class="best_wrap">
        <header>LEVEL CHALLENGE</header>
        <aside>
          <div class="line"></div>
          <div class="text">Best Challenge</div>
        </aside>

        <section>
          <ul class="index" id="first">
            <li class="no">NO</li>
            <li class="title">TITLE</li>
            <li class="writer">WRITER</li>
            <li class="date">DATE</li>
            <li class="view">VIEWS</li>
          </ul>
          <form>
            <ul class="index">
              <li class="no">no</li>
              <li class="title">제목</li>
              <li class="writer">작성자</li>
              <li class="date">날짜</li>
              <li class="view">조회수</li>
            </ul>
          </form>
          <div class="more"><a href="challengeAllList">+ MORE</a></div>
        </section>
      </div>
    </main>
</body>
</html>