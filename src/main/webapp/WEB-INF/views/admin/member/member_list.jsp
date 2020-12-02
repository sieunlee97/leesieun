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
                  
                  <form name="search_form" action="/admin/member_list" method="get">
                  <div class="input-group input-group-sm">
                  <!-- 부트스트랩 템플릿만으로는 디자인처리가 안되는 경우가 있기 때문에 종종 인라인스타일 사용 -->
                    <div>
                       <select name="search_type" class="form-control">
                            <option value="" selected>-전체-</option>
                            <option value="user_id" data-select2-id="8">ID</option>
                            <option value="user_name" data-select2-id="24">이름</option>
                            <option value="user_name" data-select2-id="24">이메일</option>
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
                      <th>Use</th>
                      <th>REGDATE</th>
                      <th>levels</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                    <tr onclick="javascript:location.href='/admin/member_view?user_id=admin';" style="cursor:pointer;">
                      <td><a href="/admin/member_view?user_id=admin">admin</a></td> <!-- table data 태그 -->
                      <!-- 위의 링크a 값은 리스트가 늘어날수록 동적으로 user_id값이 변하게 된다. 개발자가 jsp처리 -->
                      <td>관리자</td>
                      <td>admin@abc.com</td>
                      <td>true</td>
                      <td>2020-12-01</td>
                      <td><span class="badge bg-danger">ROLE_ADMIN</span></td> <!-- span은 자리를 차지하지 않음. 텍스트에 배지만 적용하기 위해 -->
                      <!-- 권한표시는 부트스트랩 배지 클래스 사용 -->
                    </tr>
                    <tr>
                      <td><a href="/member_view?user_id=user">user</a></td> <!-- table data 태그 -->
                      <td>사용자</td>
                      <td>user@abc.com</td>
                      <td>false</td>
                      <td>2020-12-01</td>
                      <td><span class="badge bg-success">ROLE_USER</span></td>
                    </tr>
                  </tbody>
                </table>
              </div>
              <!-- /.card-body -->
              
            </div>
            <!-- /.card -->
            
            <!-- 버튼영역 시작 -->
            <div class="card-body">
            	<a href="/admin/member_write" class="btn btn-primary float-right">CREATE</a>
            	<!-- 부트스트랩 디자인 버튼클래스를 이용해서 a태그를 버튼모양 만들기 -->
            	<!-- btn클래스명이 버튼모양을 변경, btn-primary클래스명의 버튼색상 변경 -->
            </div>
            <!-- 버튼영역 끝 -->
            
            <!-- 페이징처리 시작 -->
            <div class="pagination justify-content-center">
          	 <ul class="pagination">
              <li class="paginate_button page-item previous disabled" id="example1_previous"><a href="#" aria-controls="example1" data-dt-idx="0" tabindex="0" class="page-link">Previous</a></li>
              <!-- previous (위) -->
              <li class="paginate_button page-item active"><a href="#" aria-controls="example1" data-dt-idx="1" tabindex="0" class="page-link">1</a></li>
              <li class="paginate_button page-item "><a href="#" aria-controls="example1" data-dt-idx="2" tabindex="0" class="page-link">2</a></li>
              <li class="paginate_button page-item "><a href="#" aria-controls="example1" data-dt-idx="3" tabindex="0" class="page-link">3</a></li>
              <!-- next (아래) -->
              <li class="paginate_button page-item next" id="example1_next"><a href="#" aria-controls="example1" data-dt-idx="7" tabindex="0" class="page-link">Next</a></li>
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