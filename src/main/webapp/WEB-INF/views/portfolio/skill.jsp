<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp" %>
<div id="wrap">
<!-- 헤더 영역 시작 -->
    <header class="header">
<!-- 헤더 상단 메뉴 영역 시작 -->
	<a href="/"><i class="fas fa-home"></i></a>
	
	<div class="menu-toggle-btn">
	<span></span>
	<span></span>
	<span></span>
	</div>
	
      <nav class="menu">
        <ul>
          <li><a href="/portfolio">HOME</a></li>
          <li class="current"><a href="/portfolio/skill">SKILL</a></li>
          <li><a href="/portfolio/mywork">WORK</a></li>
          <li><a href="/portfolio/contact">CONTACT</a></li>
        </ul>
      </nav>  
    <!-- 헤더 상단 메뉴 영역 끝 -->
	<!-- 헤더 커버 영역 시작 -->
      <div class="cover-section">
        <div class="circle-background" OnClick="location.href ='home.html'" style="cursor:pointer;"></div>
      <div class="cover-content">
        <p>Hi, My name is <b>Lee Si Eun.</b></p>
      </div>
        <a href="/contact" class="btn_contact">Contact ME</a>
      </div>
<!-- 헤더 커버 영역 끝 -->
      
   </header>
<!-- 헤더 영역 끝 -->
<!-- 메인 콘텐츠 영역 시작 -->
<section class="skill-section">
      <div class="my-container">
        <h1>Front-end</h1>
          <table class="skill-table">
            <tr>
              <td>- HTML5</td>
              <td>- CSS</td>
              <td>- JavaScript</td>
            </tr>
          </table>
        <h1>Back-end</h1>
          <table class="skill-table">
            <tr>
                <td>- Java</td>
                <td>- Spring Framework</td>
                <td>- RESTful API</td>
            </tr>
          </table>
        <h1>DataBase</h1>
          <table class="skill-table">
                <tr>
                    <td>- MariaDB</td>
                    <td>- MySQL</td>
                    <td>- Oracle</td>
                </tr>
              </table>
       </div>
</section>
<!-- 메인 콘텐츠 영역 시작 -->
    </div>
  </body>
</html>