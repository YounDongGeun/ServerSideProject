<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.Arrays"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService"%>
<%@page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Collection"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="net.sf.json.util.JSONBuilder"%>
<%@page import="net.sf.json.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!--
------------------------------------------------------------
* @설명 : 영화코드 조회 REST 호출 - 서버측에서 호출하는 방식 예제
------------------------------------------------------------
-->
<html>
<head>
	<meta name="author" content="Kodinger">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<title>영화 정보</title>
	<meta name="description" content="Login - Register Template">
    <meta name="author" content="Lorenzo Angelino aka MrLolok">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="main.css">
    <link rel="stylesheet" href="my-login.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
   
		 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  	<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
    <!-- css -->
    <link rel="stylesheet" href="assets/css/reset19.css">
    <link rel="stylesheet" href="assets/css/style19.css">
    <link rel="stylesheet" href="assets/css/swiper.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script type="text/javascript">


</script>
</head>
<body>

<header id="header">
        <div class="container">
            <div class="row">
                <div class="header clearfix">
                    <h1>
                        <a href="#">
                            <em><img src="assets/img/logo.png" alt="MEGABOX"></em>
                            <strong><img src="assets/img/logo-sub.png" alt="LIFE THEATER"></strong>
                        </a>    
                    </h1>
                    <nav id="mNav">
                        <h2 class="ir_so">이 영환 뭐조</h2>
                        <a href="#" class="ham"><span></span></a>
                    </nav>
                    <nav class="nav">
                        <ul class="clearfix">
                            <li><a href="sample1.jsp" method="post">영화정보</a></li>
                            <li><a href="DirectorInformation.jsp" method="post">감독정보</a></li>
                            <li><a href="ActorInformation.jsp" method="post">배우정보</a></li>
                            <li><a href="information.jsp" method="post">Company</a></li>
                            <li><a href="notice.jsp" method="post">공지사항</a></li>
                            <li><a href="login1.jsp" method="post">로그인</a></li>                                                 
                        </ul>                       
                    </nav>                      
                </div>                        
            </div>
            
        </div>
        
    </header>
    
    <section id="banner">
        <div class="banner_menu">
            <h2 class="ir_so">배너 영역</h2>
            
        </div>
        <div class="slider">
           <div class="swiper-container">
                <div class="swiper-wrapper">
                    <div class="swiper-slide ss1">
                        <div class="container">
                            <div class="row">
                                <h3>어벤져스 : 앤드게임</h3>
                                <p>역대 최단 기간 1000만 관객 돌파 기록 </p>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide ss2">
                        <div class="container">
                            <div class="row">
                                <h3>어벤져스 : 앤드게임</h3>
                                <p>역대 최단 기간 1000만 관객 돌파 기록 </p>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide ss3">
                        <div class="container">
                            <div class="row">
                                <h3>어벤져스 : 앤드게임</h3>
                                <p>역대 최단 기간 1000만 관객 돌파 기록 </p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="swiper-pagination"></div>
                <div class="swiper-button-prev"></div>
                <div class="swiper-button-next"></div>
            </div>
        </div>
    </section>
    
       <form>
                       
            <div class="moviebar">          		
            <h3 id="movie-text">자유 게시판</h3>                        
        </div>				      	     
               <div class="moviebar">     
	</div>    
	   	
       
   
</form>

<div class="container">
 
                                                                                   
 <!--   <p>Resize the browser window to see the effect.</p> -->
  <div class="table-responsive-sm">          
  <table class="table table-bordered">
    <thead>
      <tr>
        <th width="70" bgcolor="#8181F7" align="center">번호</th>
        <th align="center">제목</th>
        <th align="center"  width="130">작성자</th>
        <th align="center"  width="150">작성일</th>
        
        
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>1</td>
        <td>아 과제가 너무 하기 싫어요 </td>
        <td>이지훈</td>
        <td>2020-06-26</td>
      </tr>
      
      <tr>
        <td>2</td>
        <td>아 과제가 너무 하기 싫어요 </td>
        <td>이지훈</td>
        <td>2020-06-26</td>
      </tr>
      
      <tr>
        <td>3</td>
        <td>아 과제가 너무 하기 싫어요 </td>
        <td>이지훈</td>
        <td>2020-06-26</td>
      </tr>
      
      <tr>
        <td>4</td>
        <td>아 과제가 너무 하기 싫어요 </td>
        <td>이지훈</td>
        <td>2020-06-26</td>
      </tr>
      <tr>
        <td>4</td>
        <td>아 과제가 너무 하기 싫어요 </td>
        <td>이지훈</td>
        <td>2020-06-26</td>
      </tr>
      <tr>
        <td>4</td>
        <td>아 과제가 너무 하기 싫어요 </td>
        <td>이지훈</td>
        <td>2020-06-26</td>
      </tr>
      <tr>
        <td>4</td>
        <td>아 과제가 너무 하기 싫어요 </td>
        <td>이지훈</td>
        <td>2020-06-26</td>
      </tr>
      <tr>
        <td>4</td>
        <td>아 과제가 너무 하기 싫어요 </td>
        <td>이지훈</td>
        <td>2020-06-26</td>
      </tr>
      <tr>
        <td>4</td>
        <td>아 과제가 너무 하기 싫어요 </td>
        <td>이지훈</td>
        <td>2020-06-26</td>
      </tr>
    </tbody>
  </table>
  </div>
</div>

 <footer id="footer">
        <div id="footer_sns">
            <div class="container">
                <div class="footer_sns">
                    <ul>
                        <li class="icon s1"><a href="#"><span class="ir_pm">트위터</span></a></li>
                        <li class="icon s2"><a href="#"><span class="ir_pm">페이스북</span></a></li>
                        <li class="icon s3"><a href="#"><span class="ir_pm">인스타그램</span></a></li>
                        <li class="icon s4"><a href="#"><span class="ir_pm">구글 플레이</span></a></li>
                        <li class="icon s5"><a href="#"><span class="ir_pm">아이폰 앱스토어</span></a></li>
                    </ul>    
                    <div class="tel">
                        <a href="#">ARS <em>051-999-999</em></a>
                    </div>
                </div>
            </div>
        </div>
        <div id="footer_infor">
            <div class="container">
                <div class="row">
                    <div class="footer_infor">
                        <h2><img src="assets/img/logo.png" alt="megabox"></h2>
                        
                        <address>
                            <p>부산광역시 부산진구 양지로 54<br><span class="bar2">대표자명 이어진</span> 개인정보보호 책임자 경영지원실 실장 김기완<br><span class="bar2">사업자등록번호 999-999-999</span> 통신판매업신고번호 제 833호</p>
                            <p>Copyright 2020 by  WHAT IS THIS MOVIE Inc. All right reserved</p>
                        </address>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    

</body>
</html>