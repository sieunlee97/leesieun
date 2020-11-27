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

<!DOCTYPE html> <!-- 현재 문서의 형태 선언 -->
<html> <!-- html 문서는 태그열고 ... 태그닫고 -->
<head> <!-- 문서 내용과는 관계 없는 문서 정보가 들어있고, 메타데이터가 존재 -->
<meta charset="UTF-8"> <!-- 문서의 언어 인코딩 설정, 지금은 유니코드로 됨 -->
<!-- 반응형을 작동하기 위해서 사용하는 메타태그 뷰 포트는 모니터, 모바일액정, 프린터 -->
<meta name="viewport" content="width=device-width, initial-scale=1,minimum-scale=1, maximum-scale=1, user-scaleable=no">
<title>반응형 홈페이지</title> <!-- 문서의 제목을 브라우저 상단 왼쪽에 표시 -->
<!-- 외부 자바스크립트 불러오는 태그(아래) -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="/resources/sample/js/user.js"></script>
<!-- 외부 CSS파일 불러오는 태그(아래) -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- (위) 부트스트랩 코어이다. -->

<link rel="stylesheet" href="/resources/sample/css/reset.css" type="text/css">
<link rel="stylesheet" href="/resources/sample/css/mobile.css" type="text/css">
<link rel="stylesheet" href="/resources/sample/css/tablet.css" type="text/css">
<link rel="stylesheet" href="/resources/sample/css/pc.css" type=text/css">

<style>
/* pc용 스타일 시작 */
/*@미디어쿼리사용-메타태그 viewport값 필수*/
/*미디어쿼리:미디어의 가로크기가 1132px이상이면 아래 스타일 적용*/
@media all and (min-width:1132px) {

}

</style>
<script>
/* 자바스크립트 시작 */
$(document).ready(function(){
	$(".carousel").carousel({
		interval:1000, //이미지가 좌우로 움직이는 대기시간 지점1초, 파이어폭스에서 작동X
		pause:false
	});
})
/* 자바스크립트 끝 */
</script>
</head>
<body> <!-- 문서 내용이 들어가는 영역 -->
<div id="wrap"> <!-- 랩핑시킨 영역 -->
<header class="header">
<!-- 상단 로고와 햄버거 메뉴 영역 시작 -->
<h1 class="logo">
<a href="index.html">LOGO</a><!-- a태그는 페이지 이동 역할, href(헤르프 속성값에 URL을 입력해서 이동 -->
</h1> <!-- 헤드라인 글자를 표시 h1~h6 -->
<div class="menu-toggle-btn">
<span></span>
<span></span>
<span></span>
</div>
<!-- html5 시멘틱 웹 = 의미가 있는 태그를 사용하게 해서 AI가 인식하게 된다. nav태그 -->
<nav class="gnb"> <!-- gnb : global navigation, 전체영역메뉴 -->
<!-- 리스트를 보여주는 태그 ul, ol -->
<!-- ul(Unordered List) / ol(Ordered List) : 1.~ 2.~ 3.~ -->
<ul>
<li><a href="index.html">HOME</a></li>
<li><a href="booking.html">BOOKING</a></li>
<li><a href="package.html">PACKAGE</a></li>
<li><a href="review.html">REVIEW</a></li>
<li><a href="contact.html">CONTACT US</a></li>
</ul>
</nav>
<!-- 상단 로고와 햄버거 메뉴 영역 끝 -->
</header>
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
      <img src="/resources/sample/img/map.jpg" class="d-block w-100" alt="지도사진입니다.">
      <div class="carousel-caption d-none d-md-block">
        <h5>First slide label</h5>
        <p>Nulla vitae elit libero, a pharetra augue mollis interdum.</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="/resources/sample/img/jeju.jpg" class="d-block w-100" alt="제주도사진입니다.">
      <div class="carousel-caption d-none d-md-block">
        <h5>Second slide label</h5>
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="/resources/sample/img/hongkong-1.jpg" class="d-block w-100" alt="...">
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
<footer class="footer">
<!-- 하단 로고 영역 시작 -->
<p>LOGO</p> <!-- paragraph(문단) 태그 -->
<!-- 하단 로고 영역 끝 -->
</footer>
</div>
</body>
</html>