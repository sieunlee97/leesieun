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
<script>
$(document).ready(function() {
	//라이브러리 사용안하고, 오리지널 j쿼리로 만드는 유효성(아래)
	$("#search_form").submit(function(){ //검색버튼을 클릭=전송했을때.
		var search_keyword = $("input[name=search_keyword]").val();
		if(search_keyword == "") {
			alert("검색어는 빈 값으로 검색할 수 없습니다.!");
			return false;//조건이 맞으면, 전송중지.
		}
	});
});
</script>
<!-- 메인콘텐츠영역 -->
	<div id="container">
		<!-- 메인상단위치표시영역 -->
		<div class="location_area customer">
			<div class="box_inner">
				<h2 class="tit_page">스프링 <span class="in">in</span> 자바</h2>
				<p class="location">고객센터 <span class="path">/</span> 공지사항</p>
				<ul class="page_menu clear">
					<li><a href="#" class="on">공지사항</a></li>
					<li><a href="#">문의하기</a></li>
				</ul>
			</div>
		</div>	
		<!-- //메인상단위치표시영역 -->

		<!-- 메인본문영역 -->
		<div class="bodytext_area box_inner">			
			<ul class="bbsview_list">
				<li class="bbs_title">박물관 미션 투어 응모 당첨자 발표</li>
				<li class="bbs_hit">작성일 : <span>2018.08.09</span></li>
				<li class="bbs_date">조회수 : <span>235</span></li>
				<li class="bbs_content">
					<div class="editer_content">
					    안녕하세요. 믿을 수 있는 스프링정보, 스프링입니다.<br>
                        박물관 미션투어에 관심과 참여 감사드립니다. <br>
                        선정되신 분들도 진심으로 축하드립니다. <br>
                        앞으로도 큰 관심 부탁드리며, 메일로도 안내 예정이니 참고하시기 바랍니다. <br>
                        감사합니다. <br><br>
                        [당첨자]<br>
                        김용* kimyong***@naver.com <br>
                        인봉* in2018a***@naver.com<br>
                        예경* yyhong***@naver.com<br>
                        한진* haha***@naver.com<br>
                        박수* pky**@naver.com<br>
                        명진* mma5**@nate.com<br>
                        김영* rtfg6*@naver.com<br>
                        서영* seo20**@gmail.com<br>
                        윤소* yoon2***@naver.com<br>
                        지은* ji***@daum.net
                    </div>
				</li>
			</ul>
			<p class="btn_line txt_right">
				<a href="/home/board/board_list" class="btn_bbs">목록</a>
			</p>
		</div>
		<!-- //메인본문영역 -->
	</div>
	<!-- //메인콘텐츠영역 -->
	
	<!-- 댓글영역 시작 -->
	<div class="card card-primary card-outline col-12"
		style="padding-bottom: 10px;">
		<div class="card-header">
			<h5 class="card-title">Add New Reply</h5>
		</div>
		<form action="board_view.html" name="reply_form" method="post">
			<div class="card-body">
				<div class="form-group">
					<label for="writer">Writer</label> <input type="text"
						class="form-control" name="writer" id="writer"
						placeholder="작성자를 입력해 주세요." required>
					<!-- 폼에서 input같은 입력태그에는 name속성이 반드시 필요, 이유는 DB에 입력할때,
               	 값을 전송하게 되는데, 전송값을 담아두는 이름이 name가 되고, 위에서는 writer 입니다. -->
				</div>
				<div class="form-group">
					<label for="reply_text">Reply Text</label> <input type="text"
						class="form-control" name="reply_text" id="reply_text"
						placeholder="내용을 입력해 주세요." required>
					<!-- 아래 게시판에서는 폼을 전송할때 submit 타입을 사용 하지만, 댓글은 Ajax로 전송하기 때문에, button타입으로 지정함. -->
				</div>
				<button type="button"
					class="btn btn-warning float-left mr-1 text-white"
					id="insertReplyBtn">댓글등록</button>
			</div>
		</form>
		<div class="timeline">
			<!-- .time-label의 before 위치 -->
			<div class="time-label">
				<span class="bg-red">Reply List[1]&nbsp;&nbsp;</span>
			</div>
			<!-- .time-label의 after 위치 -->
			<!-- <div>
             <i class="fas fa-envelope bg-blue"></i>
             <div class="timeline-item">
               <h3 class="timeline-header">작성자</h3>
               <div class="timeline-body">
                 	댓글 입력 테스트
               </div>
               <div class="timeline-footer">
                 Button trigger modal
		<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#replyModal">
		  수정
		</button>
               </div>
             </div>
           </div> -->

		</div>
		<!-- //.timeline -->
		<!-- 페이징처리 시작 -->
		<div class="pagination justify-content-center">
			<ul class="pagination">
				<li class="paginate_button page-item previous disabled"
					id="example2_previous"><a href="#" aria-controls="example2"
					data-dt-idx="0" tabindex="0" class="page-link">Previous</a></li>
				<!-- 위 이전게시물링크 -->
				<li class="paginate_button page-item active"><a href="#"
					aria-controls="example2" data-dt-idx="1" tabindex="0"
					class="page-link">1</a></li>
				<li class="paginate_button page-item "><a href="#"
					aria-controls="example2" data-dt-idx="2" tabindex="0"
					class="page-link">2</a></li>
				<li class="paginate_button page-item "><a href="#"
					aria-controls="example2" data-dt-idx="3" tabindex="0"
					class="page-link">3</a></li>
				<!-- 아래 다음게시물링크 -->
				<li class="paginate_button page-item next" id="example2_next">
					<a href="#" aria-controls="example2" data-dt-idx="7" tabindex="0"
					class="page-link">Next</a>
				</li>
			</ul>
		</div>
		<!-- 페이징처리 끝 -->
	</div>
		<!-- 댓글영역 끝 -->
	<!-- 자바스트립트용 #template 엘리먼트 제작(아래) jstl 향상된 for문과 같은 역할 
	jstl을 사용하려면, jsp에서 %@ taglib uri=... 처럼 외부 core를 가져와서 사용한 것처럼
	자바스크립트에서도 외부 core를 가져와야 합니다.(아래)
	-->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<!-- 댓글리스트 템플릿(빵틀) 만들기(아래) -->
	<!-- jsp <c:forEach items="${members}" var="member"> 같은 역할 {{#each .}} -->
	<script id="template" type="text/x-handlebars-template">
		{{#each .}}
		<div class="template-div" data-rno="{{rno}}">
		 <i class="fas fa-envelope bg-blue"></i>
		  <div class="timeline-item">
		   <h3 class="timeline-header">{{replyer}}</h3>
		   <div class="timeline-body">{{replytext}}</div>
		   <div class="timeline-footer">
	 		<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#replyModal">
  				수정
	 		</button>
  		   </div>
		 </div>
		</div>
		{{/each}}
	</script>
	
	<!-- 화면을 재구현Representation하는 함수(아래) -->
	<script>
	var printReplyList = function(data, target, templateObject) {
		var template = Handlebars.compile(templateObject.html());//html태그로 변환
		var html = template(data);//빅데이터를 리스트템플릿에 바인딩 결합시켜주는 역할. 변수html에 저장되었음.
		$(".template-div").remove();//화면에 보이는 댓글리스트만 지우기.
		target.after(html);//target은 .time-label 클래스영역을 가리킵니다.
	};
	</script>
	<!-- 댓글 등록 버튼 액션 처리(아래) -->
	<script>
	$(document).ready(function() {
		$("#insertReplyBtn").on("click", function() {//댓글등록버튼을 클릭했을 때 구현내용(아래)
			//alert("디버그");
			//Ajax를 이용해서, 화면을 Representation (REST-API방식) 부분 화면을 재구현(아래)
			$.ajax({//통신프로그램
				//여기서부터는 프론트 엔드 개발자 영역
				type:'get',//지금은 html이라서 get방식이지만, jsp로가면, post방식으로 바꿔야 합니다.
				url:'board_view.html',//jsp로 가면, ReplyController 에서 지정한 url로 바꿔야 합니다.
				dataType:'text',//ReplyController에서 받은 데이터의 형식은 text형식으로 받겠다고 명시.
				success:function(result) {//응답이 성공하면(상태값200)위경로에서 반환받은 result(json데이터)를 이용해서 화면을 재구현
					//지금은 html이라서 result값을 이용할 수가 없어서 댓글 더미데이터를 만듭니다.(아래)
					result = [
						//{rno:댓글번호,bno:게시물번호,replytext:"첫번째 댓글",replyer:"admin",regdate:타임스탬프}
						{rno:1,bno:15,replytext:"첫번째 댓글",replyer:"admin",regdate:1601234512345},//첫번째 댓글 데이터
						{rno:2,bnt:15,replytext:"두번째 댓글",replyer:"admin",regdate:1601234512345}//두번째 댓글 데이터
					];//위 URL이 공공데이터생각하면,위 데이터를 화면에 구현하면, 빅데이터의 시각화로 불리게 됩니다.
					//printReplyList(빅데이터, 출력할 타켓위치, 빅데이터를 가지고 바인딩된-묶인 템플릿화면);
					printReplyList(result, $(".time-label"), $("#template"));//화면에 출력하는 구현함수를 호출하면 실행.
				} 
			});
		} );
	});
	</script>
	<!-- 댓글리스트에서 수정 버튼을 클릭했을때, 팝업창이 뜨는데, 그 팝업창에 내용을 동적으로 변경시켜주는 구현(아래)  -->
	<script>
	$(document).ready(function() {
		$(".timeline").on("click", ".template-div", function() {//.template-div 댓글 리스트영역
			//$(this);클릭한 댓글에 따라서 this는 첫번째 댓글일 수 도 있고, 두번째 댓글일 수도 있습니다.
			$("#rno").val($(this).attr("data-rno"));
			$(".modal-title").html($(this).find(".timeline-header").text());
			$("#replytext").val($(this).find(".timeline-body").text());
			//alert("디버그" + $(this).find(".timeline-body").text());
			//마우스클릭으로 선택한 댓글의 .timeline-body영역의 text문자를 
			//모달창의 #replaytext영역에 값으로 입력하겠다.
		});
	});
	</script>
	<!-- Modal -->
	<div class="modal fade" id="replyModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">작성자</h5><!-- 작성자는 동적으로 값이 바뀝니다. -->
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	      	<input type="hidden" name="rno" id="rno" value=""><!-- 상단 $(".timeline").on("click" 액션으로 value값이 채워집니다. -->
	        <input type="text" class="form-control" name="replytext" id="replytext" placeholder="내용을 입력해 주세요.">
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	        <button type="button" class="btn btn-primary">수정</button>
	        <button type="button" class="btn btn-danger">삭제</button>
	      </div>
	    </div>
	  </div>
	</div>

<%@ include file="../include/footer.jsp" %>