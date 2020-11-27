<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="./include/header.jsp" %>

<section class="booking-section"> <!-- division 이라는 div 영역표시 태그 대신 사용 -->
<section class="booking-header"><!-- ---------------------- -->
<h1 class="section-title">BOOKING</h1>
<p>
국내, 해외 상관없이<br> <!-- break return 줄바꿈 -->
항공권부터 숙박까지 편하게 예약하세요!
</p>
</section><!-- ------------------------------------------ -->
<section class="booking-body float-clear"><!-- 갤러리게시판에서 가져오는 데이터 4개 반복영역 -->
<ul>
<li><a href="javascript:;"><!-- a링크 태그의 가상링크 # 대신에 javascript:; 넣는다. -->
<img alt="갤러리게시물1" src="/resources/sample/img/airplane.png">
<h2>해외 항공권 예약</h2>
<p>지금 최저가를 확인해보세요</p>
</a></li>
<li><a href="javascript:;">
<img alt="갤러리게시물2" src="/resources/sample/img/airplane.png">
<h2>국내 항공권 예약</h2>
<p>지금 최저가를 확인해보세요</p>
</a></li>
<li><a href="javascript:;">
<img alt="갤러리게시물3" src="/resources/sample/img/hotel.png">
<h2>해외 숙소 예약</h2>
<p>oo투어 회원에게만 적용되는 특가 상품 확인해...</p>
</a></li>
<li><a href="javascript:;">
<img alt="갤러리게시물4" src="/resources/sample/img/hotel.png">
<h2>국내 숙소 예약</h2>
<p>oo투어 회원에게만 적용되는 특가 상품 확인해...</p>
</a></li>
</ul>
</section><!-- -------------------------------------------->
</section>

<%@ include file="./include/footer.jsp" %>