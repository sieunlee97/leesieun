<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="./include/header.jsp" %>

<!-- Content Wrapper. Contains page content, 대시보드 본문 -->
  <div class="content-wrapper">
    <!-- Content Header (Page header), 본문 헤더 -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">Dashboard</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Dashboard v1</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content, 본문 내용 -->
    <section class="content">
      <div class="container-fluid">
      
      <div class="card">
         <div class="card-header">
           <h3 class="card-title">최근 회원 목록</h3>
           <div class="card-tools">
             <button type="button" class="btn btn-tool" data-card-widget="collapse">
               <i class="fas fa-minus"></i>
             </button>
             <button type="button" class="btn btn-tool" data-card-widget="remove">
               <i class="fas fa-times"></i>
             </button>
           </div>
         </div>
         <!-- /.card-header -->
         <div class="card-body p-0">
           <ul class="users-list clearfix">
           <c:forEach items="${latest_member}" var="memberVO">
             <li>
               <img src="/resources/dist/img/default-150x150.png" alt="User Image">
               <a class="users-list-name" href="/admin/member/member_view?user_id=${memberVO.user_id}&page=1">${memberVO.user_name}</a>
               <span class="users-list-date">
               		<c:out value="${memberVO.enabled eq 'true'? '활성':'비할성'}" />
               </span>
             </li>
             </c:forEach>
           </ul>
           <!-- /.users-list -->
         </div>
         <!-- /.card-body -->
         <div class="card-footer text-center">
           <a href="/admin/member/member_list">View All Users</a>
         </div>
         <!-- /.card-footer -->
       </div>

      	<c:forEach items="${board_type_list}" var="boardTypeVO">
      	<!-- 관리자에서 생성한 게시판 타입 개수만큼 반복 -->
	       <div class="card">
              <div class="card-header border-transparent">
                <h3 class="card-title">최근 ${boardTypeVO.board_name}</h3>

                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse">
                    <i class="fas fa-minus"></i>
                  </button>
                  <button type="button" class="btn btn-tool" data-card-widget="remove">
                    <i class="fas fa-times"></i>
                  </button>
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body p-0">
                <div class="table-responsive">
                  <table class="table m-0">
                    <thead>
                    <tr>
                      <th>title</th>
                      <th>writer</th>
                      <th>reg_date</th>
                      <th>view_count</th>
                    </tr>
                    </thead>
                    <tbody>
                   	<!-- 대시보드에 최근 게시물 출력하기 -->
                   	<!-- 파일 import 시 매개변수 board_type=${boardVO.board_type} -->
                   	<c:import url="/admin/latest/latest_board?board_type=${boardTypeVO.board_type}" />
                  </tbody>
                  </table>
                </div>
                <!-- /.table-responsive -->
              </div>
              <!-- /.card-body -->
              <div class="card-footer clearfix">
                <a href="/admin/board/board_list?board_type=${boardTypeVO.board_type}" class="btn btn-sm btn-secondary float-right">View All ${boardTypeVO.board_type}</a>
              </div>
              <!-- /.card-footer -->
            </div>
      	</c:forEach>
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
<!-- /.content-wrapper -->

<%@ include file="./include/footer.jsp" %>
