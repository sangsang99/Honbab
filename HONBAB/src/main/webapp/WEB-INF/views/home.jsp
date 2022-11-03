<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>write form</title>

<script src="${pageContext.request.contextPath}/resources/js/jquery-2.1.3.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.easing.1.3.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.parallax-scroll.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/p5.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/sketch.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/imgSequence?ver=1.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/writeForm.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/writeForm.css?ver=1" rel="stylesheet"/> 
  
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$.getScript( './resources/js/imgSequence.js');
</script>
  </head>
  
      <body>
        <!--    출처:https://www.youtube.com/watch?v=b9EEKpj7U6k    -->
        <div class="container" >
            <section class="sequence" >
                <div class="img-sequence" data-parallax='{"y":1250,  "from-scroll":0, "distance":1250, "smoothness":0}'>
                    <canvas width="1024" height="768" class="screen" id="screen"></canvas>
                </div>
            </section>

            <section class="sequence">
                <p class="titlehonbab">HONBAB</p>
            </section>
            
            <section class="sequence">
            </section>
            <!-- 여기까지 -->
            <section class="sequence">
                 <!-- 로그인 / 회원가입 묻는 창 -->
                <div class="login_join_view">
                    <header>&nbsp;</header>
                    <div class="login_join">
                    <a id="login">LOGIN</a>
                    <a id="join" style="cursor: pointer" class="scoll-down2">JOIN</a>
                    </div>
                    <!-- <div class="down_img">
                    <a style="cursor: pointer" class="btn scoll-down">JOIN</a>
                    <img src="./img/자산 2xxxhdpi.svg" />
                    </div> -->
                </div>
            </section>
            <section class="sequence">
                <!-- 회원가입 페이지 -->
                <div class="join_view">
                    <aside>
                    <div class="aside_wrap">
                        <div class="text">
                        <span>혼자서도 잘 먹어요</span>
                        <div>혼자서도 잘 먹고 잘 사는 나만을 위한 행복을 찾는</div>
                        <div>
                            Lorem, ipsum dolor sit amet consectetur adipisicing elit. <br />
                            Voluptatum, maiores deleniti reiciendis, <br />
                            at suscipit dolorum, adipisci nam mollitia totam impedit maxime. <br />
                            Dolorum quaerat nobis doloribus perferendis nisi, ipsum aut ducimus?
                        </div>
                        </div>
                    </div>
                    <div class="honbab">
                        <span>HONBAB</span>
                    </div>
                    </aside>
            
                    <main>
                    <div class="join_form_wrap">
                        <form class="join_form">
                        <ul>
                            <li>
                            <span>Id*</span>
                            <input type="text" placeholder="아이디를 입력하세요." />
                            </li>
                            <hr />
                            <div class="line"></div>
                            <li>
                            <span>Password*</span>
                            <input type="password" placeholder="비밀번호를 입력하세요." />
                            </li>
                            <hr />
                            <div class="line"></div>
                            <li>
                            <span>Password*</span>
                            <input type="password" placeholder="비밀번호를 재입력하세요." />
                            </li>
                            <hr />
                            <div class="line"></div>
                            <li>
                            <span>Name*</span>
                            <input type="text" placeholder="이름을 입력하세요." />
                            </li>
                            <hr />
                            <div class="line"></div>
                            <li>
                            <span>NickName*</span>
                            <input type="text" placeholder="별칭? 별명? 뭐든 입력하세요." />
                            </li>
                            <hr />
                            <div class="line"></div>
                            <li>
                            <span>Tel*</span>
                            <input type="tel" placeholder="전화번호를 입력하세요." />
                            </li>
                            <hr />
                            <div class="line"></div>
                            <li>
                            <span>Region*</span>
                            <input type="text" placeholder="거주 지역을 선택해주세요." />
                            </li>
                            <hr />
                            <div class="line"></div>
                            <li>
                            <span>Gender*</span>
                            <input type="text" placeholder="성별을 선택해주세요." />
                            </li>
                            <hr />
                            <div class="line"></div>
                            <li>
                            <span>Email*</span>
                            <input type="email" placeholder="이메일 주소를 입력해주세요." />
                            </li>
                            <hr />
                            <div class="line"></div>
                        </ul>
                        <input type="submit" value="Join" />
                        </form>
                    </div>
                    </main>
                </div>
            </section>
            <section class="sequence">
                <!-- 사장님 회원가입 이메일 제출 -->
                <div class="biz_join_view">
                    <div class="biz_join_form">
                    <ul>
                        <li>
                        <span>사장님이신가요?</span>
                        </li>
                        <li>
                        <input type="text" placeholder="회원가입문의 이메일 제출" />
                        </li>
                        <li>
                        <input type="text" value="제출" />
                        </li>
                    </ul>
                    </div>
                </div>
                <footer>footer 임</footer>
            </section>

            
            
        </div>

        
        
        <!--    javascript    -->
        <script src="script/jquery-2.1.3.min.js"></script>
        <script src="script/jquery.easing.1.3.js"></script>
        <script src="script/jquery.parallax-scroll.js"></script>
        <script src="script/p5.min.js"></script>
        <script src="script/sketch.js"></script>
        <script src="script/imgSequence.js"></script>
    </body>
</html>