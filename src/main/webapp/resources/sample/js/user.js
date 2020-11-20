/* 자바스크립트 시작 */
// 네이티브(오리지널) 자바 스크립트로 햄버거 메뉴 액션 구현
// document.getElementById("css 아이디영역");
// 함수의 기본형은 아래와 같다.
function Add(a,b){ // a, b 받아서 매개변수=인자=파라미터
	var sum = a+b;
	alert(a + "더하기" + b + "는" + sum + "입니다.");
};
// Add(3,5); // 함수 실행하기

// jQuery 기본 형식 사용
$(document).ready(function() {
	$(".menu-toggle-btn").click(function(){
		//alert("제이쿼리로 햄버거메뉴를 클릭하였습니다."); // 디버그
		$(".gnb").stop().slideToggle("fast"); // j쿼리는 뒤에서 앞으로 해석
		// gnb 클래스에 대한 액션. 마지막에 멈춰라. <- slideToggle을 실행해라. <- 빠르게.
	});
});
//native 자바스크립트로 햄버거메뉴 제어하기 : 위에서부터 아래로 실행된다. 
//document.getElementById : 1개의 값만 리턴(촐력)
//document.getElementsByClassName : 배열값을 리턴(출력)
/* window.onload = document_ready; // 문서를 미리 읽어들이고 함수 실행. j쿼리의 $(document).ready() 와 같다.
function document_ready(){
	var menu_toggle_btn = document.getElementsByClassName("menu-toggle-btn");
	menu_toggle_btn[0].onclick = function() {
		alert('native js로 햄버거메뉴를 클릭하였습니다.');
	}
} */

/* 자바스크립트 끝 */