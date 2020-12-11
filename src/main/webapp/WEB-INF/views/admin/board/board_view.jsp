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
            <h1 class="m-0">게시글상세보기</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">게시글상세보기</li>
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
                <h3 class="card-title">READ Board</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <strong><i class="fas fa-book mr-1"></i> title</strong>
                <p class="text-muted">
               	 	<!-- 아래와 같은 출력형태는 EL(Express Language)표시 -->
               		<%-- ${boardVO.title} --%>
               		<!-- 위 자바의 EL출력은 보안에 취약하기 때문에 아래처럼 처리함  -->
               		<c:out value="${boardVO.title}"></c:out>
               	</p>
				<!-- 부트스트랩 -->
                <hr> <!-- horizontal 수평선 태그 -->

                <strong><i class="fas fa-pencil-alt mr-1"></i> content</strong>
                <p class="text-muted">
               		${boardVO.content}
                </p>
                <hr>

                <strong><i class="fas fa-user mr-1"></i> 작성자</strong>
                <p class="text-muted">
                	<c:out value="${boardVO.writer}"></c:out>
                </p>
                <hr>
                
                <strong><i class="fas fa-paperclip mr-1"></i> 첨부파일</strong>
                <p class="text-muted"><a href="#">파일다운로드</a></p>
                

              </div>
              <!-- /.card-body -->
            </div>
          
          <!-- 버튼영역 시작 -->
            <div class="card-body">
              	<a href="board_list.html" class="btn btn-primary float-right mr-1">LIST ALL</a>              	
              	<a href="board_list.html" class="btn btn-danger float-right mr-1">DELETE</a>
              	<a href="board_write.html" class="btn btn-warning float-right mr-1 text-white">UPDATE</a>
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
          	<!-- 댓글영역 시작 -->
	          <div class="card card-primary card-outline col-12">
	              <div class="card-header">
	                <h5 class="card-title">Add New Reply</h5>
              	  </div>
              	  <form action="board_view.html" name="reply_form" method="post">
              	   <div class="card-body">
              	   <div class="form-group">
                    <label for="writer">Writer</label>
                    <input type="text" class="form-control" name="writer" id="writer" placeholder="작성자를 입력해주세요." required>
                  <!-- form에서 input같은 입력태그에는 name 속성이 반드시 필요.name 속성값 = DB 필드 속성명
                  DB에 입력할 때 값을 전송하게 되는데 전송값을 저장하는 이름이 name이 되고,위에서는 writer이다.-->
                  </div>
                  <div class="form-group">
                    <label for="reply_text">Reply Text</label>
                    <input type="text" class="form-control" name="reply_text" id="reply_text" placeholder="내용 입력해주세요." required>
                  <!-- form에서 input같은 입력태그에는 name 속성이 반드시 필요.name 속성값 = DB 필드 속성명
                  DB에 입력할 때 값을 전송하게 되는데 전송값을 저장하는 이름이 name이 되고,위에서는 reply_text이다.-->
                  </div>
                  	<button type="button" class="btn btn-warning float-left mr-1 text-white" id="insertReplyBtn">댓글등록</button>
              	  	<!-- 게시판에서는 폼을 전송할때 submit타입을 사용하지만, 댓글은 Ajax로 전송하기 땜누에 button타입으로 지정 -->
              	  </div>
              	  </form>
              	  
					<div class="timeline ml-3">
						<!-- .time-label의 before -->
						<div class="time-label">
							<span class="bg-red">Reply List[1]&nbsp;</span>
						</div>
						<!-- .time-label의 after -->
						<!-- <div>
							<i class="fas fa-envelope bg-blue"></i>
							<div class="timeline-item">
								<h3 class="timeline-header">작성자</h3>

								<div class="timeline-body">댓글 입력 테스트</div>
								<div class="timeline-footer">
									Button trigger modal
									<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#replyModal">
									 	수정
									</button>
								</div>
							</div>
						</div> -->
					</div><!-- ./timeline  -->
					<!-- 페이징처리 시작 -->
		            <div class="pagination justify-content-center">
			          	 <ul class="pagination">
			              <li class="paginate_button page-item previous disabled" id="example1_previous"><a href="#" aria-controls="example1" data-dt-idx="0" tabindex="0" class="page-link">&laquo;</a></li>
			              <!-- previous (위) -->
			              <li class="paginate_button page-item active"><a href="#" aria-controls="example1" data-dt-idx="1" tabindex="0" class="page-link">1</a></li>
			              <li class="paginate_button page-item "><a href="#" aria-controls="example1" data-dt-idx="2" tabindex="0" class="page-link">2</a></li>
			              <li class="paginate_button page-item "><a href="#" aria-controls="example1" data-dt-idx="3" tabindex="0" class="page-link">3</a></li>
			              <!-- next (아래) -->
			              <li class="paginate_button page-item next" id="example1_next"><a href="#" aria-controls="example1" data-dt-idx="7" tabindex="0" class="page-link">&raquo;</a></li>
			             </ul>
		            </div><!-- 페이징처리 끝 -->

			</div><!-- 댓글영역 끝 -->
          </div> <!-- col-12 끝 -->
        </div><!-- row 끝 -->        
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
<!-- /.content-wrapper -->


