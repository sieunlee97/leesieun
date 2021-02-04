<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/header.jsp" %>
<!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="/resources/plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="/resources/dist/css/adminlte.min.css">
<style>
body{
  background-color: rgb(218,48,76);
  }
  .ready-section .header {
  height:50px;
  }

 .ready-content {
 	color:white;
 	 margin-top:150px;
 }
 .ready-page {
    margin: 20px auto 0;
    width: 600px;
}

</style>
  <section class="ready-section">
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
          <li class="current"><a href="/portfolio/mywork">WORK</a></li>
          <li><a href="/portfolio/contact">CONTACT</a></li>
        </ul>
      </nav>
    </section>
      
      <section class="ready-content">
      <div class="ready-page">
        <i class="fas fa-spinner" style="float:left;font-size:80px; color:white;"></i>

        <div class="error-content" style="margin-left:120px !important;">
          <h3><i class="fas fa-exclamation-triangle text-warning"></i> COMMING SOON </h3>

          <p>
            We could not find the page you were looking for.
            Meanwhile, you may <a href="/portfolio">return to home</a>
          </p>

        </div>
        <!-- /.error-content -->
      </div>
      <!-- /.error-page -->
    </section>
      
      
    </div>
    </section>
</body>
</html>