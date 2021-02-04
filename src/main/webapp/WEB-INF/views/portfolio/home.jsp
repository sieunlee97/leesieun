<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/header.jsp" %>
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
          <li class="current"><a href="/portfolio">HOME</a></li>
          <li><a href="/portfolio/skill">SKILL</a></li>
          <li><a href="/portfolio/mywork">WORK</a></li>
          <li><a href="/portfolio/contact">CONTACT</a></li>
        </ul>
      </nav>
      <!-- 헤더 상단 메뉴 영역 끝 -->
	<!-- 헤더 커버 영역 시작 -->
      <div class="cover-section">
        <div class="circle-background" OnClick="location.href ='/portfolio'" style="cursor:pointer;"></div>
      <div class="cover-content">
        <p>Hi, My name is <b>Lee Si Eun.</b></p>
      </div>
        <a href="/portfolio/contact" class="btn_contact">Contact ME</a>
      </div>
<!-- 헤더 커버 영역 끝 -->
      
  </header>
<!-- 헤더 영역 끝 -->
<!-- 메인 콘텐츠 영역 시작 -->
    <div class="my-my-container">
<!-- 자기소개글 영역 시작 -->
      <div class="aboutme">
        <h1>ABOUT ME</h1>
        <p> <1분자기소개와 같은 소개내용 적는 영역> </p>
        <p>풀이 살 든 청춘의 때문이다. 날카로우나 청춘의 우리의 위하여 찬미를 오아이스도 품고 온갖 끓는 위하여서. 힘차게 되는 이것이야말로 부패뿐이다.
          인간은 위하여 것은 같지 보라. 가는 원대하고, 그들의 기관과 할지라도 피에 것이다. 유소년에게서 불어 얼마나 찬미를 봄바람이다.
          품으며, 몸이 가슴에 듣는다. 얼마나 뼈 새가 가치를 사랑의 이것은 있는 거친 쓸쓸하랴? 시들어 석가는 청춘의 것이다.
          보는 천지는 천자만홍이 품에 싶이 행복스럽고 만물은 때까지 사막이다. 그들의 피어나는 우리는 피어나기 사라지지 이상, 얼마나 황금시대다.
        </p>
      </div>
<!-- 자기소개글 영역 끝 -->
<!-- 이력사항 시작 -->
      <div class="career">
        <h2>Training</h2>
          <table id="tbl" class="training-table">
            <tr>
              <td class="career-time">2020.11 ~ 2021.04</td>
              <td class="title">
                <p>JAVA 기반 웹&앱 콘텐츠 융합 디지털 컨버전스 개발자 과정<br></p>
                <p class="detail">휴먼교육센터</p>
                <p style="line-height: 5px;">&nbsp</p>
                  <ul>
                    <li>- HTML5/CSS, JavaScript 이용한 반응형 웹사이트 구현</li>
                    <li>- Java, Spring Framework에 MyBatis를 사용하여 회원/게시물 관리하는 Admin 사이트 구현</li>
                    <li>- RESTful API를 이용한 게시판 댓글 기능 구현</li>
                    <li>- 스프링 시큐리티 적용한 사용자단 홈페이지 로그인 기능 구현</li>
                  </ul>
              </td>
              <tr>
              <td class="career-time">2020.01 ~ 2020.01</td>
              <td class="title">
                <p>JAVA Programming<br></p>
                <p class="detail">비트교육센터</p>
                <p style="line-height: 5px;">&nbsp</p>
                  <ul>
                    <li>- JAVA 기본 문법</li>
                  </ul>
              </td>
            </tr>
            </tr>
          </table>
        <h2>Certificate</h2>
          <table id="tbl" class="certificate-table">
            <tr>
                <td class="career-time">2020.12.31</td>
                <td class="title">
                  <p>정보처리기사<br></p>
                  <p class="detail">한국산업인력공단</p>
                </td>
            </tr>
          </table>
        <h2>Language</h2>
          <table id="tbl" class="language-table">
                <tr>
                    <td class="career-time">2021.02.21</td>
                    <td class="title">
                      <p>TOEIC ---점<br></p>
                      <p class="detail">한국TOEIC위원회</p>
                    </td>
                </tr>
              </table>
        <h2>Education</h2>
          <table id="tbl" class="edu-table">
                <tr>
                    <td class="career-time">2015.03 ~ 2019.02</td>
                    <td class="title">
                      <p>호서대학교 광전자디스플레이공학전공<br></p>
                      <p class="detail">4.04/4.5</p>
                    </td>
                </tr>
                <tr>
                    <td class="career-time">2012.03 ~ 2015.02</td>
                    <td class="title"><p>북일여자고등학교<p></td>
                </tr>
              </table>
       </div>
<!-- 이력사항 끝 -->
     </div>
<!-- 메인 콘텐츠 영역 끝-->
    </div>
  </body>
</html>
