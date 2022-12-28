<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head>
<title>Main</title>
<!-- index CSS -->
	<link
	href="${pageContext.request.contextPath}/resources/css/main.css?ver=4.4"
	rel="stylesheet" />
	
<!-- font -->
	<link rel="preconnect" href="https://fonts.googleapis.com" />
	<link rel="preconnect" href="https://fonts.gstatic.com"  />
	<link
	href="https://fonts.googleapis.com/css2?family=Kumbh+Sans:wght@300;400;500;600;700&family=Noto+Sans+KR:wght@300;400;500;700&family=Nunito+Sans:wght@400;600;700&family=Ramabhadra&display=swap"
	rel="stylesheet" />
	
<!-- bootstrap -->
	<!-- SameSite -->
	<script type="text/javascript">
	document.cookie = "safeCookie1=foo; SameSite=Lax"; 
	document.cookie = "safeCookie2=foo";  
	document.cookie = "crossCookie=bar; SameSite=None; Secure";
	</script>
	
    <!-- Set <meta charset="utf-8" /> -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Agency - Start Bootstrap Theme</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="${contextPath }/resources/assets/favicon.ico" />
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="${contextPath }/resources/css/styles_bootstrap.css" rel="stylesheet" />

</head>
<body>
	<!-- header -->
	<c:import url="main/header.jsp" />

	<!-- main -->
	<main>
	<!-- <div class="main_wrap"> -->
		<!-- Portfolio Grid-->
	    <section class="page-section bg-light" id="portfolio">
	        <div class="container">
	            <div class="text-center">
	                <h2 class="section-heading text-uppercase">EAT ALONE</h2>
	                <h3 class="section-subheading text-muted">Lorem ipsum dolor sit amet consectetur.</h3>
	            </div>
	            <div class="row">
	                <div class="col-lg-4 col-sm-6 mb-4">
	                    <!-- Portfolio item 1-->
	                    <div class="portfolio-item">
	                        <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal1">
	                            <div class="portfolio-hover">
	                                <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
	                            </div>
	                            <img class="img-fluid" src="${contextPath }/resources/assets/img/portfolio/1.jpg" alt="..." />
	                        </a>
	                        <div class="portfolio-caption">
	                            <div class="portfolio-caption-heading">Threads</div>
	                            <div class="portfolio-caption-subheading text-muted">Illustration</div>
	                        </div>
	                    </div>
	                </div>
	                <div class="col-lg-4 col-sm-6 mb-4">
	                    <!-- Portfolio item 2-->
	                    <div class="portfolio-item">
	                        <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal2">
	                            <div class="portfolio-hover">
	                                <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
	                            </div>
	                            <img class="img-fluid" src="${contextPath }/resources/assets/img/portfolio/2.jpg" alt="..." />
	                        </a>
	                        <div class="portfolio-caption">
	                            <div class="portfolio-caption-heading">Explore</div>
	                            <div class="portfolio-caption-subheading text-muted">Graphic Design</div>
	                        </div>
	                    </div>
	                </div>
	                <div class="col-lg-4 col-sm-6 mb-4">
	                    <!-- Portfolio item 3-->
	                    <div class="portfolio-item">
	                        <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal3">
	                            <div class="portfolio-hover">
	                                <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
	                            </div>
	                            <img class="img-fluid" src="${contextPath }/resources/assets/img/portfolio/3.jpg" alt="..." />
	                        </a>
	                        <div class="portfolio-caption">
	                            <div class="portfolio-caption-heading">Finish</div>
	                            <div class="portfolio-caption-subheading text-muted">Identity</div>
	                        </div>
	                    </div>
	                </div>
	                <div class="col-lg-4 col-sm-6 mb-4 mb-lg-0">
	                    <!-- Portfolio item 4-->
	                    <div class="portfolio-item">
	                        <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal4">
	                            <div class="portfolio-hover">
	                                <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
	                            </div>
	                            <img class="img-fluid" src="${contextPath }/resources/assets/img/portfolio/4.jpg" alt="..." />
	                        </a>
	                        <div class="portfolio-caption">
	                            <div class="portfolio-caption-heading">Lines</div>
	                            <div class="portfolio-caption-subheading text-muted">Branding</div>
	                        </div>
	                    </div>
	                </div>
	                <div class="col-lg-4 col-sm-6 mb-4 mb-sm-0">
	                    <!-- Portfolio item 5-->
	                    <div class="portfolio-item">
	                        <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal5">
	                            <div class="portfolio-hover">
	                                <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
	                            </div>
	                            <img class="img-fluid" src="${contextPath }/resources/assets/img/portfolio/5.jpg" alt="..." />
	                        </a>
	                        <div class="portfolio-caption">
	                            <div class="portfolio-caption-heading">Southwest</div>
	                            <div class="portfolio-caption-subheading text-muted">Website Design</div>
	                        </div>
	                    </div>
	                </div>
	                <div class="col-lg-4 col-sm-6">
	                    <!-- Portfolio item 6-->
	                    <div class="portfolio-item">
	                        <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal6">
	                            <div class="portfolio-hover">
	                                <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
	                            </div>
	                            <img class="img-fluid" src="${contextPath }/resources/assets/img/portfolio/6.jpg" alt="..." />
	                        </a>
	                        <div class="portfolio-caption">
	                            <div class="portfolio-caption-heading">Window</div>
	                            <div class="portfolio-caption-subheading text-muted">Photography</div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </section>
			<%-- <img
				src="${pageContext.request.contextPath}/resources/img/2수정1_Yz2wxmK0Cf3MBZR7lgkfg.jpg"
				width="1200px" /> --%>
	<!-- </div> -->
	</main>
	
	
	
	<article>
		<!-- find best -->
		<div class="article_wrap">
			<c:import url="find/findBest.jsp" />
		</div>


		<!-- challenge best -->
		<div class="article_wrap">
			<c:import url="challenge/challengeBest.jsp" />
		</div>


		<!-- review best -->
		<div class="article_wrap">
			<c:import url="review/reviewBest.jsp" />
		</div>
	</article>
	
	<!-- Footer-->
    <footer class="footer py-4">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-4 text-lg-start">Copyright &copy; HONBAB 2022</div>
                <div class="col-lg-4 my-3 my-lg-0">
                    <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="Twitter"><i class="fab fa-twitter"></i></a>
                    <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="Facebook"><i class="fab fa-facebook-f"></i></a>
                    <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="LinkedIn"><i class="fab fa-linkedin-in"></i></a>
                </div>
                <div class="col-lg-4 text-lg-end">
                    <a class="link-dark text-decoration-none me-3" href="#!">Privacy Policy</a>
                    <a class="link-dark text-decoration-none" href="#!">Terms of Use</a>
                </div>
            </div>
        </div>
    </footer>

    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="${contextPath }/resources/js/scripts_bootstrap.js"></script>
    <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
    <!-- * *                               SB Forms JS                               * *-->
    <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
    <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
    <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>

</body>
</html>
