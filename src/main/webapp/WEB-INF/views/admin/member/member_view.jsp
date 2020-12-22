<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- jstl : java standard tag library, jsp의 표준태그 라이브러리 -->
<%@ include file="../include/header.jsp" %>

  <!-- 대시보드 본문 Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- 본문헤더 Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">회원상세보기</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">회원상세보기</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- 본문내용 Main content -->
    <section class="content">
      <div class="container-fluid">
        
        <div class="row"><!-- 부트스트랩의 디자인 클래스 row -->
          <div class="col-12"><!-- 그리드시스템중 12가로칼럼 width:100% -->
          
          <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">READ Member</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <strong><i class="fas fa-user mr-1"></i> user_id</strong>
                <p class="text-muted">
                <!-- jsp에서 자바변수(저장소)를 사용하는 방법 Model로 수신한 $ 변수명으로 표시한다. -->
                <%-- ${user_id2} 아래 보안코딩 적용 --%> 
                <c:out value="${memberVO.user_id}"></c:out>
                </p>
				<!-- 부트스트랩 -->
                <hr> <!-- horizontal 수평선 태그 -->

                <strong><i class="fas fa-address-card mr-1"></i> user_name</strong>
                <p class="text-muted">${memberVO.user_name}</p>

                <hr>

                <strong><i class="far fa-envelope mr-1"></i> email</strong>
                <p class="text-muted">${memberVO.email}</p>

                <hr>

                <strong><i class="far fa-file-alt mr-1"></i> point</strong>
                <p class="text-muted">${memberVO.point}</p>
              	
              	<hr>
              	
              	<strong><i class="fas fa-user-shield mr-1"></i> enabled</strong>              
              	<p class="text-muted">${memberVO.enabled}</p>
              	
              	<hr>
              	
              	<strong><i class="fas fa-layer-group mr-1"></i> levels</strong>
              	<p class="text-muted">${memberVO.levels}</p>
              </div>
              <!-- /.card-body -->
            </div>
            
          <form name="action-form" id="action_form" action="">
          <!-- 버튼영역 시작 -->
            <div class="card-body">
              	<a href="/admin/member/member_list?page=${pageVO.page}" class="btn btn-primary float-right mr-1">LIST ALL</a>              	
              	<button type="button" id="deleteBtn" class="btn btn-danger float-right mr-1">DELETE</button>
              	<button type="button" id="updateBtn" class="btn btn-warning float-right mr-1 text-white">UPDATE</button>
              	<!-- 부트스트랩 디자인 버튼클래스를 이용해서 a태그를 버튼모양 만들기(위) -->
              	<!-- btn클래스명이 버튼모양으로 변경, btn-primary클래스명은 버튼색상을 변경하는역할 -->
              	<!-- 
              	어떻게 스타일이 아닌 클래스에다가 넣어줌으로서 모양과 위치과 바뀌는건가요?
              	... 생각하는 부트스트랩은 html과 css를 모아놓은 집합체라고 생각하는데 
              	거기에 float-right클라스로 정해놓은곳에 오른쪽으로 가게하는 스타일이 지정되어있어서 = 부트스트랩
              	클래스 이름만 지정해줘도 그 클래스로 지정된 스타일이 적용되어서 
              	클래스 이름 지정만으로도 스타일이 적용된다고 보면...          	
              	 -->
              </div>
          <!-- 버튼영역 끝 -->
          <input type="hidden" name="user_id" value="${memberVO.user_id}">
          <input type="hidden" name="page" value="${pageVO.page}">
          </form>
          
          </div>
        </div>
        
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  
<%@ include file="../include/footer.jsp" %>
<script>
$(document).ready(function(){
	$("#deleteBtn").bind("click", function(){
		if(confirm("정말 삭제하시겠습니까?")){
			$("#action_form").attr("action", "/admin/member/member_delete");
			$("#action_form").attr("method", "post");
			$("#action_form").submit();
		} //confirm() 자바 스크립트 함수 반환값은 true/false
	});
	$("#updateBtn").bind("click", function(){
		//정말 수정하시겠습니까 필요 없음. 바로 수정페이지로 이동
			$("#action_form").attr("action", "/admin/member/member_update");
			$("#action_form").attr("method", "get");
			$("#action_form").submit();
	});
});
</script>