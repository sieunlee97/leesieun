<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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


<link rel="stylesheet" href="/resources/sample/css/reset.css" type="text/css">
<link rel="stylesheet" href="/resources/sample/css/mobile.css" type="text/css">
<link rel="stylesheet" href="/resources/sample/css/tablet.css" type="text/css">
<link rel="stylesheet" href="/resources/sample/css/pc.css" type="text/css">

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
<a href="/">LOGO</a><!-- a태그는 페이지 이동 역할, href(헤르프 속성값에 URL을 입력해서 이동 -->
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
<li><a href="/sample">SAMPLE_HOME</a></li>
<li><a href="/sample/weare">WE ARE</a></li>
<li><a href="/sample/work">WORK</a></li>
<li><a href="/sample/blog">BLOG</a></li>
<li><a href="/sample/contact">CONTACT US</a></li>
<li><a href="/">MAIN_HOME</a></li>
</ul>
</nav>
<!-- 상단 로고와 햄버거 메뉴 영역 끝 -->
</header>