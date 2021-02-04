$(document).ready(function(){
  $(".m-title").click(function(){
   $(".mobile").toggle("slow");
  });
});
$(document).ready(function(){
  $(".t-title").click(function(){
   $(".tablet").toggle("slow");
  });
});
$(document).ready(function(){
  $(".p-title").click(function(){
   $(".pc").toggle("slow");
  });
});
$(document).ready(function(){
  $(".sec-title").click(function(){
   $(".spring-sec").toggle("slow");
  });
});

$(document).ready(function() {
	$(".menu-toggle-btn").click(function(){
		//alert("제이쿼리로 햄버거메뉴를 클릭하였습니다."); // 디버그
		$(".menu").stop().slideToggle("fast"); // j쿼리는 뒤에서 앞으로 해석
		// gnb 클래스에 대한 액션. 마지막에 멈춰라. <- slideToggle을 실행해라. <- 빠르게.
	});
});