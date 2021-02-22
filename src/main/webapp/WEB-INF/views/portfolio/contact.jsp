<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/header.jsp" %>
<style>
body{
  background-color: rgb(218,48,76);
  }
</style>
  <section class="contact-section">
    <div class="my-container">
    <section class="header">
    <a href="/"><i class="fas fa-home"></i></a>
	    <div class="menu-toggle-btn">
		<span></span>
		<span></span>
		<span></span>
		</div>
      <nav class="menu">
        <ul>
          <li><a href="/portfolio">HOME</a></li>
          <li><a href="/portfolio/skill">SKILL</a></li>
          <li><a href="/portfolio/mywork">WORK</a></li>
          <li class="current"><a href="/portfolio/contact">CONTACT</a></li>
        </ul>
      </nav>
    </section>
      <div class= "info">
      <span class="circle-background" OnClick="location.href ='/portfolio'" style="cursor:pointer;"></span>
        <table class="info-table">
       	  <tr>
            <td class="title">Profile</td>
            <td class="detail">이시은 / 97.01.27</td>
          </tr>
          <tr>
            <td class="title">H.P.</td>
            <td class="detail">010-3190-0137</td>
          </tr>
          <tr>
            <td class="title">E-mail</td>
            <td class="detail">tldms0137@naver.com</td>
          </tr>
          <tr>
            <td class="title"><img src="/resources/portfolio/img/github.png" alt="깃허브로고"></img></td>
            <td class="detail"><a href="https://github.com/sieunlee97" target="_blank">https://github.com/sieunlee97</a></td>
          </tr>
          <tr>
            <td class="title">Blog</td>
            <td class="detail"><a href=" https://sw-engineering.tistory.com/" target="_blank"> https://sw-engineering.tistory.com/</a></td>
          </tr>
        </table>
      </div>
    </div>
    </section>
</body>
</html>