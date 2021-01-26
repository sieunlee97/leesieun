<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp" %>

<!-- Content Wrapper. Contains page content, 대시보드 본문 -->
  <div class="content-wrapper">
    <!-- Content Header (Page header), 본문 헤더 -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">게시판타입리스트</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">게시판타입리스트</li>
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
              
              <div class="card-body table-responsive p-0">
                <table class="table table-hover text-nowrap">
                  <thead>
                    <tr>
                      <th>번호</th>
                      <th>게시판타입</th> <!-- 테이블 헤드 타이틀태그 th -->
                      <th>게시판이름</th>
                      <th>출력순서</th>
                    </tr>
                  </thead>
                  
                  <tbody>
                  <!-- jstl core를 쓰는 이유? 향상된 for문을 사용하기 위해서 지정 -->
                  <c:forEach items="${board_type_list}" var="boardTypeVO" varStatus="status">
                    <tr>
                      <td>${status.count}</td> 
                      <td><a href="/admin/bbs_type/bbs_type_update?board_type=${boardTypeVO.board_type}">${boardTypeVO.board_type}</a></td>
                      <td>${boardTypeVO.board_name}</td>
                      <td>${boardTypeVO.board_sun}</td>
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
            	<a href="/admin/bbs_type/bbs_type_write" class="btn btn-primary float-right">CREATE</a>
            </div>
            <!-- 버튼영역 끝 -->

          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
<!-- /.content-wrapper -->

<%@ include file="../include/footer.jsp" %>
