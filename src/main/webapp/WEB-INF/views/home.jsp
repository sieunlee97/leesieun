<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page session="false" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
	<title>스프링</title>
</head>
<body>
<h1>
	Hello world! 이시은입니다.
</h1>
<p> <c:out value="${serverTime}"></c:out> </p>
<!-- c:out 태그를 사용하는 이유는 해킹 방지용으로 필요합니다. 시큐어코딩 -->
<P>  게시판 글을 불러온다고 예상하면 : 현재 서버의 시간은 ${serverTime} 입니다.
<script>alert('아주 끝내주는 사이트로 이동합니다! ${serverTime}');</script>
</P>

</body>
</html>
