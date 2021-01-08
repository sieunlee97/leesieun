<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="./include/header.jsp" %>

<section class="weare-section"> <!-- division 이라는 div 영역표시 태그 대신 사용 -->
<section class="weare-header"><!-- ---------------------- -->
<h1 class="section-title">WE ARE</h1>
<p>
안녕하세요. 휴먼교육센터입니다.<br> <!-- break return 줄바꿈 -->
천안, 수원, 서울에 위치하고 있습니다.
</p>
</section><!-- ------------------------------------------ -->
<section class="weare-body float-clear"><!-- 갤러리게시판에서 가져오는 데이터 4개 반복영역 -->
<ul>
<li><a href="javascript:;"><!-- a링크 태그의 가상링크 # 대신에 javascript:; 넣는다. -->
<img alt="갤러리게시물1" src="/resources/sample/img/img_01.png">
<h2>휴먼교육센터 천안센터</h2>
<p>국비지원 교육을 신청하세요.</p>
</a></li>
<li><a href="javascript:;">
<img alt="갤러리게시물2" src="/resources/sample/img/img_01.png">
<h2>휴먼교육센터 수원센터</h2>
<p>국비지원 교육을 신청하세요.</p>
</a></li>
<li><a href="javascript:;">
<img alt="갤러리게시물3" src="/resources/sample/img/img_01.png">
<h2>휴먼교육센터 서울센터</h2>
<p>국비지원 교육을 신청하세요.</p>
</a></li>
<li><a href="javascript:;">
<img alt="갤러리게시물4" src="/resources/sample/img/img_01.png">
<h2>휴먼교육센터 고객센터</h2>
<p>0000-0000</p>
</a></li>
</ul>
</section><!-- -------------------------------------------->
</section>

<%@ include file="./include/footer.jsp" %>