<%@ include file="../include/footer.jsp" %>
 
 
<%-- 자바스크립트용 #template element 제작  jstl 향상된 for문과 같은 역할 
	 화면을 재구현Representation하는 함수 
	 jstl 사용하려면, jsp에서 <%@ taglib uri=...처럼 외부 core를 가져와서 사용한 것처럼
	 자바스크립트에서도 외부 core를 가져와야한다. --%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<%--jsp <c:forEach items=${memberss}" var="mbmer"> 같은 역할 {{#each .}} --%>
<!-- 댓글템플릿(빵틀) 만들기 -->
<script id="template" type="text/x-handlebars-template">
{{#each .}}
<div class="template-div" data-rno="{{rno}}">
	<i class="fas fa-envelope bg-blue"></i>
	<div class="timeline-item">
		<h3 class="timeline-header">{{replyer}}</h3>
		<div class="timeline-body">{{replytext}}</div>
		<div class="timeline-footer">
			<button type="button" class="btn btn-primary" data-toggle="modal"data-target="#replyModal">
				수정
			</button>
		</div>
	</div>
</div>
{{/each}}
</script>

<script>
var printReplyList = function(data, target, templateObject) {
	var template = Handlebars.compile(templateObject.html()); //html태그로 변환
	var html = template(data); //빅데이터를 리스트탬플릿에 바인딩(데이터결합,묶음) 역할. 변수 html에 저장되었음.
	$(".template-div").remove(); // 화면에 보이는 댓글리스트만 지우기
	target.after(html); //target은 .time-label 클래스 영역을 가리킨다.
};
</script>

<!-- 댓글 등록 버튼 액션 처리 -->
<script>
	$(document).ready(function(){	
		$("#insertReplyBtn").on("click", function() { //댓글등록버튼 클릭했을 때 구현 내용
			// alert("디버그");
			// Ajax 이용해서, 화면을 Representation (REST-API방식) 부분 화면을 재구현
			$.ajax({
				//여기서부터는 프론트엔드 개발자 영역
				type:'get', //지금은 html이라서 get방식이지만, jsp로 가면 post방식으로 바꿔야한다.(보안)
				url:'board_view.html', //jsp로 가면, ReplyController에서 지정한 url로 변경
				dataType:'text', //ReplyController로부터 데이터를 text형식으로 받겠다고 명시.
				success:function(result){ //응답이 성공하면(상태값 200 OK), 위 경로에서 반환받은 result(JSON 텍스트 데이터) 이용해서 화면 재구현
					//지금은 html이라서 result값을 이용할 수 없기 대문에 댓글더미데이터를 만든다.
					result=[
						//{rno:댓글번호, bno:게시믈번호, replytext:"첫번째댓글", replyer:"admin", regdate:타임스탬프}
						{rno:1,bno:15,replytext:"첫번째댓글",replyer:"admin",regate:1601234512345}, //첫번째 댓글 데이터
						{rno:2,bno:15,replytext:"두번째댓글",replyer:"user02",regate:1601234512345} //두번째 댓글 데이터
					];// 위 url이 공공데이터라고 생각하면, 위 데이터를 화면에 구현함녀 빅데이터의 시각화로 불리게 된다.
					
					//printReplyList(빅데이터, 출력할 타겟 위치, 빅데이터를 가지고 바인딩된-묶인 템플릿화면))
					printReplyList(result, $(".time-label"), $("#template"));//화면에 출려하는 구현함수를 호출하면 실행.
					//result값을 받아서 #template으로 가공시켜서 time-label 위치에 출력한다.
				} 
			});
		});
	});
</script>

<!-- 댓글 수정 버튼을 클릭했을 때, 팝업창의 내용을 동적으로 변경시키기 구현 -->
<script>
$(document).ready(function() {
	$(".timeline").on("click", ".template-div", function(event){ //.template-div 는 댓글리스트 영역
		//$(this); 클릭한 댓글에 따라서 this는 첫번째 댓글일 수도 있고, 두번째 댓글일 수도 있다.
		$("#rno").val($(this).attr("data-rno"));
		$(".modal-title").html($(this).find(".timeline-header").text());
		$("#replytext").val($(this).find(".timeline-body").text());
		// 클릭으로 선택한 댓글의 .thimeline-body영역의 text문자를 모달창의 #replytext영역에 입력하겠다.
	});
});
</script>
<!-- Modal -->
<div class="modal fade" id="replyModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">작성자</h5><!-- 작성자는 동적으로 값이 바뀐다. -->
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<input type="hidden" name="rno" id="rno" value=""> <!-- $(".timeline").on("click", 액션으로 value값이 채워집니다. -->
		<input type="text" class="form-control" name="replytext" id="replytext" placeholder="내용 입력해주세요." required> 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary">수정</button>
        <button type="button" class="btn btn-danger">삭제</button>
      </div>
    </div>
  </div>
</div>