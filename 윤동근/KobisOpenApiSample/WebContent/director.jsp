<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.*"%>
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
    <%
    // 파라메터 설정
	String curPage = request.getParameter("curPage")==null?"1":request.getParameter("curPage");					//현재페이지
	String itemPerPage = request.getParameter("itemPerPage")==null?"10":request.getParameter("itemPerPage");		//결과row수
	String peopleNm = request.getParameter("peopleNm")==null?"":request.getParameter("peopleNm");				//영화인명
	String filmoNames = request.getParameter("filmoNames")==null?"":request.getParameter("filmoNames");				//영화인 대표명
	
	// 발급키
	String key = "da46b02f1986121ca5ae31dc5d77048e";
	// KOBIS 오픈 API Rest Client를 통해 호출
    KobisOpenAPIRestService service = new KobisOpenAPIRestService(key);

	// 영화사코드조회 서비스 호출 
    String peopleCdResponse = service.getPeopleList(true, curPage, itemPerPage, peopleNm, filmoNames);
	// Json 라이브러리를 통해 Handling
	ObjectMapper mapper = new ObjectMapper();
	HashMap<String,Object> result = mapper.readValue(peopleCdResponse, HashMap.class);

	request.setAttribute("result",result);
	
	
    %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="assets/css/reset19.css">
    <link rel="stylesheet" href="assets/css/style19.css">
    <link rel="stylesheet" href="assets/css/swiper.css">
    
    <meta name="author" content="Kodinger">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<title>감독 정보</title>
	<meta name="description" content="Login - Register Template">
    <meta name="author" content="Lorenzo Angelino aka MrLolok">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="main.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    
	
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
            <h3 id="movie-text">감독 정보</h3>                        
        </div>				      	     
            <div class="moviebar">        
	</div>    	   	
</form>


	
	<div class="tableYDG">
	
	<table border="1">
	
		<tr>
			<td>영화인코드</td><td>영화인명</td><td>영화인명(영문)</td><td>분야</td><td>필모리스트</td>
		</tr>
	<c:if test="${not empty result.peopleListResult.peopleList}">
	<c:forEach items="${result.peopleListResult.peopleList}" var="people">
		<tr>
			<td><c:out value="${people.peopleCd }"/></td><td><c:out value="${people.peopleNm }"/></td><td><c:out value="${people.peopleNmEn }"/></td><td><c:out value="${people.repRoleNm}"/></td>
			<td><c:out value="${people.filmoNames}"/></td>						
		</tr>
	</c:forEach>
	</c:if>
	</table>
	
	<form action="">
	
		현재페이지 :<input type="text" name="curPage" value="<%=curPage %>">
		최대 출력갯수:<input type="text" name="itemPerPage" value="<%=itemPerPage %>">
		영화인명:<input type="text" name="peopleNm" value="<%=peopleNm %>">		
		필모그래피:<input type="text" name="filmoNames" value="<%=filmoNames %>"> <br/>
		
		<input type="submit" name="" value="조회">
	</form>
	</div>
</body>
</html>