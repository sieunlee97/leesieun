<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="/resources/home/css/board.css">

<!-- 메인콘텐츠영역 -->
	<div id="container">
		<!-- 메인상단위치표시영역 -->
		<div class="location_area customer">
			<div class="box_inner">
				<h2 class="tit_page">스프링 <span class="in">in</span> 자바</h2>
				<p class="location">고객센터 <span class="path">/</span> 공지사항</p>
				<ul class="page_menu clear">
					<li><a href="#" class="on">공지사항</a></li>
					<li><a href="#">문의하기</a></li>
				</ul>
			</div>
		</div>	
		<!-- //메인상단위치표시영역 -->

		<!-- 메인본문영역 -->
		<div class="bodytext_area box_inner">
			<!-- 검색폼영역 -->
			<form id="search_form" name="search_form" action="/home/board/board_list" class="minisrch_form">
				<fieldset>
					<legend>검색</legend>
					<input name="search_keyword" type="text" class="tbox" title="검색어를 입력해주세요" placeholder="검색어를 입력해주세요">
					<button class="btn_srch">검색</button>
				</fieldset>
			</form>
			<!-- //검색폼영역 -->
			
			<!-- 게시물리스트영역 -->
			<table class="bbsListTbl" summary="번호,제목,조회수,작성일 등을 제공하는 표">
				<caption class="hdd">공지사항  목록</caption>
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">제목</th>
						<th scope="col">조회수</th>
						<th scope="col">작성일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td class="tit_notice"><a href="/home/board/board_view">이번 여름 휴가 제주 갈까? 미션 투어 (스프링경비 50만원 지원)</a> </td>
						<td>123</td>
						<td>2018-08-01</td>
					</tr>
				</tbody>
			</table>
			<!-- //게시물리스트영역 -->
			
			<!-- 페이징처리영역 -->
			<div class="pagination">
				<a href="javascript:;" class="firstpage  pbtn"><img src="/resources/home/img/btn_firstpage.png" alt="첫 페이지로 이동"></a>
				<a href="javascript:;" class="prevpage  pbtn"><img src="/resources/home/img/btn_prevpage.png" alt="이전 페이지로 이동"></a>
				<a href="javascript:;"><span class="pagenum currentpage">1</span></a>
				<a href="javascript:;"><span class="pagenum">2</span></a>
				<a href="javascript:;"><span class="pagenum">3</span></a>
				<a href="javascript:;"><span class="pagenum">4</span></a>
				<a href="javascript:;"><span class="pagenum">5</span></a>
				<a href="javascript:;" class="nextpage  pbtn"><img src="/resources/home/img/btn_nextpage.png" alt="다음 페이지로 이동"></a>
				<a href="javascript:;" class="lastpage  pbtn"><img src="/resources/home/img/btn_lastpage.png" alt="마지막 페이지로 이동"></a>
			</div>
			<!-- //페이징처리영역 -->
			<p class="btn_line">
				<a href="/home/board/board_write" class="btn_baseColor">등록</a>
			</p>
		</div>
		<!-- //메인본문영역 -->
	</div>
<!-- //메인콘텐츠영역 -->

<%@ include file="../include/footer.jsp" %>