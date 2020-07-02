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
    <%
    // 파라메터 설정
	String curPage = request.getParameter("curPage")==null?"1":request.getParameter("curPage");					//현재페이지
	String itemPerPage = request.getParameter("itemPerPage")==null?"10":request.getParameter("itemPerPage");		//결과row수
	String companyNm = request.getParameter("companyNm")==null?"":request.getParameter("companyNm");				//영화사명
	String ceoNm = request.getParameter("ceoNm")==null?"":request.getParameter("ceoNm");				//영화사 대표명
	String[] companyPartCdArr = request.getParameterValues("companyPartCdArr")==null? null:request.getParameterValues("companyPartCdArr"); //영화사분류	
	
	// 발급키
	String key = "da46b02f1986121ca5ae31dc5d77048e";
	// KOBIS 오픈 API Rest Client를 통해 호출
    KobisOpenAPIRestService service = new KobisOpenAPIRestService(key);

	// 영화사코드조회 서비스 호출 (boolean isJson, String curPage, String itemPerPage, String companyNm, String ceoNm, String companyPartCd)
    String companyCdResponse = service.getCompanyList(true, curPage, itemPerPage, companyNm, ceoNm, companyPartCdArr);
	// Json 라이브러리를 통해 Handling
	ObjectMapper mapper = new ObjectMapper();
	HashMap<String,Object> result = mapper.readValue(companyCdResponse, HashMap.class);

	request.setAttribute("result",result);
	
	// KOBIS 오픈 API Rest Client를 통해 코드 서비스 호출 (boolean isJson, String comCode )
	String companyPartCdResponse = service.getComCodeList(true,"2601");
	HashMap<String,Object> companyPartCd = mapper.readValue(companyPartCdResponse, HashMap.class);
	request.setAttribute("companyPartCd",companyPartCd);

    %>
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
   
		 
    <!-- css -->
    <link rel="stylesheet" href="assets/css/reset19.css">
    <link rel="stylesheet" href="assets/css/style19.css">
    <link rel="stylesheet" href="assets/css/swiper.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
<%
	String companyPartCds = "[";
	if(companyPartCdArr!=null){
		for(int i=0;i<companyPartCdArr.length;i++){
			companyPartCds += "'"+companyPartCdArr[i]+"'";
			if(i+1<companyPartCdArr.length){
				companyPartCds += ",";
			}
		}
		companyPartCds += "]";
%>

$(function(){
	var companyPartCd = <%=companyPartCds%>;
	$(companyPartCd).each(function(){
		$("input[name='companyPartCdArr'][value='"+this+"']").prop("checked",true);
	});
});

<%
	}
%>
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
            <h3 id="movie-text">회사 정보</h3>                        
        </div>				      	     
               <div class="moviebar">     
	</div>    
	   	
       
   
</form>
  <div class="tableYDG ">
    
	<c:out value="${result.companyListResult.totCnt}"/>
	<div class="container">
	<table border="1">
	
		<tr>
			<td>영화사코드</td><td>영화사명(영문)</td><td>영화사분류</td><td>대표자명</td><td>필모리스트</td>
		</tr>
	<c:if test="${not empty result.companyListResult.companyList}">
	<c:forEach items="${result.companyListResult.companyList}" var="company">
		<tr>
			<td><c:out value="${company.companyCd }"/></td><td><c:out value="${company.companyNm }"/></td><td><c:out value="${company.companyNmEn }"/></td><td><c:out value="${company.companyPartNames }"/></td>
			<td><c:out value="${company.ceoNm}"/></td><td><c:out value="${company.filmoNames}"/></td>						
		</tr>
	</c:forEach>
	</c:if>
	</table>
	<form action="">
		현재페이지 :<input type="text" name="curPage" value="<%=curPage %>">
		최대 출력갯수:<input type="text" name="itemPerPage" value="<%=itemPerPage %>">
		영화사명:<input type="text" name="companyNm" value="<%=companyNm %>">		
		대표자명:<input type="text" name="ceoNm" value="<%=ceoNm %>"> <br/>
		영화사분류:
			<c:forEach items="${companyPartCd.codes}" var="code" varStatus="status">
			<input type="checkbox" name="companyPartCdArr" value="<c:out value="${code.fullCd}"/>" id="companyTpCd_<c:out value="${code.fullCd}"/>"/> <label for="companyTpCd_<c:out value="${code.fullCd}"/>"><c:out value="${code.korNm}"/></label>
			<c:if test="${status.count %4 eq 0}"><br/></c:if>
			</c:forEach>
			<br/>
		<input type="submit" name="" value="조회">
	</form>
	</div>  
</body>
</html>