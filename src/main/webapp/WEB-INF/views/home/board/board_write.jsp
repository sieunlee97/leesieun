<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="/resources/home/css/board.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="/resources/plugins/fontawesome-free/css/all.min.css">
<!-- Bootstrap 4 -->
<link rel="stylesheet" href="/resources/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
<script src="/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLte -->
<link rel="stylesheet" href="/resources/dist/css/adminlte.min.css">	
<!-- write.html은 서머노트 웹에디터 부분 추가(아래) -->
<link rel="stylesheet" href="/resources/plugins/summernote/summernote.css">
<script src="/resources/plugins/summernote/summernote.js"></script>
<style>
.note-editor.note-frame.fullscreen{background:white;}
</style>

<!-- 메인콘텐츠영역 -->
	<!-- 메인상단위치표시영역 -->
	<%@ include file="../include/container_header.jsp" %>
		<!-- //메인상단위치표시영역 -->

		<!-- 메인본문영역 -->
		<div class="bodytext_area box_inner">
			<!-- 폼영역 -->
			<form method="POST" name="board_write" action="/home/board/board_write" class="appForm" encType="multipart/form-data">
				<fieldset>
					<legend>상담문의 입력 양식</legend>
					<p class="info_pilsoo pilsoo_item">필수입력</p>
					<ul class="app_list">
						<li class="clear">
							<label for="title_lbl" class="tit_lbl pilsoo_item">제목</label>
							<div class="app_content"><input type="text" name="title" class="w100p" id="title_lbl" placeholder="제목을 입력해주세요" required/></div>
						</li>
						<li class="clear">
							<label for="content_lbl" class="tit_lbl pilsoo_item">내용</label>
							<div class="app_content">
								<textarea name="content" id="content_lbl" class="w100p" placeholder="내용을 입력해주세요." required></textarea></div>
						</li>
						<li class="clear">
							<label for="writer_lbl" class="tit_lbl pilsoo_item">작성자명</label>
							<div class="app_content"><input type="text" value="${session_username}" name="writer" class="w100p" id="writer_lbl" placeholder="이름을 입력해주세요" required/></div>
						</li>
	
						<li class="clear">
		                    <label for="file_lbl" class="tit_lbl">첨부파일</label>
		                    <c:forEach begin="0" end="1" var="index">
		                    	<div class="custom-file  mt-1" style="width:96%;margin:0 2%;">
				                    <input type="file" name="file" class="custom-file-input" id="customFile_${index}">
				                    <label class="custom-file-label" for="customFile" style="color:#999;">파일첨부${index}</label>
			                	</div>
		                    </c:forEach>
		                </li>
						
					</ul>
					<p class="btn_line">
					<button type="submit" class="btn_baseColor">등록</button>
					<a href="/home/board/board_list" class="btn_baseColor">목록</a>
					</p>	
				</fieldset>
			</form>
			<!-- //폼영역 -->
		</div>
		<!-- //메인본문영역 -->
	</div>
	<!-- //메인콘텐츠영역 -->
	
	<!-- 첨부파일 부트스트랩 디자인 JS -->
	<script src="/resources/plugins/bs-custom-file-input/bs-custom-file-input.min.js"></script>
	
	<!-- 첨부파일 선택한 내용 출력 실행 -->
	<script>
	$(document).ready(function () {
	  bsCustomFileInput.init();
	});
	</script>
	<!-- 서머노트 툴바 수정 -->
	<script>
	$(document).ready(function(){
		$('#content_lbl').summernote({
			height:150,
			lang:"ko-KR",
			placeholder:'글 내용을 입력해 주세요',
			toolbar: [
					    ['fontname', ['fontname']],
					    ['fontsize', ['fontsize']],
					    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
					    ['color', ['forecolor','color']],
					    ['table', ['table']],
					    ['para', ['ul', 'ol', 'paragraph']],
					    ['height', ['height']],
					    ['insert',['link','video']],//'picture',
					    ['view', ['fullscreen', 'help']]
					],
			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
		});
	});//textarea 중 content아이디영역을 섬머노트에디터로 변경처리 함수실행
	</script>

<%@ include file="../include/footer.jsp" %>