<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="./include/header.jsp" %>

<section class="contact-section"> <!-- division 이라는 div 영역표시 태그 대신 사용 -->
<h1 class="section-title">CONTACT</h1>
<div class="container">
<!-- 폼태그의 필수 속성 : name, action-데이터를 전송할 대상, method-데이터를 전송하는 방법 -->
<form name="message_form" action="/contact" method="post">
<!-- 스프링에서는 action으로 폼 데이터를 전송할 위치를 지정할 때, contact.html처럼 직접 접근X,
	/contact처럼 controller를 통해 접근O -->
<!-- 필드셋은 폼이 DB테이블에 필드와 1:1 매칭되는 관계-->
<fieldset>
<legend>현재폼의 타이틀영역입니다.</legend>
<div class="input-class">
<label for="name">Name</label><!-- label은 이름표, 입력태그에 대한 라벨은 1:1매칭되는 관계 -->
<!-- placeholder:공간에 자리를 차지하지 않으면서 입력힌트를 보여주는 역할 -->
<input name="name" id="name" type="text" placeholder="이름을 입력해주세요"><!-- input태그는 한줄입력태그, textarea태그는 여러줄입력태그 -->

<label for="phone">Phone</label>
<input name="phone" id="phone" type="text" placeholder="연락처를 입력해주세요">

<label for="email">E-mail</label>
<input name="e-mail" id="email" type="email" placeholder="이메일을 입력해주세요">
<!-- 입력제약조건: html5에서 지원하는 기능 type에 꼭 email이라고 지정해야하지만 제약조건 작동 -->
</div>
<div class="textarea-class">
<label for="message">Message</label>
<textarea name="message" id="message" placeholder="내용을 입력해주세요"></textarea>
</div>
</fieldset>
<div class="submit-btn">
<button type="submit">SEND</button>
</div>
</form>
<!-- form태그의 목적은 input, textarea, checkbox, radio, select 데이터를 submit하는 것이 목적. -->
<!-- form전송은 get(비보안용), post(보안용-입력/수정/삭제) -->
<!-- get방식은 유일하게 검색할 때 사용한다. -->
</div>
</section>

<%@ include file="./include/footer.jsp" %>