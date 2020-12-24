//PC용메뉴 보이기/숨기기 함수 정의(아래)
var isOver1 = false;
var isOver2 = false;
function goHide1() {
	if (!isOver1 && !isOver2) {
		$('.gnb_depth2_1').stop().fadeOut('fast');
	}
}
var isOver11 = false;
var isOver22 = false;
function goHide2() {
	if (!isOver11 && !isOver22)	{
		$('.gnb_depth2_2').stop().fadeOut('fast');
	}
}
var isOver111 = false;
var isOver222 = false;
function goHide3() {
	if (!isOver111 && !isOver222) {
		$('.gnb_depth2_3').stop().fadeOut('fast');
	}
}
var isOver1111 = false;
var isOver2222 = false;
function goHide4() {
	if (!isOver1111 && !isOver2222) {
		$('.gnb_depth2_4').stop().fadeOut('fast');
	}
}
	
$(document).ready(function(){
	$(".s_point").smoothScroll();
	//모바일메뉴 보이기
	$(".openMOgnb").click(function() {
		$("header").addClass("on");
		$(".header_cont").slideDown("fast");//display:none인 메뉴보이기
		$(".closePop").show();
		//모바일메뉴가 나왔을때는 touchMove이벤트를 사용중지(아래)
		$("body").bind("touchMove", function(e){preventDefault();});
	});
	//모바일메뉴 숨기기
	$(".closePop").click(function(){
		$("header").removeClass("on");
		$(".header_cont").slideUp("fast");
		$("body").unbind("touchMove");
	});
	
	//PC용 메뉴 롤오버 호출부분(아래)
	//gnb_depth2_1	첫번째메뉴 마우스액션
	$('.openAll1').mouseover(function(){
		if ( parseInt($('header').css('width')) > 1055 ) $('.gnb_depth2_1').fadeIn('fast');
		isOver1 = true;
	});	
    $('.openAll1').focus(function(){
		if ( parseInt($('header').css('width')) > 1055 ) $('.gnb_depth2_1').fadeIn('fast');
		isOver1 = true;
	});
	$('.openAll1').mouseout(function(){
		isOver1 = false;
		setTimeout("goHide1()",200);
	});	
	$('.gnb_depth2_1 li:last-child a').blur(function(){
		isOver1 = false;
		setTimeout("goHide1()",200);
	});	
	$('.gnb_depth2_1').mouseover(function(){
		isOver2 = true;			
	});	
	$('.gnb_depth2_1').focus(function(){
		isOver2 = true;			
	});	
	$('.gnb_depth2_1').mouseout(function(){
		isOver2 = false;
		setTimeout("goHide1()",200);
	});	
	$('.gnb_depth2_1').blur(function(){
		isOver2 = false;
		setTimeout("goHide1()",200);
	});	
	//gnb_depth2_2	
	$('.openAll2').mouseover(function(){
		if ( parseInt($('header').css('width')) > 1055 ) $('.gnb_depth2_2').fadeIn('fast');
		isOver11 = true;
	});
	$('.openAll2').focus(function(){
		if ( parseInt($('header').css('width')) > 1055 ) $('.gnb_depth2_2').fadeIn('fast');
		isOver11 = true;
	});
	$('.openAll2').mouseout(function(){
		isOver11 = false;
		setTimeout("goHide2()",200);
	});	
	$('.gnb_depth2_2 li:last-child a').blur(function(){
		isOver11 = false;
		setTimeout("goHide2()",200);
	});	
	$('.gnb_depth2_2').mouseover(function(){
		isOver22 = true;			
	});	
	$('.gnb_depth2_2').focus(function(){
		isOver22 = true;			
	});	
	$('.gnb_depth2_2').mouseout(function(){
		isOver22 = false;
		setTimeout("goHide2()",200);
	});	
	$('.gnb_depth2_2').blur(function(){
		isOver22 = false;
		setTimeout("goHide2()",200);
	});	
	//gnb_depth2_3	
	$('.openAll3').mouseover(function(){
		if ( parseInt($('header').css('width')) > 1055 ) $('.gnb_depth2_3').fadeIn('fast');
		isOver111 = true;
	});
	$('.openAll3').focus(function(){
		if ( parseInt($('header').css('width')) > 1055 ) $('.gnb_depth2_3').fadeIn('fast');
		isOver111 = true;
	});
	$('.openAll3').mouseout(function(){
		isOver111 = false;
		setTimeout("goHide3()",200);
	});	
	$('.gnb_depth2_3 li:last-child a').blur(function(){
		isOver111 = false;
		setTimeout("goHide3()",200);
	});	
	$('.gnb_depth2_3').mouseover(function(){
		isOver222 = true;			
	});	
	$('.gnb_depth2_3').focus(function(){
		isOver222 = true;			
	});	
	$('.gnb_depth2_3').mouseout(function(){
		isOver222 = false;
		setTimeout("goHide3()",200);
	});	
	$('.gnb_depth2_3').blur(function(){
		isOver222 = false;
		setTimeout("goHide3()",200);
	});	
	//gnb_depth2_4	
	$('.openAll4').mouseover(function(){
		if ( parseInt($('header').css('width')) > 1055 ) $('.gnb_depth2_4').fadeIn('fast');
		isOver1111 = true;
	});
	$('.openAll4').focus(function(){
		if ( parseInt($('header').css('width')) > 1055 ) $('.gnb_depth2_4').fadeIn('fast');
		isOver1111 = true;
	});
	$('.openAll4').mouseout(function(){
		isOver1111 = false;
		setTimeout("goHide4()",200);
	});	
	$('.gnb_depth2_4 li:last-child a').blur(function(){
		isOver1111 = false;
		setTimeout("goHide4()",200);
	});	
	$('.gnb_depth2_4').mouseover(function(){
		isOver2222 = true;			
	});	
	$('.gnb_depth2_4').focus(function(){
		isOver2222 = true;			
	});	
	$('.gnb_depth2_4').mouseout(function(){
		isOver2222 = false;
		setTimeout("goHide4()",200);
	});	
	$('.gnb_depth2_4').blur(function(){
		isOver2222 = false;
		setTimeout("goHide4()",200);
	});	
	
});