<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!-- {fn:length(latest_list)==0}  jstl 써도 가능 -->
<c:if test="${empty latest_list}">
<tr><td colspan="4" class="text-center">조회된 데이터가 없습니다.</td></tr>
</c:if>
<c:forEach items="${latest_list}" var="latestVO">
	 <tr>
	  <td><a href="/admin/board/board_view?page=1&board_type=${latestVO.board_type}&bno=${latestVO.bno}">${latestVO.title}</a></td>
	  <td>${latestVO.writer}</td>
	  <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${latestVO.reg_date}"/></td>
	  <td><span class="badge badge-success">${latestVO.view_count}</span></td>
	</tr>
</c:forEach>