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
    <div class="p-3 control-sidebar-content text-center">
    	<h5>로그아웃</h5><hr class="mb-2"/>
    	<a href="/logout" class="btn btn-lg btn-primary">로그아웃</a>
  	</div>
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
<!-- AdminLTE for demo purposes (원래 경로 dist/js/demo.js)
<script src="/resources/demo.js"></script>
-->
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="/resources/dist/js/pages/dashboard.js"></script>
<!-- 왼쪽메뉴 선택된 부분 active클래스 주는 jquery 명령어 -->
<script>
$(document).ready(function() {
	//현재 선택된 URL 값을 가져오는 명령(아래) 
	var current = location.pathname;//current 변수저장소에서 board, member 클릭한 내용 확인
	var current_2 = current.split("/")[2];// split 함수로 current에 있는 문자를 분리한 배열값 반환
	//alert(current_2);
	//alert(current); // admin(대시보드-undfined), admin/member_list(관리자관리), admin/board_list(게시물관리)
	//active 클래스명을 동적으로 추가할 영역은 nav-item 내부 a태그의 클래스
	$(".nav-treeview li a").each(function(){ 
	// nave-treeview클래스의 li 안의 a태그에서 each반복함수 사용
	//each 반복함수로 a태그를 찾는 명령, 결과는 2개이기 때문에 2번 반복
		 //$(this) 현재 함수의 구현 대상 본인을 가리킨다.
		 // 2개의 값을 비교: - a 태그의 값 /admin/member_list, /admin/board_list
		 // 2개의 값을 비교: - 비교대상 current_2(현재 웹브라우저의 URL값 중 제일 마지막 값)
		 // -> a태그의 href(=/admin/member_list, /admin/board_list)에 current_2값이 포함되어있다면,~
		 //if( $(this).attr('href').includes(current_2) == true ){}
		 // - includes 포함하고 있는 문자열 비교
		 // - 위에서 사용한 includes 함수는 Chrome에서만 작동		 
		 if( $(this).attr('href').indexOf(current_2) != -1 && current_2 != 'board'){ // 위 문제를 처리하는 대체 함수 indexOf 사용
			 if(current_2 != 'board'){
				 $(this).addClass("active");//선택한 메뉴의 배경색상 흰색 추가 처리
			 }
		 } else { 
			 if(current_2 != 'board'){
				 $(this).removeClass("active");//선택하지 않은 메뉴의 배경색상 흰색을 제거 처리
			 }
		 }
	});
});
</script>
</body>
</html>
<!-- 관리자단 푸터 끝 -->