<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/header.jsp" %>

<!-- 대시보드 본문 Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- 본문헤더 Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">회원정보수정</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">회원정보수정</li>
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
          
          <!-- form start -->
          <form name="update_form" action="/admin/member/member_update" method="post">
          <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">UPDATE Member</h3>
              </div>
              <!-- /.card-header -->
              
                <div class="card-body">
                  <div class="form-group">
                    <label for="user_id">User_id</label>
                    <input value="${memberVO.user_id}" type="text" class="form-control" name="user_id" id="user_id" placeholder="ID를 입력해주세요." required readonly>
                  <!-- form에서 input같은 입력태그에는 name 속성이 반드시 필요.name 속성값 = DB 필드 속성명
                  DB에 입력할 때 값을 전송하게 되는데 전송값을 저장하는 이름이 name이 되고,위에서는 user_id이다.-->
                  </div>
                  <div class="form-group">
                    <label for="user_pw">Password</label>
                    <!-- html5에서 지원되는 유효성 검사 maxlength, minlength, required, type="email" -->
                    <!-- 단, html5를 지원하는 브라우저에서만 사용가능. 그래서 jquery.validator라는 자바스크립트 사용 -->
                    <input maxlength="10" minlength="5" value="" type="password" class="form-control" name="user_pw" id="user_pw" placeholder="암호를 입력해주세요.">
                  </div>
                  <div class="form-group">
                  	<label for="user_name">User_name</label>
                  	<input value="${memberVO.user_name}" type="text" class="form-control" name="user_name" id="user_name" placeholder="이름을 입력해주세요." required>
                  	<!-- 필수 입력값은 html5에서 지원하는 유효성 검사 중 required 속성 사용해서 null값을 체크한다.(유효성검사) -->
                  </div>
                  <div class="form-group">
                  	<label for="email">Email</label>
                  	<input value="${memberVO.email}" type="email" class="form-control" name="email" id="email" placeholder="이메일주소를 입력해주세요." required>
                  </div>
                  <div class="form-group">
                  	<label for="point">Point</label>
                  	<input value="${memberVO.point}" type="number" class="form-control" name="point" id="point" placeholder="포인트를 입력해주세요." required>
                  </div>
                  <div class="form-group">
                  	<label for="enabled">Enabled</label>
                  	<select class="form-control" name="enabled" id="enabled">
                  		<option value="0" <c:out value="${(memberVO.enabled=='false')?'selected':''}"/>>false</option>
                  		<option value="1" <c:out value="${(memberVO.enabled=='true')?'selected':''}"/>>true</option>
               		</select>
                  </div>
                  <div class="form-group">
                  	<label for="levels">Levels</label>
                  	<select class="form-control" name="levels" id="levels">
                  		<option value="ROLE_ADMIN" <c:out value="${(memberVO.levels=='ROLE_ADMIN')?'selected':''}"/>>ROLE_ADMIN</option>
                  		<option value="ROLE_USER" <c:out value="${(memberVO.levels=='ROLE_USER')?'selected':''}"/>>ROLE_USER</option>
               		</select>
                  </div>
                </div>
                <!-- /.card-body -->
             </div> <!-- /.card card-primary -->
          
          <!-- 버튼영역 시작 -->
            <div class="card-body">
              	<a href="/admin/member/member_list?page=${pageVO.page}" class="btn btn-primary float-right mr-1">LIST ALL</a>              	
              	<a href="/admin/member/member_view?page=${pageVO.page}&user_id=${memberVO.user_id}" class="btn btn-secondary float-right mr-1">BACK</a>
              	<button type="submit" class="btn btn-warning float-right mr-1 text-white">SUBMIT</button>
              	<!-- a태그는 링크이동은 되지만, post값을 전송하지 못한다. 그래서 button태그를 사용. -->
              </div>
          <!-- 버튼영역 끝 -->
          <!-- value="${pageVO.page}"는 setPage와 같다. 여기서 저장된 page값이 controller의  post방식의 updateMember의 PageVO pageVO에 저장 -->
          <input name="page" value="${pageVO.page}" type="hidden" />
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