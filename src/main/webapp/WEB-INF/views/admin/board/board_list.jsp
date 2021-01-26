<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../include/header.jsp" %>

<!-- Content Wrapper. Contains page content, 대시보드 본문 -->
  <div class="content-wrapper">
    <!-- Content Header (Page header), 본문 헤더 -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">게시판리스트${session_board_type}</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">게시판리스트</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content, 본문 내용 -->
    <section class="content">
      <div class="container-fluid">
       
       <div class="row"> <!-- 부트스트랩의 디자인클래스 row -->
          <div class="col-12"> <!-- 부트스트랩의 그리드시스템 중 12 가로칼럼 (width:100%와 같은 뜻) -->
            <div class="card"> <!-- 부트스트랩의 카드클래스 : 네모난 디자인 -->
              <div class="card-header">
                <h3 class="card-title">게시물 검색</h3>
                <div class="card-tools">
                  
                  <form name="search_form" action="/admin/board/board_list" method="get">
                  <div class="input-group input-group-sm">
                  <!-- 부트스트랩 템플릿만으로는 디자인처리가 안되는 경우가 있기 때문에 종종 인라인스타일 사용 -->
                    <div>
                       <select class="form-control" name="search_type">
                            <option value="all" selected>-전체-</option>
                            <option value="title" data-select2-id="8">제목</option>
                            <option value="content" data-select2-id="24">내용</option>
                       </select>
                    </div>
                    <div>
                    	<input type="text" name="search_keyword" class="form-control float-right" placeholder="Search">
					</div>
                    <div class="input-group-append">
                      <button type="submit" class="btn btn-default">
                        <i class="fas fa-search"></i>
                      </button>
                    </div>
                  </div>
                  </form>
                  
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body table-responsive p-0">
                <table class="table table-hover text-nowrap">
                  <thead>
                    <tr>
                      <th>bno</th> <!-- 테이블 헤드 타이틀태그 th -->
                      <th>title[reply_count]</th>
                      <th>writer</th>
                      <th>reg_date</th>
                      <th>view_count</th>
                    </tr>
                  </thead>
                  
                  <tbody>
                  <c:if test="${fn:length(board_list) == 0}">
                  	<tr><td colspan="5" class="text-center">조회된 데이터가 없습니다.</td></tr>
                  </c:if>
                  <!-- jstl core를 쓰는 이유? 향상된 for문을 사용하기 위해서 지정 -->
                  <c:forEach items="${board_list}" var="boardVO" varStatus="status">
                    <tr>
                      <td>
                      <!-- ${boardVO.bno} 대신에 보기 편한 넘버링으로 변환(아래 계산식 사용)-->
                      ${pageVO.totalCount-(pageVO.page*pageVO.queryPerPageNum)+pageVO.queryPerPageNum-status.index}  
                      [${boardVO.bno}]
                      </td> <!-- table data 태그 -->
                      <!-- 아래의 링크a 값은 리스트가 늘어날수록 동적으로  bno값이 변하게 된다. 개발자가 jsp처리 -->
                      <td><a href="/admin/board/board_view?page=${pageVO.page}&bno=${boardVO.bno}">
                      <!-- c:out 사용하는 이유? 시큐어코딩. 악의적인 코드 삽입이나 sql주입 방지 -->
                      <c:out value="${boardVO.title}"></c:out>[<c:out value="${boardVO.reply_count}"></c:out>]
                      </a></td>
                      <td><c:out value="${boardVO.writer}"></c:out></td>
                      <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${boardVO.reg_date}"/></td>
                      <td><span class="badge bg-danger text-center">${boardVO.view_count}</span></td>
                      <!-- 권한표시는 부트스트랩 배지 클래스 사용 -->
                    </tr>
                  </c:forEach>  
                  </tbody>
                  
                </table>
              </div>
              <!-- /.card-body -->
              
            </div>
            <!-- /.card -->
            
            <!-- 버튼영역 시작 -->
            <div class="card-body">
            	<a href="/admin/board/board_write" class="btn btn-primary float-right">CREATE</a>
            	<!-- 부트스트랩 디자인 버튼클래스를 이용해서 a태그를 버튼모양 만들기 -->
            	<!-- btn클래스명이 버튼모양을 변경, btn-primary클래스명의 버튼색상 변경 -->
            </div>
            <!-- 버튼영역 끝 -->
            
            <!-- 페이징처리 시작 -->
            <div class="pagination justify-content-center">
          	 <ul class="pagination">
          	 <c:if test="${pageVO.prev}"><!-- if문 true 일 때 아래 실행 -->
              	<li class="paginate_button page-item previous" id="example1_previous">
              	<a href="/admin/board/board_list?page=${pageVO.startPage-1}&search_type=${pageVO.search_type}&search_keyword=${pageVO.search_keyword}" 
              	aria-controls="example1" data-dt-idx="0" tabindex="0" class="page-link">&laquo;</a></li>
             </c:if>
              <!-- previous (위) -->
              
              <!-- jstl의 for문이고, 향상된 for문이 아닌 고전 for문으로 시작값, 종료값 필요, var변수 idx는 인덱스값이 저장되어 있다.(jstl 제공)-->
              <c:forEach begin="${pageVO.startPage}" end="${pageVO.endPage}"  var="idx">
              	<li class='paginate_button page-item <c:out value="${idx == pageVO.page?'active':''}" />'>
              	<a href="/admin/board/board_list?page=${idx}&search_type=${pageVO.search_type}&search_keyword=${pageVO.search_keyword}" 
              	aria-controls="example1" data-dt-idx="1" tabindex="0" class="page-link">${idx}</a></li>
              </c:forEach>
              
               <!-- next (아래)  --> 
             <c:if test="${pageVO.next}"> <!-- if문 true 일 때 아래 실행 -->
              	<li class="paginate_button page-item next" id="example1_next">
              	<a href="/admin/board/board_list?page=${pageVO.endPage+1}&search_type=${pageVO.search_type}&search_keyword=${pageVO.search_keyword}" 
              	aria-controls="example1" data-dt-idx="7" tabindex="0" class="page-link">&raquo;</a></li>
             </c:if>
             </ul>
            </div>
            <!-- 페이징처리 끝 -->
              
          </div>
        </div>
        
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

<%@ include file="../include/footer.jsp" %>