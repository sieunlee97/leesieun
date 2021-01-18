<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri= "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title> 스프링 </title>
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet" href="/resources/home/css/reset.css">
<link rel="stylesheet" href="/resources/home/css/main.css">
<link rel="stylesheet" href="/resources/home/css/tablet.css">
<link rel="stylesheet" href="/resources/home/css/pc.css">
<script src="/resources/home/js/jquery-1.11.3.min.js"></script>
<script src="/resources/home/js/jquery.smooth-scroll.min.js"></script>
<script src="/resources/home/js/main.js"></script>
<!-- 슬라이드용 -->
<script src="/resources/home/js/rollmain.js"></script>
<!-- //슬라이드용 --> 
<style>

</style>
<script>
if('${msg}' != ''){ //자바의 EL표기법 달러{변수명}
	alert("${msg} 이(가) 성공하였습니다.");
}
</script>
</head>
<body>

<div id="wrap">
	<!-- 헤더상단메뉴영역영역 -->
	<header id="header">
		<div class="header_area box_inner clear">
			<!-- 상단로고영역 -->
			<h1><a href="/">스프링 in 자바</a></h1>
			<!-- //상단로고영역 -->
			
			<!-- 상단메뉴메뉴영역 -->
			<p class="openMOgnb"><a href="#"><b class="hdd">메뉴열기</b> <span></span><span></span><span></span></a></p>
			<div class="header_cont">
				<ul class="util clear">
				<c:choose>
					<c:when test="${session_enabled eq 'true'}">
						<!-- 로그인 후 보이는 메뉴(아래) -->
						<li><a href="#">${session_username} 님 환영합니다.</a></li>
						<li><a href="/member/mypage">마이페이지</a></li>
						<li><a href="/logout">로그아웃</a></li>
						<c:if test="${session_levels eq 'ROLE_ADMIN'}">
							<li><a href="/admin">AdminLTE</a></li>
						</c:if>
					</c:when>
					<c:otherwise>
						<li><a href="/login">로그인</a></li>
						<li><a href="/join">회원가입</a></li>
					</c:otherwise>
				</c:choose>
				</ul>	
				<nav>
				<ul class="gnb clear">
					<li><a href="/sample" class="openAll1">샘플 홈페이지</a>

                        <div class="gnb_depth gnb_depth2_1">
                            <ul class="submenu_list">
                            	<li><a href="#">포트폴리오</a></li>
                                <li><a href="/sample">반응형 홈페이지</a></li>
                            </ul>
                        </div>
					</li>
					<li><a href="/home/board/board_list" class="openAll2">커뮤니티</a>
				        <div class="gnb_depth gnb_depth2_2">
                            <ul class="submenu_list">
                                <li><a href="/home/board/board_list">공지사항</a></li>
                                <li><a href="/home/board/board_list">갤러리</a></li>
                            </ul>
                        </div>
					</li>
				</ul>
                </nav>
				<p class="closePop"><a href="javascript:;">닫기</a></p>
			</div>
			<!-- //상단메뉴메뉴영역 -->
		</div>
	</header>
	<!-- //헤더상단메뉴영역영역 -->