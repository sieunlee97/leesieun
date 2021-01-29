<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../include/header.jsp" %>

<!-- Content Wrapper. Contains page content, 대시보드 본문 -->
  <div class="content-wrapper">
    <!-- Content Header (Page header), 본문 헤더 -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">회원리스트</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">회원리스트</li>
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
                <h3 class="card-title">회원 검색</h3>
                <div class="card-tools">
                  
                  <form name="search_form" action="/admin/member/member_list" method="get">
                  <div class="input-group input-group-sm">
                  <!-- 부트스트랩 템플릿만으로는 디자인처리가 안되는 경우가 있기 때문에 종종 인라인스타일 사용 -->
                    <div>
                       <select name="search_type" class="form-control">
                            <option value="all" selected>-전체-</option>
                            <option value="user_id" data-select2-id="8">ID</option>
                            <option value="user_name" data-select2-id="16">이름</option>
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
                      <th>user_id</th> <!-- 테이블 헤드 타이틀태그 th -->
                      <th>user_name[point]</th>
                      <th>email</th> 
                      <th>enabled</th>
                      <th>reg_date</th>
                      <th>levels</th>
                    </tr>
                  </thead>
                  <tbody>
                  <c:if test="${empty memberss}">
                 	 <tr><td colspan="6" class="text-center">조회된 데이터가 없습니다.</td></tr>
                  </c:if>
                  <!-- jstl 표준 core 태그  사용해서  반복문으로 AdminController에서 가져온 members Object 값을 출력 -->
                  <c:forEach items="${memberss}" var="member">
                  	 <tr>
                      <td><a href="/admin/member/member_view?page=${pageVO.page}&user_id=${member.user_id}">${member.user_id}</a></td> <!-- table data 태그 -->
                      <!-- 위의 링크a 값은 리스트가 늘어날수록 동적으로 user_id값이 변하게 된다. 개발자가 jsp처리 -->
                      <td>${member.user_name}[${member.point}]</td>
                      <td>${member.email}</td>
                      <td>${member.enabled}</td>
                      <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${member.reg_date}"/></td>
                      
                      <c:choose>
                      <c:when test="${member.levels eq 'ROLE_ADMIN'}">
                       <td><span class="badge bg-danger">${member.levels}</span></td>
                       </c:when>
                      <c:when test="${member.levels ne 'ROLE_ADMIN'}">
                       <td><span class="badge bg-success">${member.levels}</span></td>
                      </c:when>
                      </c:choose> <!-- span은 자리를 차지하지 않음. 텍스트에 배지만 적용하기 위해 -->
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
            	<a href="/admin/member/member_write" class="btn btn-primary float-right">CREATE</a>
            	<!-- 부트스트랩 디자인 버튼클래스를 이용해서 a태그를 버튼모양 만들기 -->
            	<!-- btn클래스명이 버튼모양을 변경, btn-primary클래스명의 버튼색상 변경 -->
            </div>
            <!-- 버튼영역 끝 -->
            
            <!-- 페이징처리 시작 -->
            <div class="pagination justify-content-center">
          	 <ul class="pagination">
          	 <c:if test="${pageVO.prev}"><!-- if문 true 일 때 아래 실행 -->
              	<li class="paginate_button page-item previous" id="example1_previous">
              	<a href="/admin/member/member_list?page=${pageVO.startPage-1}&search_type=${pageVO.search_type}&search_keyword=${pageVO.search_keyword}" 
              	aria-controls="example1" data-dt-idx="0" tabindex="0" class="page-link">&laquo;</a></li>
             </c:if>
              <!-- previous (위) -->
              
              <!-- jstl의 for문이고, 향상된 for문이 아닌 고전 for문으로 시작값, 종료값 필요, var변수 idx는 인덱스값이 저장되어 있다.(jstl 제공)-->
              <c:forEach begin="${pageVO.startPage}" end="${pageVO.endPage}"  var="idx">
              	<li class='paginate_button page-item <c:out value="${idx == pageVO.page?'active':''}" />'>
              	<a href="/admin/member/member_list?page=${idx}&search_type=${pageVO.search_type}&search_keyword=${pageVO.search_keyword}" 
              	aria-controls="example1" data-dt-idx="1" tabindex="0" class="page-link">${idx}</a></li>
              </c:forEach>
              <!-- 
              <li class="paginate_button page-item "><a href="#" aria-controls="example1" data-dt-idx="2" tabindex="0" class="page-link">2</a></li>
              <li class="paginate_button page-item "><a href="#" aria-controls="example1" data-dt-idx="3" tabindex="0" class="page-link">3</a></li> 
              -->          
                  
              <!-- next (아래)  --> 
             <c:if test="${pageVO.next}"> <!-- if문 true 일 때 아래 실행 -->
              	<li class="paginate_button page-item next" id="example1_next">
              	<a href="/admin/member/member_list?page=${pageVO.endPage+1}&search_type=${pageVO.search_type}&search_keyword=${pageVO.search_keyword}" 
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