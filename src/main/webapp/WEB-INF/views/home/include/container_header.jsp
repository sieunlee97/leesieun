<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="container">
		<!-- 메인상단위치표시영역 -->
		<div class="location_area customer">
			<div class="box_inner">
				<h2 class="tit_page">스프링 <span class="in">in</span> 자바</h2>
				<p class="location">고객센터 <span class="path">/</span> ${session_board_type}</p>
				<ul class="page_menu clear">
				<c:forEach items="${board_type_list}" var="boardTypeVO">
					<li><a href="/home/board/board_list?board_type=${boardTypeVO.board_type}" class="<c:out value='${(session_board_type eq boardTypeVO.board_type)? "on":""}' />">${boardTypeVO.board_name}</a></li>
				</c:forEach>					
				</ul>
			</div>
		</div>	
		
		