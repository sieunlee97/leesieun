<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="/resources/home/css/board.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="/resources/plugins/fontawesome-free/css/all.min.css">
<!-- 메인콘텐츠영역 -->
	<div id="container">
		<!-- 메인상단위치표시영역 -->
		<%@ include file="../include/container_header.jsp" %>
		<!-- //메인상단위치표시영역 -->

		<!-- 메인본문영역 -->
		<div class="bodytext_area box_inner">
			<!-- 검색폼영역 -->
			<form id="search_form" name="search_form" action="/home/board/board_list" class="minisrch_form">
				<fieldset>
					<legend>검색</legend>
					<input name="search_type" value="all" type="hidden">
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
				<c:if test="${empty board_list}">
					<tr><td colspan="5">조회된 데이터가 없습니다.</td></tr>
				</c:if>
					<c:forEach items="${board_list}" var="boardVO" varStatus="status">
						<tr>
							<td>
							<!-- 전체게시물-(현재페이지x1페이지당보여줄개수)+1페이지당보여줄개수-현재인덱스값 -->
		                      ${pageVO.totalCount-(pageVO.page*pageVO.queryPerPageNum)+pageVO.queryPerPageNum-status.index}
							</td>
							<td class="tit_notice"><a href="/home/board/board_view?bno=${boardVO.bno}&page=${pageVO.page}&search_type=${pageVO.search_type}&search_keyword=${pageVO.search_keyword}">
								<c:out value="${boardVO.title}"/><c:if test="${not empty boardVO.reply_count}">[<c:out value="${boardVO.reply_count}"></c:out>]</c:if> 
							</a></td>
							<td>${boardVO.view_count}</td>
							<td>
								<fmt:formatDate value="${boardVO.reg_date}" pattern="yyyy-MM-dd HH:mm"/>	
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<!-- //게시물리스트영역 -->
			
			
			<!-- 페이징처리영역 -->
			<div class="pagination">
				<c:if test="${pageVO.prev}">
					<a href="/home/board/board_list?page=${pageVO.startPage-1}&search_type=${pageVO.search_type}&search_keyword=${pageVO.search_keyword}" class="prevpage  pbtn"><img src="/resources/home/img/btn_prevpage.png" alt="이전 페이지로 이동"></a>
				</c:if>
				<c:forEach begin="${pageVO.startPage}" end="${pageVO.endPage}" var="idx">
					<a href="/home/board/board_list?page=${idx}&search_type=${pageVO.search_type}&search_keyword=${pageVO.search_keyword}"><span class='pagenum <c:out value="${(pageVO.page==idx)? 'currentpage':'' }"/>'>
						${idx}
					</span></a>
				</c:forEach>
				<c:if test="${pageVO.next}">
					<a href="/home/board/board_list?page=${pageVO.endPage+1}&search_type=${pageVO.search_type}&search_keyword=${pageVO.search_keyword}" class="nextpage  pbtn"><img src="/resources/home/img/btn_nextpage.png" alt="다음 페이지로 이동"></a>
				</c:if>
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