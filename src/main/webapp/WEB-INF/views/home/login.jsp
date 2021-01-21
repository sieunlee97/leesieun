<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="secform" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sectoken" %>
<%@ include file="include/header.jsp" %>
<link rel="stylesheet" href="/resources/home/css/board.css">
<script>
if("${param.msg}" == "fail"){
	alert('로그인에 실패했습니다. 상세메세지 : ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}' );
	//스프링 시큐리티는 세션을 발생시킨다. 위 자바 변수 중 세션 스코프는 세션영역을 말한다.
}
</script>
<script>
$(document).ready(function(){
	$("input[name='user_id']").focus(); //페이지로딩시 첫번째 입력위치로 이동
});
</script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
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
			<!-- 주석문 commandName Deprecated(더이상 지원안함)되어서 modelAttribute 변경
			<secform:form method="POST" modelAttribute="login_form" name="login_form" action="login.html" class="appForm">
				<sectoken:csrfInput/>
			</secform:form>
			-->
			
			<form method="POST" id="login_form" name="login_form" action="/login" class="appForm">
				<fieldset>
					<legend>로그인폼</legend>
					<p class="info_pilsoo pilsoo_item">필수입력</p>
					<ul class="app_list">
						<li class="clear">
							<label for="id_lbl" class="tit_lbl pilsoo_item">아이디</label>
							<div class="app_content"><input type="text" name="user_id" class="w100p" id="id_lbl" placeholder="아이디를 입력해주세요" required/></div>
						</li>
						<li class="clear">
							<label for="password_lbl" class="tit_lbl pilsoo_item">암호</label>
							<div class="app_content"><input type="password" name="user_pw" class="w100p" id="password_lbl" placeholder="암호를 입력해주세요" required/></div>
						</li>

					</ul>
					<p class="btn_line">
					<button type="submit" class="btn_baseColor">로그인</button>
					<a href="${url}" class="btn_baseColor" style="background-color:green;">네이버 아이디로 로그인</a>
					</p>	
				</fieldset>
			</form>
			<!-- //폼영역 -->
		</div>
		<!-- //메인본문영역 -->
	</div>
	<!-- //메인콘텐츠영역 -->

<%@ include file="include/footer.jsp" %>