<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 관리자단 푸터 시작 -->
  <footer class="main-footer">
    <strong>Copyright &copy; 2014-2020 <a href="https://adminlte.io">AdminLTE.io</a>.</strong>
    All rights reserved.
    <div class="float-right d-none d-sm-inline-block">
      <b>Version</b> 3.1.0-rc
    </div>
  </footer>
 

  <!-- Control Sidebar, 로그아웃 영역 -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="/resources/plugins/jquery/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="/resources/plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button)
</script>
<!-- Bootstrap 4 -->
<script src="/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- ChartJS -->
<script src="/resources/plugins/chart.js/Chart.min.js"></script>
<!-- Sparkline -->
<script src="/resources/plugins/sparklines/sparkline.js"></script>
<!-- JQVMap -->
<script src="/resources/plugins/jqvmap/jquery.vmap.min.js"></script>
<script src="/resources/plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
<!-- jQuery Knob Chart -->
<script src="/resources/plugins/jquery-knob/jquery.knob.min.js"></script>
<!-- daterangepicker -->
<script src="/resources/plugins/moment/moment.min.js"></script>
<script src="/resources/plugins/daterangepicker/daterangepicker.js"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script src="/resources/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<!-- Summernote -->
<script src="/resources/plugins/summernote/summernote-bs4.min.js"></script>
<!-- overlayScrollbars -->
<script src="/resources/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<!-- AdminLTE App -->
<script src="/resources/dist/js/adminlte.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="/resources/demo.js"></script> <!-- 원래 경로 dist/js/demo.js -->
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="/resources/dist/js/pages/dashboard.js"></script>
<!-- 왼쪽메뉴 선택된 부분 active클래스 주는 jquery 명령어 -->
<script>
$(document).ready(function() {
	//현재 선택된 URL 값을 가져오는 명령(아래)
	var current = location.pathname;
	var current_2 = current.split("/",2)[1];// split 함수로 current에 있는 문자를 분리.
	alert(current_2);
	//alert(current); admin(관리자홈), admin/member_list(관리자관리), admin/board_list(게시물관리)
	//active 클래스명을 동적으로 추가할 영역은 nav-item 내부 a태그의 클래스
	$(".nav-treeview li a").each(function(){
		
	}) //each 함수로 a태그 2개를 찾는 명령
});
</script>
</body>
</html>
<!-- 관리자단 푸터 끝 -->