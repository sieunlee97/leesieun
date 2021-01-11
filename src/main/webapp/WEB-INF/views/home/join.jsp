<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/header.jsp" %>
<link rel="stylesheet" href="/resources/home/css/board.css">
<link rel="stylesheet" href="/resources/home/css/join.css">
<!-- html5가 아닌 유효성 검사 라이브러리(아래) -->
<script src="/resources/home/js/jquery.validate.js"></script>
<script src="/resources/home/js/additional-methods.js"></script>
<script>
$(document).ready(function() {
	$(".appForm").validate({
		rules: {
			password: "required",
			password_chk: {
				equalTo: "#password_lbl"
			}
		}
	});
	$.extend($.validator.messages, {
		required: "필수 항목 입니다.",
		email: "유효하지 않는 Email주소 입니다.",
		digits: "숫자만 입력 가능합니다.",
		equalTo: "비밀번호가 일치하지 않습니다."
	});
});
</script>
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
			<form method="POST" name="join_form" action="join.html" class="appForm">
				<fieldset>
					<legend>회원가입폼</legend>
					<p class="info_pilsoo pilsoo_item">필수입력</p>
					<ul class="app_list">
						<li class="clear">
							<label for="email_lbl" class="tit_lbl pilsoo_item">이메일</label>
							<div class="app_content"><input type="email" name="email"" class="w100p" id="email_lbl" placeholder="이메일을 입력해주세요" required/></div>
						</li>
						<li class="clear">
							<label for="name_lbl" class="tit_lbl pilsoo_item">작성자명</label>
							<div class="app_content"><input type="text" name="name" class="w100p" id="name_lbl" placeholder="이름을 입력해주세요" required/></div>
						</li>
						<li class="clear">
							<label for="password_lbl" class="tit_lbl pilsoo_item">비밀번호</label>
							<div class="app_content"><input type="password" name="password" class="w100p" id="password_lbl" placeholder="비밀번호를 입력해주세요" required/></div>
						</li>
						<li class="clear">
							<label for="password_chk_lbl" class="tit_lbl pilsoo_item">비밀번호확인</label>
							<div class="app_content"><input type="password" name="password_chk" class="w100p" id="password_chk_lbl" placeholder="비밀번로를 다시 입력해주세요" required/></div>
						</li>
						<li class="clear">
							<label for="tel_lbl" class="tit_lbl pilsoo_item">연락처</label>
							<div class="app_content"><input type="digits"" name="tel" class="w100p" id="tel_lbl" placeholder="휴대폰'-'없이 숫자만 입력해주세요" required/></div>
						</li>
						<li class="clear">
							<label for="gender_lbl" class="tit_lbl pilsoo_item">성별</label>
							<div class="app_content radio_area">
								<input type="radio" name="gender" class="css-radio" id="man_lbl" checked="" />
								<label for="man_lbl">남</label>
								<input type="radio" name="gender" class="css-radio" id="woman_lbl" />
								<label for="woman_lbl">여</label>
							</div>
						</li>
						<li class="clear">
							<label for="comment_lbl" class="tit_lbl pilsoo_item">문의내용</label>
							<div class="app_content"><textarea name="comment" class="w100p" id="comment_lbl" placeholder="내용을 입력해주세요" required></textarea></div>
						</li>
						<li class="clear">
							<label for="agree_lbl" class="tit_lbl pilsoo_item">개인정보활용동의</label>
							<div class="app_content checkbox_area"><input type="checkbox"" name="agree" class="css-checkbox" id="agree_lbl" required checked/>
							<label for="agree_lbl" class="agree">동의함</label>
							</div>
						</li>
					</ul>
					<p class="btn_line">
					<button class="btn_baseColor">회원가입</button>
					</p>	
				</fieldset>
			</form>
			<!-- //폼영역 -->
		</div>
		<!-- //메인본문영역 -->
	</div>
<!-- //메이콘텐츠영역 -->

<%@ include file="./include/footer.jsp" %>