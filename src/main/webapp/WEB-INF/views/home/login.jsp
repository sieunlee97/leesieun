<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="secform" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sectoken" %>
<%@ include file="include/header.jsp" %>
<link rel="stylesheet" href="/resources/home/css/board.css">
<!-- 메인콘텐츠영역 -->
	<div id="container">
		<!-- 메인상단위치표시영역 -->
		<div class="location_area customer">
			<div class="box_inner">
				<h2 class="tit_page">스프링 <span class="in">in</span> 자바</h2>
				<p class="location">고객센터 <span class="path">/</span> 로그인</p>
				<ul class="page_menu clear">
					<li><a href="#" class="on">로그인</a></li>
				</ul>
			</div>
		</div>	
		<!-- //메인상단위치표시영역 -->

		<!-- 메인본문영역 -->
		<div class="bodytext_area box_inner">
			<!-- 폼영역 -->
			
			<!-- 만약 스프링시큐리티의 csrf공격을 허용하지 않겠다(기본값)로 되어있다면 아래처럼 form을 바꿔야함. -->
			<!-- secform 태그로 폼을 감싸주면, XSS공격 차단시킴-->
			<!-- sectoken태그로 csrf공격 차단시킴--> 
			<!--
			<secform:form method="POST" commandName="login_form" name="login_form" action="login.html" class="appForm">
				<sectoken:csrfInput/>
			</secform:form>
			-->
			
			<form method="POST" id="login_form" name="login_form" action="login.html" class="appForm">
				<fieldset>
					<legend>로그인폼</legend>
					<p class="info_pilsoo pilsoo_item">필수입력</p>
					<ul class="app_list">
						<li class="clear">
							<label for="id_lbl" class="tit_lbl pilsoo_item">아이디</label>
							<div class="app_content"><input type="text" name="id"" class="w100p" id="id_lbl" placeholder="아이디를 입력해주세요" required/></div>
						</li>
						<li class="clear">
							<label for="password_lbl" class="tit_lbl pilsoo_item">암호</label>
							<div class="app_content"><input type="password" name="password" class="w100p" id="password_lbl" placeholder="암호를 입력해주세요" required/></div>
						</li>

					</ul>
					<p class="btn_line">
					<button class="btn_baseColor">로그인</button>
					</p>	
				</fieldset>
			</form>
			<!-- //폼영역 -->
		</div>
		<!-- //메인본문영역 -->
	</div>
	<!-- //메인콘텐츠영역 -->

<%@ include file="include/footer.jsp" %>