<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../include/header.jsp" %>


<!-- 대시보드 본문 Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- 본문헤더 Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">게시물수정</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">게시물수정</li>
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
          <form name="update_form" action="/admin/board/board_update" method="post" encType="multipart/form-data">
          <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">UPDATE Board</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
              	<div class="form-group">
              		<label>게시판 타입</label>
              		<select name="board_type" id="board_type" class= "form-control">
	              		<c:forEach items="${board_type_list}" var="boardTypeVO">
	              			<option value="${boardTypeVO.board_type}" <c:out value="${(session_board_type eq boardTypeVO.board_type)? 'selected':'' }"/> >${boardTypeVO.board_name}</option>
	              		</c:forEach>
              		</select>
              	</div>
                <div class="form-group">
                   <label for="title">title</label>
                   <input type="text" value="${boardVO.title}" class="form-control" name="title" id="title" placeholder="제목 입력해주세요." required>
                  <!-- form에서 input같은 입력태그에는 name 속성이 반드시 필요.name 속성값 = DB 필드 속성명
                  DB에 입력할 때 값을 전송하게 되는데 전송값을 저장하는 이름이 name이 되고,위에서는 title이다.-->
                </div>
                <div class="form-group">
                  <!-- label for과 textarea id는 같게 설정 -->
                   <label for="content">Content</label>
				   <textarea row="5" name="content" id="content" class="form-control"><c:out value="${boardVO.content}"></c:out></textarea>
                </div>
                <div class="form-group">
                	<label for="writer">writer</label>
                	<input type="text" value="${boardVO.writer}" class="form-control" name="writer" id="writer" placeholder="작성자을 입력해주세요." required>
                	<!-- 필수 입력값은 html5에서 지원하는 유효성 검사 중 required 속성 사용해서 null값을 체크한다.(유효성검사) -->
                </div>
                <div class="form-group">
                	<label for="customFile">attach</label>
                	<c:forEach var="index" begin="0" end="1">
                	<div class="div_file_delete">
                 <div class="custom-file">
                     <input type="file" name="file" class="custom-file-input" id="customFile_${index}">
                     <label class="custom-file-label" for="customFile">파일을 선택해주세요</label>
                 </div>
                 <c:if test="${boardVO.save_file_names[index] != null}">              
	                <strong><i class="fas fa-paperclip mr-1"></i> 첨부파일${index}</strong>
	                <p class="text-muted">
	                <a href="/download?save_file_name=${boardVO.save_file_names[index]}&real_file_name=${boardVO.real_file_names[index]}"> <!-- 다운로드 링크 만들 예정 -->
	                ${boardVO.real_file_names[index]}-파일다운로드-
	                </a> &nbsp; 
	                <input type="hidden" name="save_file_name" value="${boardVO.save_file_names[index]}">
	                <button type="button" class="btn btn-info btn_file_delete">삭제</button>
                </p>
               </c:if>
                <hr>
                </div>
                 	</c:forEach>                  	
                </div>
                <!-- /.card-body -->
             </div> <!-- /.card card-primary -->
          
          <!-- 버튼영역 시작 -->
            <div class="card-body">
              	<a href="/admin/board/board_view?page=${pageVO.page}&bno=${boardVO.bno}
" class="btn btn-primary float-right mr-1">BACK</a>  
              	            	
              	<button type="submit" class="btn btn-warning float-right mr-1 text-white">SUBMIT</button>
              	<!-- a태그는 링크이동은 되지만, post값을 전송하지 못한다. 그래서 button태그를 사용. -->
              </div>
          <!-- 버튼영역 끝 -->
          <input type="hidden" name="bno" value="${boardVO.bno}">
          <input type="hidden" name="page" value="${pageVO.page}">
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

<!-- 첨부파일 부트스트랩 디자인JS -->
<script src="/resources/plugins/bs-custom-file-input/bs-custom-file-input.min.js"></script>

<!-- 첨부파일 선택한 내용 출력 실행 -->
<script>
$(function () {
  bsCustomFileInput.init();
});
</script>

<link rel="stylesheet" href="/resources/plugins/summernote/summernote.css">
<style>.note-editor.note-frame.fullscreen{background:white;}
</style>
<script src="/resources/plugins/summernote/summernote.js"></script>
<script>
$(document).ready(function(){
	$('#content').summernote({
		height:150,
		lang:"ko-KR",
		placeholder:'내용을 입력해주세요.',
			toolbar: [
					    ['fontname', ['fontname']],
					    ['fontsize', ['fontsize']],
					    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
					    ['color', ['forecolor','color']],
					    ['table', ['table']],
					    ['para', ['ul', 'ol', 'paragraph']],
					    ['height', ['height']],
					    ['insert',['link','video']],
					    ['view', ['fullscreen', 'help']]
					  ],
			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
	});
});//textarea 중 content아이디영역을 섬머노트에디터로 변경처리 함수실행
</script>
<script>
$(document).ready(function(){
	$(".btn_file_delete").on("click",function(){
		//alert('디버그');
		if(confirm("선택한 첨부파일을 삭제하시겠습니까?")){
			
			var click_element = $(this); //클릭한 현재 엘리먼트(삭제버튼)
			var save_file_name = click_element.parent().find('input[name=save_file_name]').val();
			//alert("삭제할 파일명 :" + save_file_name); return false;
			$.ajax({
				type:"post", //get방식으로 지우면, 누구나 아래  URL입력시 지우는 것이 가능함
				url:"/file_delete?save_file_name="+save_file_name,
				dataType:"text",
				success:function(result){
					if(result=="success"){//실제파일+DB테이블삭제 후 화면에서도 삭제 (아래)
						click_element.parents(".div_file_delete").remove();
					}
				},
				error:function(result){
					alert("RestAPI접근에 실패했습니다.");
					//click_element.parents(".div_file_delete").remove(); //디버그 
				}
			});
		}
		
	});
});
</script>
