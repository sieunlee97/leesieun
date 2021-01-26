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
            <h1 class="m-0">게시판타입수정</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">게시판타입수정</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content, 본문 내용 -->
    <section class="content">
      <div class="container-fluid">
        <div class="row"><!-- 부트스트랩의 디자인 클래스 row -->
          <div class="col-12"><!-- 그리드시스템중 12가로칼럼 width:100% -->
          
          <!-- form start -->
          <form name="update_form" action="/admin/bbs_type/bbs_type_update" method="post">
          <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">게시판 타입 수정</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
              	<div class="form-group">
              		<label>게시판 타입</label>
              		<input readonly type="text" value="${boardTypeVO.board_type}" class="form-control" name="board_type" id="board_type" required>
              	</div>
                <div class="form-group">
                   <label for="board_name">게시판이름</label>
                   <input type="text" value="${boardTypeVO.board_name}" class="form-control" name="board_name" id="board_name" placeholder="게시판명을 입력해주세요." required>
                </div>
               
                <div class="form-group">
                	<label for="board_sun">게시판출력순서</label>
                	<input type="text" value="${boardTypeVO.board_sun}" class="form-control" name="board_sun" id="board_sun" placeholder="게시판 출력 순서를 입력해주세요." required>
                	<!-- 필수 입력값은 html5에서 지원하는 유효성 검사 중 required 속성 사용해서 null값을 체크한다.(유효성검사) -->
                </div>                 	
                </div>
                <!-- /.card-body -->
             </div> <!-- /.card card-primary -->
          
          <!-- 버튼영역 시작 -->
            <div class="card-body">
              	<a href="/admin/bbs_type/bbs_type_list" class="btn btn-primary float-right mr-1">LIST</a>  
                <button id="btn_delete" type="button" class="btn btn-danger float-right mr-1 text-white">DELETE</button>	
              	<button type="submit" class="btn btn-warning float-right mr-1 text-white">UPDATE</button>
              	<!-- a태그는 링크이동은 되지만, post값을 전송하지 못한다. 그래서 button태그를 사용. -->
              </div>
          <!-- 버튼영역 끝 -->
          
          </form>
          <!-- 폼내부에 버튼이 있어야지만, submit버튼이 작동한다. -->
          
          </div>
        </div>
        
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
<!-- /.content-wrapper -->

<%@ include file="../include/footer.jsp" %>
<script>
jQuery(document).ready(function(){
	jQuery("#btn_delete").on("click", function(){
		if(confirm("정말 삭제하시겠습니까?")){
			var delete_form = jQuery("form[name='update_form']")
			delete_form.attr("action", "/admin/bbs_type/bbs_type_delete");
			delete_form.submit();	
		}
	});
});
</script>