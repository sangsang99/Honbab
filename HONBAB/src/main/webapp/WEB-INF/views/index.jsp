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
	                            <c:if test="${promoListAD[0].imageFileName == 'nan' || promoListAD[0] == null}">
                                	<img class="img-fluid" src="${contextPath }/resources/img/none.png" alt="..." /></c:if>
								<c:if test="${promoListAD[0].imageFileName != 'nan' && promoListAD[0] != null}">
	                            	<img class="img-fluid" src="${contextPath }/promotion/download?imageFileName=${promoListAD[0].imageFileName}"/></c:if>
	                        </a>
	                        <div class="portfolio-caption">
	                            <div class="portfolio-caption-heading">
	                            	<c:if test="${promoListAD[0]==none}">NONE</c:if>
	                            	<c:if test="${promoListAD[0]!=none}">${promoListAD[1].title }</c:if>                        	
	                            	</div>
	                            <div class="portfolio-caption-subheading text-muted">
	                           		<c:if test="${promoListAD[0]==none}">NONE</c:if>
	                            	<c:if test="${promoListAD[0]!=none}">${promoListAD[1].content }</c:if> 
	                            </div>
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
	                            <c:if test="${promoListAD[1].imageFileName == 'nan' || promoListAD[1] == null}">
                                	<img class="img-fluid" src="${contextPath }/resources/img/none.png" alt="..." /></c:if>
								<c:if test="${promoListAD[1].imageFileName != 'nan' && promoListAD[1] != null}">
	                            	<img class="img-fluid" src="${contextPath }/promotion/download?imageFileName=${promoListAD[1].imageFileName}"/></c:if>
	                        </a>
	                        <div class="portfolio-caption">
	                            <div class="portfolio-caption-heading">
	                            	<c:if test="${promoListAD[1]==none}">NONE</c:if>
	                            	<c:if test="${promoListAD[1]!=none}">${promoListAD[1].title }</c:if>                        	
	                            	</div>
	                            <div class="portfolio-caption-subheading text-muted">
	                           		<c:if test="${promoListAD[1]==none}">NONE</c:if>
	                            	<c:if test="${promoListAD[1]!=none}">${promoListAD[1].content }</c:if> 
	                            </div>
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
	                            <c:if test="${promoListAD[2].imageFileName == 'nan' || promoListAD[2] == null}">
                                	<img class="img-fluid" src="${contextPath }/resources/img/none.png" alt="..." /></c:if>
								<c:if test="${promoListAD[2].imageFileName != 'nan' && promoListAD[2] != null}">
	                            	<img class="img-fluid" src="${contextPath }/promotion/download?imageFileName=${promoListAD[2].imageFileName}"/></c:if>
	                        </a>
	                        <div class="portfolio-caption">
	                            <div class="portfolio-caption-heading">
		                            <c:if test="${promoListAD[2]==none}">NONE</c:if>
	                            	<c:if test="${promoListAD[2]!=none}">${promoListAD[2].title }</c:if> 
	                            </div>
	                            <div class="portfolio-caption-subheading text-muted">
									<c:if test="${promoListAD[2]==none}">NONE</c:if>
	                            	<c:if test="${promoListAD[2]!=none}">${promoListAD[2].content }</c:if> 
							</div>
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
	                            <c:if test="${promoListAD[3].imageFileName == 'nan' || promoListAD[3] == null}">
                                	<img class="img-fluid" src="${contextPath }/resources/img/none.png" alt="..." /></c:if>
								<c:if test="${promoListAD[3].imageFileName != 'nan' && promoListAD[3] != null}">
	                            	<img class="img-fluid" src="${contextPath }/promotion/download?imageFileName=${promoListAD[3].imageFileName}"/></c:if>
	                        </a>
	                        <div class="portfolio-caption">
	                            <div class="portfolio-caption-heading">
		                            <c:if test="${promoListAD[3]==none}">NONE</c:if>
		                           	<c:if test="${promoListAD[3]!=none}">${promoListAD[3].title }</c:if> 
	                            </div>
	                            <div class="portfolio-caption-subheading text-muted">
									<c:if test="${promoListAD[3]==none}">NONE</c:if>
	                            	<c:if test="${promoListAD[3]!=none}">${promoListAD[3].content }</c:if> 
								</div>
								<!-- 
								<c:if test="${promoListAD[3]==none}}">
		                        	<div class="portfolio-caption-heading">NONE</div>
		                        	<div class="portfolio-caption-subheading text-muted">NONE</div></c:if>
		                        <c:if test="${promoListAD[3]!=none}}">
		                        	<div class="portfolio-caption-heading">${promoListAD[3].title }</div>
		                        	<div class="portfolio-caption-subheading text-muted">${promoListAD[3].content }</div></c:if> -->
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
	                            <c:if test="${promoListAD[4].imageFileName == 'nan' || promoListAD[4] == null}">
                                	<img class="img-fluid" src="${contextPath }/resources/img/none.png" alt="..." /></c:if>
								<c:if test="${promoListAD[4].imageFileName != 'nan' && promoListAD[4] != null}">
	                            	<img class="img-fluid" src="${contextPath }/promotion/download?imageFileName=${promoListAD[4].imageFileName}"/></c:if>
	                        </a>
	                        <div class="portfolio-caption">
	                            <div class="portfolio-caption-heading">
	                            	<c:if test="${promoListAD[4]==none}">NONE</c:if>
		                           	<c:if test="${promoListAD[4]!=none}">${promoListAD[4].title }</c:if> 
		                        </div>
	                            <div class="portfolio-caption-subheading text-muted">
	                            	<c:if test="${promoListAD[4]==none}">NONE</c:if>
	                            	<c:if test="${promoListAD[4]!=none}">${promoListAD[4].content }</c:if> 
	                            </div>
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
	                            <c:if test="${promoListAD[5].imageFileName == 'nan' || promoListAD[5] == null}">
                                	<img class="img-fluid" src="${contextPath }/resources/img/none.png" alt="..." /></c:if>
								<c:if test="${promoListAD[5].imageFileName != 'nan' && promoListAD[5] != null}">
	                            	<img class="img-fluid" src="${contextPath }/promotion/download?imageFileName=${promoListAD[5].imageFileName}"/></c:if>
	                        </a>
	                        <div class="portfolio-caption">
	                            <div class="portfolio-caption-heading">
		                            <c:if test="${promoListAD[5]==none}">NONE</c:if>
		                           	<c:if test="${promoListAD[5]!=none}">${promoListAD[5].title }</c:if> 
	                            </div>
	                            <div class="portfolio-caption-subheading text-muted">
	                            	<c:if test="${promoListAD[5]==null}">NONE</c:if>
	                            	<c:if test="${promoListAD[5]!=none}">${promoListAD[5].content }</c:if>
								</div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </section>
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

    <!-- Portfolio Modals-->
    <!-- Portfolio item 1 modal popup-->
    <div class="portfolio-modal modal fade" id="portfolioModal1" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="close-modal" data-bs-dismiss="modal"><img src="${contextPath }/resources/assets/img/close-icon.svg" alt="Close modal" /></div>
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-8">
                            <div class="modal-body">
                                <!-- Project details-->
                                <h2 class="text-uppercase">Project Name</h2>
                                <p class="item-intro text-muted">Lorem ipsum dolor sit amet consectetur.</p>
                                <img class="img-fluid d-block mx-auto" src="${contextPath }/resources/assets/img/portfolio/1.jpg" alt="..." />
                                <p>Use this area to describe your project. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est blanditiis dolorem culpa incidunt minus dignissimos deserunt repellat aperiam quasi sunt officia expedita beatae cupiditate, maiores repudiandae, nostrum, reiciendis facere nemo!</p>
                                <ul class="list-inline">
                                    <li>
                                        <strong>Client:</strong>
                                        Threads
                                    </li>
                                    <li>
                                        <strong>Category:</strong>
                                        Illustration
                                    </li>
                                </ul>
                                <button class="btn btn-primary btn-xl text-uppercase" data-bs-dismiss="modal" type="button">
                                    <i class="fas fa-xmark me-1"></i>
                                    Close Project
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Portfolio item 2 modal popup-->
    <div class="portfolio-modal modal fade" id="portfolioModal2" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="close-modal" data-bs-dismiss="modal"><img src="${contextPath }/resources/assets/img/close-icon.svg" alt="Close modal" /></div>
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-8">
                            <div class="modal-body">
                                <!-- Project details-->
                                <h2 class="text-uppercase">Project Name</h2>
                                <p class="item-intro text-muted">Lorem ipsum dolor sit amet consectetur.</p>
                                <img class="img-fluid d-block mx-auto" src="${contextPath }/resources/assets/img/portfolio/2.jpg" alt="..." />
                                <p>Use this area to describe your project. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est blanditiis dolorem culpa incidunt minus dignissimos deserunt repellat aperiam quasi sunt officia expedita beatae cupiditate, maiores repudiandae, nostrum, reiciendis facere nemo!</p>
                                <ul class="list-inline">
                                    <li>
                                        <strong>Client:</strong>
                                        Explore
                                    </li>
                                    <li>
                                        <strong>Category:</strong>
                                        Graphic Design
                                    </li>
                                </ul>
                                <button class="btn btn-primary btn-xl text-uppercase" data-bs-dismiss="modal" type="button">
                                    <i class="fas fa-xmark me-1"></i>
                                    Close Project
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Portfolio item 3 modal popup-->
    <div class="portfolio-modal modal fade" id="portfolioModal3" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="close-modal" data-bs-dismiss="modal"><img src="${contextPath }/resources/assets/img/close-icon.svg" alt="Close modal" /></div>
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-8">
                            <div class="modal-body">
                                <!-- Project details-->
                                <h2 class="text-uppercase">Project Name</h2>
                                <p class="item-intro text-muted">Lorem ipsum dolor sit amet consectetur.</p>
                                <img class="img-fluid d-block mx-auto" src="${contextPath }/resources/assets/img/portfolio/3.jpg" alt="..." />
                                <p>Use this area to describe your project. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est blanditiis dolorem culpa incidunt minus dignissimos deserunt repellat aperiam quasi sunt officia expedita beatae cupiditate, maiores repudiandae, nostrum, reiciendis facere nemo!</p>
                                <ul class="list-inline">
                                    <li>
                                        <strong>Client:</strong>
                                        Finish
                                    </li>
                                    <li>
                                        <strong>Category:</strong>
                                        Identity
                                    </li>
                                </ul>
                                <button class="btn btn-primary btn-xl text-uppercase" data-bs-dismiss="modal" type="button">
                                    <i class="fas fa-xmark me-1"></i>
                                    Close Project
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Portfolio item 4 modal popup-->
    <div class="portfolio-modal modal fade" id="portfolioModal4" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="close-modal" data-bs-dismiss="modal"><img src="${contextPath }/resources/assets/img/close-icon.svg" alt="Close modal" /></div>
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-8">
                            <div class="modal-body">
                                <!-- Project details-->
                                <h2 class="text-uppercase">Project Name</h2>
                                <p class="item-intro text-muted">Lorem ipsum dolor sit amet consectetur.</p>
                                <img class="img-fluid d-block mx-auto" src="${contextPath }/resources/assets/img/portfolio/4.jpg" alt="..." />
                                <p>Use this area to describe your project. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est blanditiis dolorem culpa incidunt minus dignissimos deserunt repellat aperiam quasi sunt officia expedita beatae cupiditate, maiores repudiandae, nostrum, reiciendis facere nemo!</p>
                                <ul class="list-inline">
                                    <li>
                                        <strong>Client:</strong>
                                        Lines
                                    </li>
                                    <li>
                                        <strong>Category:</strong>
                                        Branding
                                    </li>
                                </ul>
                                <button class="btn btn-primary btn-xl text-uppercase" data-bs-dismiss="modal" type="button">
                                    <i class="fas fa-xmark me-1"></i>
                                    Close Project
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Portfolio item 5 modal popup-->
    <div class="portfolio-modal modal fade" id="portfolioModal5" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="close-modal" data-bs-dismiss="modal"><img src="${contextPath }/resources/assets/img/close-icon.svg" alt="Close modal" /></div>
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-8">
                            <div class="modal-body">
                                <!-- Project details-->
                                <h2 class="text-uppercase">Project Name</h2>
                                <p class="item-intro text-muted">Lorem ipsum dolor sit amet consectetur.</p>
                                <img class="img-fluid d-block mx-auto" src="${contextPath }/resources/assets/img/portfolio/5.jpg" alt="..." />
                                <p>Use this area to describe your project. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est blanditiis dolorem culpa incidunt minus dignissimos deserunt repellat aperiam quasi sunt officia expedita beatae cupiditate, maiores repudiandae, nostrum, reiciendis facere nemo!</p>
                                <ul class="list-inline">
                                    <li>
                                        <strong>Client:</strong>
                                        Southwest
                                    </li>
                                    <li>
                                        <strong>Category:</strong>
                                        Website Design
                                    </li>
                                </ul>
                                <button class="btn btn-primary btn-xl text-uppercase" data-bs-dismiss="modal" type="button">
                                    <i class="fas fa-xmark me-1"></i>
                                    Close Project
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Portfolio item 6 modal popup-->
    <div class="portfolio-modal modal fade" id="portfolioModal6" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="close-modal" data-bs-dismiss="modal"><img src="${contextPath }/resources/assets/img/close-icon.svg" alt="Close modal" /></div>
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-8">
                            <div class="modal-body">
                                <!-- Project details-->
                                <h2 class="text-uppercase">Project Name</h2>
                                <p class="item-intro text-muted">Lorem ipsum dolor sit amet consectetur.</p>
                                <img class="img-fluid d-block mx-auto" src="${contextPath }/resources/assets/img/portfolio/6.jpg" alt="..." />
                                <p>Use this area to describe your project. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est blanditiis dolorem culpa incidunt minus dignissimos deserunt repellat aperiam quasi sunt officia expedita beatae cupiditate, maiores repudiandae, nostrum, reiciendis facere nemo!</p>
                                <ul class="list-inline">
                                    <li>
                                        <strong>Client:</strong>
                                        Window
                                    </li>
                                    <li>
                                        <strong>Category:</strong>
                                        Photography
                                    </li>
                                </ul>
                                <button class="btn btn-primary btn-xl text-uppercase" data-bs-dismiss="modal" type="button">
                                    <i class="fas fa-xmark me-1"></i>
                                    Close Project
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

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
