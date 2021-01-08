<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- jsp :  Java Server Page, 자바 서버용 페이지 -->	
<%--자바주석시작	
- jsp에서 자바프로그램을 사용할 때 사용하는 태그 : <% %>	
- 다른언어 PHP 예를 들면, <? ?>	
- @ : annotation, 페이지 지시자(필수) / 언어=java / contentType=text/html	
- 문자set:유니코드 / pageEncoding=UTF-8	
자바주석끝--%>	

<!-- HomeController.java 에서 index.jsp로 매칭 시킨 결과가 나오는 페이지입니다.<br>	
- HTML에서는 /resources/sample/index.html 로 접근한다.<br>	
- jsp 프로그램에서는 위 html처럼 바로 접근 불가능, 홈컨트롤러자바를 거쳐서 index.jsp를 접근한다.<br>	
- 왜 /resources/sample/index.html 로 접근하지 않고, 홈컨트롤러를 거쳐서 index.jsp를 접근하는가?<br>	
- 보안때문이다.<br>	
- 그래서 은행, 관공서, 대학에서 대부분 사용한다.(스프링 배우는 목적)<br>	
- 다른 예로, php는 위에 있는 html처럼 파일에 바로 접근이 가능하다.(그래서 중소기업 홈페이지에 사용)<br>	
- 출발은 자바(pc용 애플리케이션, 웹프로그램도 만드는 데 모두 사용한다.)<br>	
- 자바에서 출발한 스프링프레임워크 : 자바에서 웹프로그램 만드는데 특화된 라이브러리(프로그램묶음)을 구조화 시켜서<br>	
- 개발자가 편하게 만들어 놓은 것이 스프링 프레임워크.(현재버전5.x, 우리는 4.3.22 사용예정)<br>	
- jsp: 지금 보이는 프로젝트는 스프링MVC프로젝트이다.<br>	
- 여기서 MVC에서 View단에 해당하는 기술부분이 jsp<br>	
- Model(데이터베이스) - View(jsp페이지) <->  Controller(컨트롤러 java 클래스)<br>	
- org.edu.controller 패키지명 : 자바클래스가 있는 폴더 경로를 말한다.<br>	
- 패키지를 사용하는 이유: 자바클래스 기능별로 묶어놓기 위해서 명시적으로 만든 묶음<br> -->

<%@ include file="./include/header.jsp" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- (위) 부트스트랩 코어이다. -->

<section> <!-- division 이라는 div 영역표시 태그 대신 사용 -->
<!-- 본문 슬라이드 영역 시작 -->
<!-- 이미지를 불러오는 태그 img -->
<!-- 경로 : 상대경로(./img), 절대경로(/resources/sample/img/...) -->
<!-- 태그 안쪽에 지정한 스타일을 인라인 스타일 -->
<div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
    <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="/resources/sample/img/img_02.jpg" class="d-block w-100" alt="휴먼교육센터입니다.">
      <div class="carousel-caption d-none d-md-block">
        <h5>First slide label</h5>
        <p>Nulla vitae elit libero, a pharetra augue mollis interdum.</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="/resources/sample/img/img_03.jpg" class="d-block w-100" alt="휴먼교육센터입니다.">
      <div class="carousel-caption d-none d-md-block">
        <h5>Second slide label</h5>
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="/resources/sample/img/img_04.jpg" class="d-block w-100" alt="휴먼교육센터입니다.">
      <div class="carousel-caption d-none d-md-block">
        <h5>Third slide label</h5>
        <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur.</p>
      </div>
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
<!-- 본문 슬라이드 영역 끝  -->
</section>

<%@ include file="./include/footer.jsp" %>

