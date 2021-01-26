<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 관리자단 헤더 시작 header.jsp-->
<!DOCTYPE html>
<html lang="ko">
<head>
<script>
if('${msg}' != ''){ //자바의 EL표기법 달러{변수명}
	if('${msg}' != '삭제')
	alert("${msg}이 완료되었습니다.");
	else{
	alert("${msg}가 완료되었습니다.");
	}
}
if('${msg_fail}' != ''){
	alert("${msg_fail}할 수 없습니다.");
}
</script>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>관리자 | Dashboard</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="/resources/plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Tempusdominus Bootstrap 4 -->
  <link rel="stylesheet" href="/resources/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="/resources/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- JQVMap -->
  <link rel="stylesheet" href="/resources/plugins/jqvmap/jqvmap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="/resources/dist/css/adminlte.min.css">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="/resources/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="/resources/plugins/daterangepicker/daterangepicker.css">
  <!-- summernote -->
  <link rel="stylesheet" href="/resources/plugins/summernote/summernote-bs4.min.css">
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">

  <!-- Navbar, 관리지화면 최상단 아이콘 2개-->
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      </li>
    </ul>

    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
  
      <li class="nav-item">
        <a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#" role="button">
          <i class="fas fa-th-large"></i>
        </a>
      </li>
    </ul>
  </nav>
  <!-- /.navbar -->

  <!-- Main Sidebar Container, 관리자화면 왼쪽 부분 -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo, 관리자 상단로고 -->
    <a href="/admin" class="brand-link">
      <img src="/resources/dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
      <span class="brand-text font-weight-light">Spring 프로젝트</span>
    </a>

    <!-- Sidebar, 왼쪽 메뉴 -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional), 로그인한 사용자 표시 -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="/resources/dist/img/default-150x150.png" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info">
          <a href="#" class="d-block">${session_username}</a>
        </div>
      </div>

      <!-- SidebarSearch Form, 검색 폼 -->
      <div class="form-inline">
        <div class="input-group" data-widget="sidebar-search">
          <input class="form-control form-control-sidebar" type="search" placeholder="Search" aria-label="Search">
          <div class="input-group-append">
            <button class="btn btn-sidebar">
              <i class="fas fa-search fa-fw"></i>
            </button>
          </div>
        </div>
      </div>

      <!-- Sidebar Menu, 사용자 홈과 대시보드 메뉴 -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <li class="nav-item">
            <a href="/" class="nav-link">
              <i class="nav-icon fas fa-th"></i>
              <p>
                	사용자 홈
                <span class="right badge badge-danger">New</span>
              </p>
            </a>
          </li>
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          <li class="nav-item menu-open">
            <a href="#" class="nav-link active">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>
                Dashboard
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="/admin/member/member_list" class="nav-link">
                  <!-- 메뉴 선택 시 활성화 active 되는 것은 jquery로 만들 예정 -->
                  <i class="far fa-circle nav-icon"></i>
                  <p>관리자 관리</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="/admin/bbs_type/bbs_type_list" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>게시판 생성 관리</p>
                </a>
              </li>
              <!-- 여기서 부터 붙여넣기 -->
             <li class="nav-item menu-is-opening menu-open">
                <a href="#" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>
                    	게시물 관리
                    <i class="right fas fa-angle-left"></i>
                  </p>
                </a>
                <ul class="nav nav-treeview" style="display: block;">
                <c:forEach items="${board_type_list}" var="boardTypeVO">
                	<li class="nav-item">
                    <a href="/admin/board/board_list?board_type=${boardTypeVO.board_type}" class="nav-link <c:out value='${(session_board_type eq boardTypeVO.board_type)? "active":""}' />">
                      <i class="far fa-dot-circle nav-icon"></i>
                      <p>${boardTypeVO.board_name}</p>
                    </a>
                  </li>
                </c:forEach>  
                </ul>
              </li>
              <!-- 여기까지 붙여넣기 끝 -->
              
              
            </ul>
          </li>
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>
  <!-- 관리자단 헤더 끝 -->
