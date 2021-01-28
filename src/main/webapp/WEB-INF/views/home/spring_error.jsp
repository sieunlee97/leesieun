<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="./include/header.jsp" %>
<link rel="stylesheet" href="/resources/home/css/board.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="/resources/plugins/fontawesome-free/css/all.min.css">
<!-- Bootstrap 4 -->
<link rel="stylesheet" href="/resources/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
<script src="/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLte -->
<link rel="stylesheet" href="/resources/dist/css/adminlte.min.css">

<!-- 인터셉터로 가로챈 에러메시지 출력(아래) -->
<!-- 메인콘텐츠영역 -->
	<div id="container">
		<!-- 메인상단위치표시영역 -->
		<div class="location_area customer">
			<div class="box_inner text-left">
				<h2 class="tit_page">스프링 <span class="in">in</span> 자바</h2>
				<p class="location">에러페이지 <span class="path">/</span>${exception.getMessage()}</p>
				<ul class="page_menu clear">
					<li>${exception.getMessage()}</li>
				</ul>
			</div>
		</div>	
		<!-- //메인상단위치표시영역 -->

		<!-- 메인본문영역 -->
		<div class="bodytext_area box_inner" style="padding:50px;">
			<p><a href="${prevPage}" class="btn btn-warning">이전페이지로 이동</a></p>
			<div class="text-left p-5">
				<p>에러 상세 내역</p>
				<ul>
					<c:forEach items="${exception.getStackTrace()}" var="stack">
					<li>${stack.toString()}</li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<!-- //메인본문영역 -->
	</div>
<!-- //메이콘텐츠영역 -->


<%@ include file="./include/footer.jsp" %>