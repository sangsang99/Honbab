<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
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
    <div class="main">
      <div class="best_wrap">
        <div class="head">도전 혼밥 레벨 : <span class="eng_title">HONBAB LEVEL CHALLENGE</span></div>
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
 
					<c:forEach var="best" items="${challengeBestList }" >        
	          <form>
	            <ul class="index">
	              <li class="no">${best.writeNo}</li>
	              <li class="title"><a href="${contextPath }/challengeView?writeNo=${best.writeNo }">${best.title}</a></li>
	              <li class="writer">${best.nickName}</li>
	              <li class="date">${best.saveDate}</li>
	              <li class="view">${best.views}</li>
	            </ul>
	          </form>
					</c:forEach>
				
          <div class="more"><a href="${contextPath }/challengeAllList">+ MORE</a></div>
        </section>
      </div>
    </div>
</body>
</html>