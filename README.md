## v3.0.0 화면구현
### 20201130(월)
- AdminLTE 사용하면 좋은 이유(아래)
- FontAwesome 제공.사용예시) <i class="fa fa-cc-visa", style="color:red;"></i> , 확대해도 깨지지 않음
- IFram(아이프레임) : 이 태그 사용하면, 예전 프로그래머라고 생각하면 안된다.
- 구글맵(지도), 유튜브 퍼가기에서 사용하고 있는 것이다.
- 화면 레이아웃과는 상관없이 우리 홈페이지에 끼워넣을 때 사용한다.

- SCSS는 CSS 파일을 컴파일한 파일이다.
- .jsp 또는 .java 파일을 컴파일하면 .class 실행파일이 생기는 것과 같은 원리
- 스프링에서 관리자단, 사용자단이 나누어져서 개발된다.(보안때문에 생긴 트렌드)
- 관리자단은 외부 디자인 템플릿을 사용한다. ex) AdminLTE
- 사용자단은 거의 개성있는 내부 디자인 사용한다. ex) 퍼블리셔가 부트스트랩기반으로 작업하는 것이 현재 트렌드

### 20201127(금)
- 반응형 웹페이지 작업 결과를 스프링MVC프로젝트에서 home.jsp로 변환.
- 위 home.jsp결과물 헤로쿠 클라우드에 올릴 예정.
- 최종 결과 : https://leesieun.herokuapp.com(반응형 홈페이지 나오게 한다)
- 파스타 클라우드 초기화 따른 파스타 재신청 처리 예정.
- =====================================================================
- /resources/sample/반응형페이지 : 실제 서비스되는 내용 아님. 퍼블리셔가 만들어서 준 것을 개발자가 여기에 배치하는 공간.
- 위와 같은 콘텐츠를 static콘텐츠라고 한다.(static은 고정적인 내용-html, css, js, img)
- static반대 Dynamic콘턴츠(jsp 프로그램으로 콘턴츠 내용이 수시로 변경되는 영역)
- 대표적인 dynamic콘텐츠 영역: 게시판(게시물 등록하면, 콘텐츠가 동적으로 늘어난다)
- 실제 개발은 WEB-INF/views 폴더에 개발한 결과를 배치한다.
- 헤로쿠 클라우드에서 서비스되는 페이지가 WEB-INF/views 폴더에 위치하게 된다.
- 컨트롤러 자바클래스에서 외부에서 /접근시 index.jsp로 매핑시킴
- 퍼블리셔가 만든 index.html 복사에서 index.jsp 붙여넣기
- jsp 분리 작업 : include 폴더 생성 후 그 안에 header.jsp, footer.jsp 만듦
- index.jsp에서 header.jsp에 들어갈 영역 cut해서 paste 후 확인
- index.jsp에서 footer.jsp에 들어갈 영역 cut해서 paste 후 확인
- booking.jsp, packaging.jsp, review.jsp, contact.jsp 만들기
- 스프링부트 버전2.0 (조그만 동생) : 소규모 프로젝트(스타트업)-조달청에 올라가는 프로젝트X
- > 스프링부트 자동으로 생성되는 코드가 많아서 사용하기 편리. But 커스터마이징 안됨.
- 스프링프레임워크 버전4.3.22 (큰 형) : 중대형프로젝트 - 조달청에 올라가느 프로젝트O
- > 스프링프레임워크는 커스터마이징하는 프로젝트에 유용.


### 20201125(수)
- NCS학습모듈(화면구현) 1단원
- HTML(Hyper-Text-Markup-Language)+CSS(Cascade- Style-Sheet)+JS(JavaScript)
- 위 3가지 작업으로 결과물을 만드는 사람 = 퍼블리셔, 프론트엔드 개발자
- 웹접근성(WebAccessbility): 사회적약자의 이용가능성 체크(프로젝트 제안요청서에 항상 포함됨)
- 크로스브라우징(Cross Browsing):다양한 웹브라우저에서 콘텐츠가 깨지는지 확인.(제안요청서에 항상 포함됨)
- CLI(Command Line Interface):예)cf cli프로그램 설치했었음(파스타)
- GUI(Graphical User Interface):예)이클립스에서 파스타 서버 사용
- HTML5표준으로 만들어야한다:제약조건
- 11, 12번째 과목에서 화면설계서 작성ppt(강사제공), 아키텍쳐구조도엑셀파일(학생), 사용메뉴얼ppt(학생) 제출 (이력서제출시 포트폴리오로 위 2가지 문서 제출하게 된다.)
- 6번째 과목 마치면(내년2월초) 이 프로젝트를 가지고, 위 문서 3가지 만듦 -> 완료보고서 가능
- 이력서 제출시 프로젝트 클라우드 URL(헤로쿠, 클라우드)도 제출.
- ===================================================================
- 유스케이스다이어그램(이클립스):관계(릴레이션, Relation)
- 관계: Generalization(일반화)_ 부모 -자식(상속관계)
- 관계: Include(포함관계)_ footer.jsp(하단logo)-->home.jsp<--header.jsp(상단메뉴, 로고포함)
- 관계: Extend(확장관계, 상속관계)
- ===================================================================
- 테이블태그: <table><tr><th></th></tr><tr><td></td></tr></table>
- tr : table row - 테이블의 가로선
- th : table head- 테이블의 가로선내에 제일 상단에 있는 컬럽(필드)
- td : table data- 테이블의 가로선내의 컬럼(필드)데이터 영역

## v2.0.0 화면설계
### 20201124(화)
- 실행파일 확장자 .jar(java archive실행파일), .war(web archive),.apk(android package실행), .aab(android app bundle실행파일)
- 스프링웹프로그램, 안드로이드앱 제작 후 테스트 2가지 후 운영배포(구글플레이스토어기준)
- alpha 내부 테스트, beta 외부 테스트, 프로덕션(상품)배포

- 모바일용 화면처리 작업 마무리 OK
- index.html 파일에서 슬라이드부분 적용(부트스트랩-외부j쿼리라이브러리이용) OK
- 반응형 사용에 대한 이론설명 OK
- > 반응형의 목적은 1개의 소스로, 스마트폰, 태블렛, PC에서 모든 컨텐츠내용이 잘 보이게 처리하는 것
- > 소스를 스마트폰용과 PC용으로 나눠서 하면, 장점: 소스가 단순해져 만들기 편함/ 단점: 유지보수 어려움
- > 반응형의 장점: 유지보수가 쉬워짐.(소스 한부분만 수정하면 된다.) / 단점:초기에 신규생성 어려움.

- 태블릿용, PC용 화면처리 작업 시작
- 반응형에 필수인 메타태그(아래)
- <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scaleable=no">

- RFP만들기 전에 ISP(정보화전략계획:새로만들시스템의 타당성 조사) : 1억 프로젝트면 1000만 문서화
- IT발주업체(RFP:제안요청서를업로드:발주입찰공고)-IT개발자들(제안서제출:입찰-소속된개발자작업시작)

### 20201123(월)

이론
#### 2단원 : UI 설계
- 기능적 요구사항 : 개발자 담당
- 비기능적 요구사항 : 순간 접속자 수를 100명을 1000명으로 늘려달라는 요구사항(하드웨어 기능 올려야 해결)
- 위 내용은 순간 트래픽 용량을 10M -> 100M로 상향해달라는 요구사항
- Mysql(마리아DB)-회원이 1만명이상이면 시스템이 버벅거리는데, 해결책을 달라고 한다.
- 답변 : 오라클(MS-SQL)로 마이크레이션 해야한다.

- 공공 클라우드(public cloud) : 아마존, 구글클라우드 - 정보를 클라우드 사업사
- (정보유출높음: 관공서X, 대학X, 대기업X(간단한 팀별로 프로토타입만 사용)
- 사설 클라우드(private cloud) : 파스타, 헤로쿠 - 고객회사 구축해서 사용
- (정보유출낮음: 관공서O,대학O)

- ===================================================================

- 교재의 내용상으론 카카오븐 프로토타입(학생) -> 화면설계(강사가 제시) 참조 -> html, java 코딩(학생) 진입
- 카카오 오븐으로 프로토타입 만들었고, 과제물로 제출 예정
- 화면설계서는 강사가 제시한 것 참고해서, 화면구현(html로 반응형)에 사용하게 된다.

--------------------------------------------------------------

실습1: work.html(package.html) 마무리
- 파일 마우스 롤어버 이벤트 모바일용 css적용
- CSS에서 가상선택자란 : 1. 가상클래스, 2.가상요소, 1+2=가상선택자.
- 1. 가상클래스 : *표시 a:hover(a링크인데, 마우스가 a링크 영역 위에 떠있을 때의 영역
- 2. 가상요소 :: *표시:a:hover::before(after)(a링크에 마우스가 떠있을 때, a링크 영역의 앞(뒤) 영역)
- 화면전환효과 : transition 속성 사용
- 페이지 모바일용 css작업 마무리 후, 외부 css파일 분리


실습2: blog.html(review.html) 만들고 확인.

실습3: contact.html - form태그(자료전송하는 역할로 프로그램과 연동하는 부분이라서 중요)


### 20201119(금)
- 페이지 제작 순서
- 1. 이클립스에서 파일생성 후, html 립숨데이터 만들기
- *로렘 입숨(lorem impsu, 줄여서 립숨,lipsum)
- 한글입숨 : http://hangul.thefron.me
- 영문입숨 : https://www.websiteplanet.com/ko/webtools/lorem-ipsum/
- 2. 영역분리하기: 클래스이름 지정하기
- 3. CSS 적용하기 (자바스크립트 작업 포함)
- 4. CSS 분리하기 -> test 후 마무리
- ===================================================================

- 페이지 강력새로고침 단축키 : Ctrl+Shift+R
- 소스 예쁘게 만들기 단축기 : Source 메뉴 > Format, Ctrl+Shift+F

- ===================================================================
실습1: 
- 작업순서7 : 자바스크립트로 햄버거 메뉴의 토글 기능 구현
- 작업순서8 : 본문 section영역 세부 디자인(슬라이드부분). 
- 작업순서9 : footer 영역 세부 디자인. 
-> 사용자CSS(모바일용 헤더, 푸터), 사용자js(햄버거메뉴작동) 파일 분리
- 작업순서10 : 마무리. home(index.html)메뉴의 작업 테스트.
- 1페이지 CSS작업 마무리되면, reset.css처럼 외부로 css파일을 분리하는 작업 함.


- 프로그램에서 대소문자, -, _에 대한 설명
- DB : 테이블명, 필드명 모두 소문자로 표시 통일(필수)
- 자바스크립트, 스프링(자바)에서는 변수/함수명, 클래스명 2가지로 나눈다.
- > 클래스명 : 대문자로 시작한다. (필수)
- > 변수/함수명 : 소문자로 시작한다. (선택적 필수)
- CSS에서는 클래스명에 -이 가능하다. 
- 단, J쿼리(자바스크립트)에서는 변수/함수명에 -이 들어가면 안된다.


- CDN(Contents Delivery Network) : 콘텐츠를 네트워크로 전달받아서 사용하는 방식.
- 어제 수업 시 작동되지 않던 네이티브 자바스크립트 사용 예시
- 작동 안 된 이유) 위에서 아래로 순서를 가지고 실행 한다.
- document.getElementsByClassName는 배열값 리턴
- document.getElementById는 1개 값 리턴


### 20201119(목)

- 작업순서
- 작업순서1 : 이클립스에서 html 만들고, 더미데이터 html 생성.
- 작업순서2 : body에서 3가지 영역 분리. header, section, footer
- 작업순서3 : header 영역의 3가지 영역(로고, 햄버거메뉴, 글로벌네비메뉴)를 배치.
- 작업순서4 : 로고의 세부영역 디자인
- 작업순서5 : 햄버거 메뉴 영역의 세부 디자인
- 작업순서6 : 글로벌네비 메뉴 영역의 세부 디자인
- 작업순서7 : 자바스크립트로 햄버거 메뉴의 토글 기능 구현
- 작업순서8 : 본문 section영역 세부 디자인(슬라이드부분).
- 작업순서9 : footer 영역 세부 디자인.
- 작업순서10 : 마무리. home(index.html)메뉴의 작업 테스트.

- ===================================================================

- 1페이지 CSS작업 마무리되면, reset.css처럼 외부로 css파일을 분리하는 작업 함.
- index.html 더미데이터에 모바일용 CSS 적용 예정.
- 메뉴 클릭에 대한 자바스크립트 적용 예정.
- index.html에 태블릿용 CSS 적용 예정
- index.html에 PC용 CSS 적용 예정

----------------------------------------------------------------------------

실습1 : index.html 더미 데이터에 모바일용 CSS 적용하기
- html(jsp)영역지정방식 : tag방식, class방식, id방식
- id방식 : 현재 html 문서에서 1개만 존재해야함.(로그인 시 사용하는 ID와 같은 기능, 고유값)
- class방식 : 현재 html 문서에서 여러개 존재해도 가능함.
- reset.css를 불러오게 될 예정 (만드는것 X, 가져다가씀O)s
- reset.css : 크로스 부라우징 사전처리 역할
- * 크로스브라우징 : IE, 크롬, 파이어폭스, 사파리 등 다양한 웹브라우저 콘텐츠가 같은 크기로 보이게 하는 역할

'''
  *, :after, :before { /* 콜론 : 의 의미 - 가상요소 */
    -webkit-box-sizing: border-box; /* 크롬, 사파리용 크로스브라우징 때문에 추가  */
    -moz-box-sizing: border-box; /* 파이어폭스용 크로스브라우징 때문에 추가  */
    box-sizing: border-box; /* IE용 박스크기를 지정하는데 테두리 포함하겠다. */
	}

'''

- 인덱스(index) : 색인, 특징-0부터 시작하는 순서를 가지게 된다.
- 대표적인 에러메시지 ( HTTP Status 웹프라우저 상태 에러 )
- > 404 Not Found - 경로에 파일이 없을 때
- > 500 Error : 스프링(자바) 프로그램 에러일때
- 자바스크립트 : 종류 2가지
- 1. 네이티브 자바스크립트 : 오늘 배우고 끝
- 2. jQuery(현재 트렌드) : 앞으로 계속 할 것
- * jQuery : 자바스크립트 프레임워크, j쿼리 코어라고 한다.
- * jQuery 사용법 : 코어파일 필요.(인터넷으로 가져와서 사용 가능, CDN방식)
- 콜백함수 : 고전함수처럼 함수명이 있는 것이 아니고 function()처럼 자동실행되는 함수
- 함수 : 입력값이 있으면 출력값이 있는 것
- 함수 형식 
-  function Add(a,b) {
-	var sum = a+b
-	alert(a + "더하기" + b + "는" + sum + "입니다.");
- }
- 함수실행 : Add(3,5);

### 20201118(수)

- v1.0.0 시험 리뷰
- 과제물 시험은 주로 코드에 대한 주석에 평가가 이루어진다.
- 서술형시험(2건)이 있을 때는 체줄은 강사 이메일로 제출
- 나머지 13건의 시험(포트포리오, 과제물제출)은 카페 게시판에 업로드 제출
- HTTP : 7계층 응용계층(어플리케이션, ex)크롬)
- SSH : 5계층 세션계층(서버에 정보를 저장하는 방식)
- IPv4 : 32비트 (8bit.8bit.8bit.8bit) 8bit x 4 = 32bit
- IPv6 : 128비트 (16bit.16bit.16bit.16bit.16bit.16bit.16bit.16bit)
- 16bit x 8 = 128bit
- ===================================================================
- 회사에서 프로젝트 하면 성공하는 경우는 10건 중에 1건 밖에 안된다.
- 1번 프로젝트하고(4000만원 이상), 1년 무상보수 후, 계속 관계가 유지되는 회사가 좋다.
- 5개월 프로젝트 : 초기 1개월 ERD 만들어야하는데, 안하고 프로그램 들어가면 100% 실패

------------------------------------------------------------------------

실습1 : 카카오 오븐으로 화면 설계
- 빛 색상구조 : Red + Green + Blue = # 3f + 51 + b5
- 빛의 특징 : 더할수록 밝아진다. rgb(255,255,255) = white = #ffffff
- 빛의 특징 : 뺄수록 어두워진다. rgb(0,0,0) = black = #000000
- 빛의 세기(강도)는 0~255 (0 제일어두운것, 255 제일 밝은것)
- 물감의 특징 : 더할수록 어두워진다.
- 색상 : #3f51b5(16진수 3개조합), rgb(함수) = rgb(48, 63, 159)
- * 16진수 : 0,1,2,3,4,5,6,7,8,9,A,B,C,D,E,F(15)
- CSS : Cascade Style Sheet (계단식 스타일 문서표) 함수를 사용 가능하다.
- form(폼) : 자료를 전송할 때 사용하는 html 태그
- 폼요소 = 폼컨트롤 = 폼태그 = 폼엘리먼트 = 폼오브젝트
- 웹프로그램은 자료이동이 핵심 역할, 자료 이동을 개발자가 구현

- ===================================================================


실습2 : html 
- webapp 폴더 내에 resources/sample 폴더 만든다.
- resources 폴더 : 디자인에서 사용하는 리소스
- src/main/resources 폴더 : 자바 프로그램 리소스
- html5 : Hyper Text Markup Language (링크기능)
- > 태그로 구조화된 문서 Document
- * 태그사용 기본 형식 : <태그명> 내용 </태그>
- 홈페이지 진입점 : index.html 
- 자바프로그램 진입점 : main() 메소드
- * 진입점 : 자동 실행되는 부분
- 클래스명은 대문자, 파일명 소문자, DB테이블명 소문자.
- 반응형 페이지를 위한 더미데이터 입력(index.html)


### 20201117(화)
- NCS학습모듈로 V2.0.0 이론수업
- 카카오오븐 https://ovenapp.io/ 에서, 화면설계실습
- 회원가입 후 로그인 미리 확인.
- 목적 : 화면레이아웃(와이어프레임)을 만들어보는 것
- 위 와이어프레임을 기준으로 V3.0.0에서는 html5+J쿼리자바스크립트를 이용해서 반응형 웹페이지 제작
- ===================================================================

이론 
#### 1단원 : UI 요구사항 확인하기
- 아키텍쳐(스키마) : 컴포넌트(플러그인-외부모듈)를 조합해서 프로그램을 만든 것을 말함.
- 프로젝트 마무리할 때 완료 보고서 중 아키텍처 구조도 엑셀파일을 이력서 작성 시 포트폴리오로 제출.
- UI 흐름 : 메뉴(링크) 구조도.(필요한 정보를 찾기 쉽게)
- 실제 현업에서는 사용자 화면보다는 관리자 화면부터 작업한다.
- 관리자 화면(CRUD, 회원관리, 게시판관리) -> 사용자화면(CRUD, 게시판관리, 로그인처리)
- 작업 순서
- 1. 와이어프레임
- 2. 포토샵 작업
- 3. html(css+javascript)퍼블리싱 / 안드로이드 액티비티(위화면설계기준) 만들기
- 4. 스프링(자바) 프로그램 입히기
-----------------------------------------------------

실습1 : 카카오오븐에서 화면 설계하기
- 화면장표(필수) : 화면이름, 화면ID, 화면경로(링크경로), 관련계정, 메뉴바 출력 여부, 비고(픽사베이:무료이미지출처)

## v1.0.0 응용SW기초기술활용과목(4개의 단원)
### 20201116(월) 
- 서술형 예상문제 1-2문제 같이 풀어보기. OK
- HomeController.java 분석 후 수정. OK
- 파스타 클라우드에 스프링 MVC 프로젝트 올리기 -> 도메인으로 접속 확인.
- http://leesieun.paas-ta.org/
- ===================================================================
- edu 데이터베이스에 address2 테이블 만듦
- 물리데이터베이스에 테이블이 1개 추가되었으니, ERD모델에도 테이블 추가된 것을 반영하기
- 물리테이블 추가된 것을 반영하기 위해 ERD 모델에서 싱크(동기화) 시킴
- ===================================================================
- V1.0.0 : 1(메이저버전).0(마이너버전).0(릴리즈버전)
- 릴리즈버전 : 실행버전
- ===================================================================
- 반응형이 무엇을 의미하는지 확인 : 파이어폭스라는 프로그램으로 모바일>태블릿>PC용 디자인 확인.
- 파이어폭스 설치 -> https://miniplugin.github.io/ 이동 -> 요소검사
- reset.css : 크로스브라우징 처리
- 크로스브라우징 : IE, 크롬, 파이어폭스, 사파리 등등 모든 브라우저에서 공통으로 보이게 하는 목적

- ===================================================================
- 깃을 이용해서 소스코드 옮기는 방법
- > 깃 -> Code - Download ZIP 
- > 이클립스 -> 우클릭 - import -> Existing Projects on workspace -> Browse -> 폴더선택 
- > 실행확인 : 프로젝트 우클릭 -> Run as -> Run on server -> 기존프로젝트 빼고 현 프로젝트 추가
------------------------------------------------------------------------

실습1 : HomeController.java 분석 후 수정.
- 분석한 내용: Controller단에서 시간데이터 조작한 내용을 View단으로 자료 전송해서 출력한 예를 분석
- Bean(=클래스) : 스프링이 관리하는 클래스. 빈 = @Controller를 이용해서 빈으로 반자동 등록
- public class HomeController { 내용 }
- 로그를 콘솔에 출력 : Logger(클래스명) logger(변수명) = 실행대상이 되는 클래스를 지정;
- ex) int(데이터타입) age(변수명) = 30;
- 위처럼 변수를 선언하고 로그를 사용하려고 logger변수를 만들었다.
- 로그 출력 : logger.info("출력할 내용...");
- 개발자들이 변수값 확인용으로 사용하는 것이 로그이다. 

실습2 : 파스타 클라우드에 스프링 MVC 프로젝트 올리기 -> 도메인으로 접속 확인.(http://leesieun.paas-ta.org/)
- 깃 사용하기 위해서 git scm 설치한 것처럼, cf(클라우드 파운드리) cli 프로그램 설치
- 헤로쿠는 깃과 바로 연동되는 것이 장점.
- 파스타는 이클립스와 바로 연동되는 것이 장점.
- 파스타 클라우드 설정 파일 : manifest.yml(야믈파일)
- 파스타 에러 메시지: CF-AppInvalid(100001): The app is invalid: VCAP::CloudController::BuildCreate::StagingInProgress
- 파스타 클라우드에 스프링 MVC프로젝트 올리기 후 도메인으로 접속확인 -> 다음과목에서 다시 진행 예정.
- 파스타 정상작동이 확인될 때까지 헤로쿠에서 계속 작업

- ===================================================================

11월17일(화) 시험 공지)
- 과제물제출 50점, 서술형시험 50점
- 과제물 제출 : 구글 문서에 있는 내용
- 서술형 시험 : 응용SW기초기술활용 1,2,3단원에서 각 3문제씩 총 9문제
- 대부분 단답형, SQL쿼리도 2문제 포함
- SQL쿼리 : ERD테이블 그림을 보고 테이블 생성하는 쿼리 만들기, 입력결과 예시를 보고 INSERT 쿼리 만들기

### 20201113(금)
이론
- log : 로그 에러상황을 확인할 때 보통 많이 사용하는 용어, log4j 사용해서 데이터 전송 상황, 에러표시 등을 사용하게 된다.
- IDE : Integration Development Environment, 통합 개발 환경(이클립스, 안드로이드스튜디오, VScode 등)
- MVC : 자바(스프링) 개발 방식, 3가지 분리해서 개발하는 방식, Model, View, Controller
- > Model : 데이터베이스 부분
- > Controller : Model(데이터베이스)과 View(화면)을 연결시켜주는 역할
- > View : home.jsp 이것처럼, 화면부분
- Encoding(코드화) <-> Decoding(복호화)
- ===================================================================
- 1. 헤로쿠에서는 HSQL 메모리 데이터베이스 사용.(서버 on->off 하면 원상복귀)
- : 보통 솔루션은 데모 페이지가 있다. 데모페이지에 자료 등록 가능. 데모페이지의 데이터는 서버를 저녁에 Off했다가 아침에 On하면 데이터가 초기화 됨.
- HSQL 데이터베이스가 위와 같은 상황에서 사용된다.
- 2. 파스타에서는 MYSQL 데이터베이스 사용.(서버 on->off 해도 내용 유지)
- ===================================================================
- 무료 라이센스(저작권) 
- GNU : GNU는 Not Unix 이다. 유닉스 OS 비싸기로 유명, 개발자가 거부감이 있어서 만든 것이 GNU 라이센스이다.
- LGPL2.0 : Library(Lesser) General Public License(일반 목적의 라이센스), 공개 라이센스
- MIT : MIT 공대에서 만든 라이센스, 비영리/영리 구분없이 쓸 수 있는 가장 유연성있는 라이센스
- =================스프링 MVC구조 중 Controller단 분석======================
- 스프링 MVC구조 중 Controller단 HomeController.java 클래스 분석
- 자바클래스는 개발자가 만든다.(백엔드)
- package : 패키지. 자바소스코드(클래스)를 관리하기 위해서 만든 가상 영역
- 도메인구조와 유사) http://controller.edu.org > org.edu.controller
- org.edu.controller 클래스를 초기에 프로젝트 생성할 때 만들었다.
- java폴더 클래스 루트
- org 폴더 안.edu 폴더 안.controller폴더 안에 자바소스코드(자바클래스파일)가 생성
- @import : annotation import 지시어. 외부 라이브러리(모듈)클래스 가져다가 사용하는 목적.
- 추가로 @import는 jsp에서 외부라이브러리(모듈)클래스 가져다가 사용할 때 사용
- 개발자가 import 하는 것 X, 이클립스가 자동으로 import 해줌.
- 자바 주석 : 2가지
- 1. 1줄 주석 : // 로 시작
- 2. 여러줄 주석 : /*...*/ 
- 참고로, html주석은 : <!-- 주석내용 --!>
- 클래스의 MVC 종류 역할 표시 : 3가지 컴포넌트(복합기능)
- 1. @Controller : 지시자 아래 클래스는 컨트롤러 역할이라고 스프링에 명시
- 2. @Service : 지시자 아래 클래스는 프로그램 로직 구현 역할이라고 스프링에 명시
- 3. @Repository : 지시자 아래 클래스는 데이터베이스 Model을 조작하는 역할이라고 스프링에 명시
- 클래스 특징 : 클래스 명은 대문자로 시작
- 이름의 특징 : 낙타등 표기법, Camel 표기법 사용. ex) HomeController
- =====================스프링 MVC구조 중 View단 분석==========================
- 스프링 MVC구조 중 View단 home.jsp 화면 분석.(프론트엔드)
- JSP (Java Server Page) : 스프링 MVC 프로젝트 신규 생성(새문서생성) 시 아래 기본 출력
- <%...%> : JSP 파일에서 자바 프로그램을 사용할 때 <% 자바프로그램 %>
- <%@ page ~~%> : 페이지 지시어 , ex) 페이지 인코딩(한글 처리)
- <%@ taglib ~~%> : 태그 라이브러리 지시어
- taglib = uri("외부자바프로그램용 태그를 가져다가 사용할 주소")
- prefix(접두서-축약어) = "c"
- <%@ page session~~%> : 로그인 상태를 유지할 때 사용.
- 세션 : 원래 웹페이지는 페이지 이동 시, 로그인 정보가 사라진다. 이런 상황을 방지하기 위해 세션(변수) 사용
- session = "true" (세션을 사용하겠다는 의미, 기본값)
- 태그 : 물건 살 때 가격표 태그와 같은 역할을 하는 html 정보 태그
- 타이틀태그(정보), 바디태그(본문정보), p태그(paragraph,문단정보)
- <html><head></head><body><p>서버시간...</p></body></html>
- 이클립스 단축기 : 저장 [Ctrl+s], 뒤로 되돌리기[Ctrl+z], 앞으로 되돌리기[Ctrl+y]

-----------------------------------------------------------------------------------

실습1 : 스프링 MVC프로젝트 구조 확인 -> 데이터 전송 설명 및 수정 예정
- 새 MVC 프로젝트 만들 때 기본 생성되는 파일 2개 분석(용어 설명) 후 수정
- home.jsp + HomeController.java 
- ===================================================================

앞으로의 작업 순서)
- > 이클립스에서 leesieun 프로젝트 소스수정/기능추가.
- > 이클립스에서 수정한 결과 Run on Server로 톰캣에서 확인 OK. http://localhost:8080/
- > Git에 push.
- > Heroku에서 Deploy Branch(깃) 선택 -> 배포
- > Heroku에서 OpenApp 버튼 : https://leesieun.herokuapp.com/

### 20201112(목)
이론
#### 4단원: 개발환경 구축하기 시작
- 빌드(building:건축물): 1. Maven(메이븐,이클립스에서), 2.Gradle(그래들,안드로이드스튜디오 앱)
- ***빌드는 자바소스코드(.java)를 컴파일(.class)하고, 실행가능하게 프로그램모듈을 묶어(패키징)하는 역할.
- 플러그인을 인터넷에서 다운받아서 웹프로그램을 사용하게 된다. 하지만 일일이 해당되는 프로그램을 웹페이지에서 다운받는게 아니고, 플러그인을 인터넷으로 다운받아서 웹프로그램에서 사용하게됩니다.
- *** Maven(메이븐)이라는 프로그램모듈(기능묶어놓은것-조립,분해가 가능것)관리하는 툴로 자동으로 다운로드 받게 됩니다.
- *** 위 메이븐에서 관리하는 프로그램모듈들이 저장되는 위치가 Repository 입니다.
- 국방부(시청,관공서)와 같이 인터넷망이 분리되어 있는 곳은 망이 분리되어 있어서 프로그램모듈을 인터넷으로 다운받지 못해서, 개발도 못하고, 실행도 안된다.
- 그래서, 메이븐(프로그램모듈관리)에서 레포지토리를 설정하는 과정이 필요합니다.
- 프레임워크: 개발에 필요한 여러가지 유틸리티, 플러그인프로그램을 모아서 개발자가 사용하기 편하게 구성해놓은 개발 환경
- 전자정부표준프레임워크 : 10년전에 시작한 스프링(자바)기반 웹프레임워크 입니다.
- 개발자가 사용하기 편하게 구성해 놓은 개발환경이 프레임워크 입니다.
- 전자정부표준프레임워크 = egov
- egov 쓰는 목적은 프로젝트를 발주(수주)할때 전자정부표준프레임워크기반
- egov 기반으로 개발하지만, 회사자체 프레임워크로 추가로 개발합니다.
- 그래서, egov는 기반만 가져다 쓰고, 개발자가 별도 추가로 개발합니다.
- egov 는 삼성SDS, LG CNS, SK C&C 3개 컨소시엄으로 만들었고, 200억정도 비용이 들었습니다.
- egov: jsp, java, spring프레임워크(전자정부표준프레임워크), ibatis(mybatis)
- 스프링(자바)기반의 프로젝트 나라장터 공개입찰 (2000만원 이상)
- 개발하시게 되는 대부분은 4000만원이상, 2개월이상 부터
- 3명 ~ 5명 팀 작업이 진행.
- 제약사항: 전자정부프레임워크기반적용
- 전자정부표준프레임워크를 기반으로 웹프로그램을 제작하는 것을 공부
------------------------------------------------------------------------------------------
실습1: 깃 저장소 만들어서 소스코드버전관리(형상관리) OK
- 깃 github.com 에 아이디/암호 회원가입하십니다.-> leesieun 깃저장소 만듦
- git scm 프로그램을 PC에 설치

실습2: 이클립스에서 톰캣(Tomcat고양이) 웹서버 만들기 OK
- 포트(도메인1개 서비스를 여러개로 분리할때): http://localhost:8080/controller (마리아DB 3306포트)

실습3: 이클립스에서 leesieun 프로젝트 만들고, 메이븐 compile(java->class파일), package(war파일) 3가지 실습 OK
- 스프링 MVC 프로젝트 1개 만들기 (Hello world!)
- 프로젝트선택 -> run as -> maven build... 선택 -> Goals에 compile, package 입력
- POM.xml 파일에서 버전 변경
- Program 에 사용되는 Object Module(외부 프로그램들 = 모듈) 관리하는 파일을 pom.xml이라 한다.
- 스프링-메이븐 프로젝트이면, 필수로 pom.xml 파일이 생성
- pom.xml에 있는 의존성(dependency)은 외부 프로그램 모듈에 대해 의존해서 가져다가 사용한다.
- 서블렛(servlet) : Server 프로그램 let(조각), 미니서버프로그램
- Inject : 삽입, 외부클래스 사용할 때 쓰는 지시어 @inject 사용
- @ : 지시어, annotation 
- Aspect : 관점, 미술에서 사용하던 용어, @Aspect 사용
- 자바버전 : 1.6 -> 1.8 변경
- 스프링버전 : 현재 3.1.1 -> 4.3.22 변경
- pom.xml에서 버전 수정 후에도 변경 안되면, 이클립스 File 메뉴> 제일 하단 바로 위 Restart 클릭
- war(와르파일): Web ARchive 파일: 웹실행파일.
- 이전에는 개발자가 서버관리자에게 웹실행파일을 줄 때 .war 파일을 전달해주고, 서버관리자 war파일을 배포했다.
- 아직도 보안이 중요한 기관(곳)은 위처럼 작업이 진행됩니다.(보안때문에 남아있음)
- 지금은 개발자가 (서버관리자 안 통하고)클라우드에 바로 배포합니다.(대세)
- 깃서버와 이클립스 소스 연동
- 깃 저장 순서 : 커밋(.git폴더에 저장 OK) + 푸시(github.com에 저장 OK)
- 커밋만 하면, github.com에 저장 안 됨.
- 형상관리 =버전관리 = 소스관리 = 팀작업
- 깃에 올릴 때, 제외시킬 폴더 지정. target폴더를 깃에서 제외시키는 방법
 : .gitignore 파일을 만들어서, target 이름을 적음
 
실습4 : 헤로쿠 클라우드에 leesieun 프로젝트 배포, 도메인 URL로 크롬에서 확인  (내일 할 예정)
- 아마존웹서비스(AWS)도 마찬가지, 클라우드 파스타와 마찬가지로, 헤로쿠도 클라우드 설정파일을 작성해야지만 작동이 된다.
- 파일 이름은 Procfile (확장자 없음)
- war : 웹실행파일 / jar(Java ARchive 파일) : 자바 샐행 파일
- pom.xml에서 수정사항이 발생되면, 메이븐 업데이트가 필요하다.
- 헤로쿠와 깃 connection -> Deploy Branch
- ===================================================================

- 이클립스 사용법)
- 화면 왼쪽 상단 : Package Explorer 패키지 탐색기로 보이게 된다.
- Perspective : 개발자 관점(java, eGov개발자 관점)
- 관점이 너무 이상하게 변해있다면, Window 메뉴>Perspective>Reset~ 클릭으로 해결
- 파일저장 : 화면상단 메뉴아이콘 중 디스켓 모양 클릭 또는 Ctrl+s 저장.
- root : 최상위 위치를 가리킨다.

### 20201111(수)
이론

#### 3단원 : 네트워크 기초 활용하기.
- L4스위치: 역할, 분산(분리)해서 에러상황에 대처하는 장비(아래)
- ex) 서비스하는 웹프로그램이 2대의 서버에서 서비스되고 있다.
- 만약 1대가 고장났을때, 나머지 1대로 서비스가 접속되도록 변경시켜(스위치) 주는 장치
- 윈도IP확인: ipconfig
- 리눅스IP확인: ifconfig
- NIC: 네트워크 인터페이스 카드 약자. = 네트워크 어댑터.
- 16진수: 0,1,2,3,4,5,6,7,8,9,A,B,C,D,E,F (숫자10개+문자6개=16개)
- 10진수: 0,1,2,3,4,5,6,7,8,9 (숫자10개)
- 네이버아이디로 로그인 개발(수업에 있음)
- http://127.0.0.1 (개발자용 전용의 PC 아이피) = http://localhost
- 프로토콜(Protocol): 대상이 있는 약속. 
- 위 예, 홈페이지(서버)와 크롬(PC웹브라우저) 사이에 데이터 전송에 사용되는 규칙.
- 프로토콜 사용 예) http(Hyper Text Transper Protocol)
- HTTP 특징: 비연결성(홈페이지 내용 크롬으로 화면에 받은 이후 연결이 끊어짐)
- HTTP 비연결성 단점을 보완하기 위해 소켓통신을 하게 되면, 연결성을 보장받게 됨.
- HTTP ( UDP(User Datagram Protocol): 웹페이지전송-홈페이지내용받고 연결이끊어짐(단점)
- (UDP + TCP:소켓통신사용 )-크롬사용
- SSH 특징: 항상연결됨.(PuTTY 프로그램으로 연결된 후 연결이 끊어지면, 프로그램이 종료됨)
- SSH(TCP:Transper Controll Protocol ) : 항상연결을 유지, 퍼티프로그램 사용
- 통신 패킷: Packet - 패키지상품(묶음상품) - 데이터를 묶어서 전송하는 것.
- 네트웍크 OSI 7 계층(OSI 7 Layer): (아래)
- 7계층(응용계층): 크롬(홈페이지가 표시)
- 2~6계층 : 표현계층, 세션계층, 전송계층, 네트워크계층, 데이터링크계층
- 1계층(물리계층): PC에있는 랜카드(공유기)
-------------------------------------------------------------------------------------------
실습
- SSHD 프로그램 설치 -> PuTTY 프로그램으로 원격 접속 실습
- SSHD(Secure SHell Daemon 서버)

### 20201110(화)
이론

#### 2단원: 데이터베이스 기초 활용하기
- 데이터베이스 언어 분류: DDL, DCL, DML
- DDL: Data Definition(정의) Language 테이블+필드생성명령어 Create Table..., Alter Table
- DCL: Data Control(제어) Language 예, show tables (테이블명을 출력하는 명령어)
- DML: Data Manipulation(조작) Language 데이터 생성, 수정, 삭제명령어 Insert, Update, Delete ...
- Update 명령어는 주의: update member SET name = "김일국"; //이렇게 실행 시말서
- delete from member; //위 3개 데이터 모두 지워집니다.
- delete from member where index = 0;
- update member SET name = "김일국" where index = 1; 이렇게 해서 1개 수정하게처리
- var member = [ {name:"김일국"}, {name:"김일국"}, {name:"남가인"} ];
- var member (=엔티티,테이블-표) = [ 자바-스프링에서는 VO(Value Object)클래스라고 함.
			{name (=속성,필드,컬럼) : "김일국" (=속성값,필드값)} ...]
- * 애스터리스크 , ? 물음표 : 와일드 카드(대체가능한) 문자
- abc.txt = a?c.txt : 물음표는 1개의 문자만 대체가능합니다.
- abc.txt = *.txt : 별표는 여러개의 문자를 대체가능합니다.
- ERD 스키마(구조): 논리모델, 물리모델(Model=데이터베이스)
- 참고: MVC 개발방식, Model(db)-View(jsp,html)-Controller(java)
- 관계: 1:m(many, 1대다관계), n:m(다대다관계)
- 5명 6개월 선문대 : 개발이사1(ERD), 개발팀과장남1,여1(ERD보고 기본CRUD구현), 개발팀대리1(jsp생산), 디자인팀대리1(퍼블리싱)
- CRUD: Create(입력-insert), Read(조회-select), Update(수정), Delete(삭제)
- E-R다이어그램(도형ERD) : Entity(테이블-표) - Relation(관계-닭발) 워크벤치에서 구현
- 제조업 같은 경우: 300인 이상이 중소기업.
- IT 같은 경우: 직원 10인 이상, 연매출액 10억이상 중소기업(주식회사)
- 개발하기전 데이터베이스를 선택: oracle, mysql, maria, mongo 기타 등등
- 용어 : | = 파이프라인 = 또는
- 관계형데이터베이스 관계기호: 1개 : 0개 | 닭발(까마귀발=CrowFoot)
- 관계형데이터베이스: RDBMS(Relational DataBase Management System)
- 관계형: 자료(테이블=표)사이에 부모-자식.
- 게시판(부모) <- 댓글(자식)
- 1개의 게시물(부모) > 댓글(자식들) 1, 2, 3, 4.....
- 만약 게시물-댓글 관계가 없다고 하면, 댓글이 어떤 게시물에 대한 댓글 모르게 됨. 그래서 관계(부-자) 가 필요합니다.
- MySQL 시작(오픈소스-오라클에 팔려서), oracle마무리(상용)
- MySQL 만드사람이 오라클 퇴사 후 자기 딸 이름으로 Maria(마리아) DB를 오픈소스로 만들었습니다. 
- 요즘 오라클회사의 MySQL 유료화 될 수 있기때문에 마리아 DB(MySQL과 호환됨)를 사용합니다.
- 맥(부트캠프기반) 윈도 MySQL실행이 안됨. 겸사겸사 MariaDB로 진행.
- 오라클 Java8 대신에 OpenJDK 8 사용하는 것과 같이(두버전 모두 호환됨) 오라클의 mysql대신에 maria DB(오픈소스)사용 (두버전 모두 호환됨)
- 인덱스(책 마지막 장에 검색어 색인과 같은 의미)
- 인덱스: Index 자료구조에서 순서를 가지는 자료, 0,1,2,3,4,5....
- 인덱스를 가지고, 데이터베이스(테이블) 자료를 입력,출력,수정,삭제 개발자일.
- 대괄호 = [ 테이블 배열 ], 중괄호 = { 한줄배열 }, 소괄호 = ( 매개변수 )
- 인덱스 예 배열변수, var member (=엔티티,테이블-표) = [
			{name (=속성,필드,컬럼) : "김일국" (=속성값,필드값) , gender : "남자", age: 40},
			{name : "이병현" , gender : "남자", age: "서른살"},
			관계형DB 에서는 위처럼 age필드(칼럼) 숫자, 문자 혼합 불가능
                                        noSQL(비관계형 DB)에서는 가능 주로 IoT사용.
			{name : "남가인" , gender : "여자", age: 20}
		];
		
```
- 출력: member[0][name] => "김일국";
- 출력: member[1][name] => "이병현";
- 출력: member[2][name] => "남가인";
```

- index = 색인을 만들면 장점은 검색속도 빨라집니다. 모든검색하지 않고, 검색키값만 검색
- index 자동으로 만들어 집니다. 테이블 생성할때, 기본키(Primary Key: PK)만들때 자동생성
- 데이터베이스 용어중 인덱스가 뭔지 확인: 크롬 > 개발자도구로 확인
- SQL쿼리실행: 위에서 만든 테이블에 데이터 CRUD(입력,조회,수정,삭제)하기 예정.
- SQL : Structure Queary Language 구조적 질의 언어, 체계가 있는 묻고 답하기 언어
- Insert Into 입력테이블명~
- Select from 조회테이블명~ (where)
- Update 수정테이블명 Set 필드명 ~where
- Delete from 삭제테이블명 where ~
-----------------------------------------------------------------------------
실습 전 설정
- 오픈소스참조: sourceforge : wamp 3.2x 기본이 mariaDB (it 강의저장소 3.1x 기본 mysql)
- wamp 실행 -> 워크벤치 실행 -> DB커넥션 실행 + Model 오픈.
-1. MySQL서비스 Stop 중지클릭 -> Remove Service 클릭
- MariaDB포트 3307 -> 3306 변경예정.
- localhost 특별한 도메인PC에서 인식하는 : http://localhost/ 실행(개발자용도메인)
- http://127.0.0.1 (개발자용 전용의 PC 아이피) = http://localhost
- 포트: 서비스 위치( http://kimilguk-mysql.paas-ta.org:80포트 )
- 웹서비스: http://localhost:80 포트
- MySQL 서비스: http://localhost:3306 포트 -> 3308포트로 변경
- MariaDB 서비스: http://localhost:3307 포트 -> 3306포트로 변경
- 톰켓(자바스프링서비스): http://localhost:8080 포트
- 오라클 DB서비스는? : http://localhost:9000 포트
-2. *** 마리아DB데이터베이스 관리자root 암호지정. ( 웹프로그램 개발시 필수 )
- 암호는 공통 으로 지정 : apmsetup
- > phpMyAdmin 웹프로그램에서 암호없이 로그인 
- > 로그인 후 상단 메뉴중 사용자 계정 클릭
- > 제일아래 root 계정 localhost 권한수정 버튼 클릭
- > 권한수정 화면 상단 [암호변경] 버튼클릭
- > 마지막으로 암호 옵션에서 apmsetup 입력처리
-3. *** 마리아DB한글입출력이 가능하게 처리. ( 웹프로그램 개발시 필수 )
- UTF-8: 유니코드 타입 폰트 약자(Unicode Type Font) 다국어:한국어, 일본어, 베트남 등등...
- > wamp 서비스 모두중지 
- > MariaDB에서 my.ini (initialize초기화설정파일) 수정
- > wamp서비스 모두 재실행 끝
- ===================================================================
실습1 : 데이터베이스 ERD -> 실제 물리 테이블로 싱크맞추기
- 물리ERD 만들때, 테이블,필드명은 소문자로 한다. 왜냐하면, 대소문자를 구분해서 Client != client 사용하는 경우가 있다.
- 워크벤치 ERD를 논리모델로 만들어서 실제 물리DB에 밀어넣어서 동기화(싱크)
- 20201111.mwb ( mysql workbench 파일 )
-var member = [
			{name: "김일국", gender : "남자", age: 40},
			{name : "이병현" , gender : "남자", age: "서른살"},
			{name : "남가인" , gender : "여자", age: 20}
		];
- 위 상황에서는 age 에서 에러(error)가 발생
- 이런 에러상황을 방지하기 위해서 데이터형태가 존재 -> 데이터타입
- Type : 숫자(int, number), 문자열(varchar), 글내용(text), 날짜(date, timestamp)
- time stamp(시간 도장) : 1970년 1월1일 부터 지금까지 시간을 1초 단위변환한 값.
- timestamp 값은 1605055186 초 => 1970년기준 초단위변환 => 20201111
- 주석: Comments
- 물리모델ERD 만들 때, 주석입력은 해 주셔야지 개발자들이 작업이 가능하게 됨.
- 데이터타입: varchar(45); 영문자열 45글자를 저장 가능.
- AI: Auto Increment 자동증가: 1, 2, 3, 4 int 정수값을 자동으로 입력해 줌.
- AI로 자동증가된 정수값을 색인 Index용으로 사용하게 됨
- NN(Not Null): 빈 공백 값을 허용하지 않겠다.
- PK(Primary Key): 기본키(고유식별키) 색인키 index키
- PK는 사람으로 치면 주민번호와 같은 역할(우리나라에 고유1명)
- N/A: No Account 테이블에 아무것도 없다.
- 물리모델ERD(설계도)를 실제 데이터베이스 edu에 싱크로나이즈(동기화)시키면, 
- edu 데이터에베이스 테이블이 만들어 집니다.

실습2 : 테이블에 자료 CRUD(입력,조회,수정,삭제) 작업예정.
- CRUD SQL쿼리 실행
- Auto Increament : 자동증가처리 개발자를 편하게 해주는 대신, 중간 이빨이 빠진 번호가 생깁니다.
- 나중에 jsp(html)에서 출력시 처리해서, 이빨빠진것 없이 보이게처리합니다.
- 위와 같은 것을 다른 Paging 처리 한다고 합니다.
- 페이징처리 한다고해서, 위 에 DB select 원본값이 변하는 것이 아니고, 웹프로그램 화면에서 보이기만 이빨 안빠지게 보이게 합니다.
- 데이터가 10개 입력되어 있다면,
- delete from client where client_id = 10;
- 클라이언트 테이블에서 클라이언트_아이디가 10번인 가로줄을 삭제하겠다.
- insert into client values('값1', '값2', '값3', now());

- ===================================================================
- Q: 우편번호, 연락처는 문자열(varchar) 했은데, 숫자기 때문에 int으로 해야..
- A: 유연한 개발을 하기 위해서, 우편번호:111-11, 연락처:010-111-1111
- 유연한 개발을 위해서, 확실한 숫자값이 아니면, 문자열로 하시는 것이 좋습니다.
- SQL쿼리 실행시 에러확인: table already exist 기존에 테이블이 있으니, 먼저 처리하고, 다시실행.

- ===================================================================
복습
- 1단원: 운영체제 기초기술 활용: 버추얼박스설치,우분투실행,리눅스 명령어실행. 크라우드 가입(6개월내내사용)
- JDK설치.
java -version 확인
javac (자바컴파일러=번역기) : 영문 개발자 java코드를 기계가 알아보는 class코드로 번역해줍니다.
-> Helloword.java코드가 실행되는것이 아니고, Helloword.class파일이 실행되게 됩니다.

- 호스트OS: 윈도 7, 10 <- 버추얼박스: 가상화장치(vt-x) -> 게스트OS: 우분투(리눅스)
- 앱(안드로이드)
- 윈도기반 - 안드로이드 스튜디오 툴기반 AVD(vt-x) -> 갤럭시폰 애뮬레이터 실행
- 마지막 내년 4월에 위 App개발때문에 vt-x필요(학원PC로 하시면 문제 없음)

- OpenJDK 확인: JDK 가 없으면 아래상황이 발생 됩니다.
-> 자바로 만들어진 프로그램(이클립스X, DB워크벤치X 등등)이 실행 안된다.

### 20201109 (월)
이론

#### 1단원: 운영체제 기초기술 활용
- : 콜론,  ;세미콜론=함수종료,한줄 종료,  :  ;  ,
- 키:값 배열변수 예, var member = [
			{name : "김일국" , gender : "남자"},
			{name : "이병현" , gender : "남자"},
			{name : "남가인" , gender : "여자"}
		];
		
```
- 출력: member[0][name] => "김일국";
- 출력: member[1][name] => "이병현";
- 출력: member[2][name] => "남가인";
```
- 윈도하단 작업표시줄>오른쪽버튼>작업관리자
- 위 작업관리자>세부설정>우선순위설정(프로그램우선순위)
- GUI: 그래픽유저인터페이스, 탐색기(윈도)
- CLI: 커맨드라인인터페이스, 명령프롬프트(윈도), 배시쉘(리눅스)
- 클라우드: 가상화기반의 서비스 3가지(아래).
- IaaS(아이아스, 이아스): 인프라 as A 서비스.  오픈스택
- PaaS(파스): 플랫폼 as A 서비스. 한국정화진흥원의 파스타,속도빠름
-> 파스타 단점은, 1년 1번은 초기화 됩니다. 클라우드 4G까지 무료지원
-> 헤로쿠(Heroku)클라우드: 5개 프로젝트 까지는 무료.단, 속도가 느림
- SaaS(사스): 소프트웨어 as A 서비스. 구글 문서, 프레젠테이션, 스프레드시트
- IaaS(인프라-서버) > PaaS(인프라+개발자) > SaaS(개발자)
- 프로세서: 1개 프로그램과 동일.
- =실행중인프로그램=인스턴스(자바)=오브젝트(자바)=스레드(자바)
- 애플리케이션Application(PC 용) = 앱App (모바일용)
-----------------------------------------------------------------------------------
실습진행: 버추얼박스설치 > 우분투실행 > 리눅스명령어 실행실습

실습1: 버추얼박스 설치 후 우분투에서 리눅스(OS) 명령어 실행
- 호스트OS: 윈도 7, 10 <- 버추얼박스: 가상화장치 -> 게스트OS: 우분투(리눅스)
- Ubuntu에서는 
- find /home -name "*.cfg"
- Permission denied
- sudo : super user do 실행하겠다. 슈퍼유저로 명렁어 실행하겠다. 암호입력필요
- sudo find /home -name "*.cfg"
- osboxes.org (암호입력)

실습2: 구름IDE에서 컨테이너 1개 생성(C/C++)해서 리눅스(OS) 명령어 실행
- 구름IDE에서는
- find ./ -name "*.c"
- find ./ -name "main.c" (파일이름 검색 명령어)
- uname -a (리눅스 버전 확인 명령어)
- C언어 할 때, 구름IDE 클라우드에서 C언어로 구구단, 은행입출금 프로그램 제작예정.

실습3: 파스타클라우드 신청, 헤로쿠클라우드 신청: 앞으로 6개동안 지겹도록 하실 내용.
- 파스타 : 회원가입 시 등록한 이메일로 확인 메일 받으면, 같이 진행
- 헤로쿠: 다같이 신청 후 바로 사용 가능
-> 깃repository(저장소)에 작업한 결과를 푸시(업로드) 소스관리.
-> 위 깃소스를 헤로쿠에 Deploy(배포)해서 서비스를 하게 됩니다.
-> https://kimilguk.herokuapp.com 이렇게 서비스 도메인이 자동으로 등록됩니다.
-> 단, 최초 실행 속도가 느리다는 것이 단점.
-> zzz : 잠자고 있다는 표시.

OpenJDK, 이클립스(전자정부개발환경3.9버전), 톰캣(웹서버) 다운
- JAVA 개발 툴설치: Java Delvelopement Kits 오라클 8버전(1.8) 유료화
- Open JDK를 설치해서 자바개발환경을 만들게 됩니다.
- 평가가 보통은 1가지, 2가지(서술형, 과제물제출 서식)
- 이클립스기반 스프링, mysql, 클라우드.
- 프로젝트 웹에이전스 : 100 ~ 300만 1달 20~30개
- * 프로젝트 솔루션개발또는 SI업체 : 2000만 ~ 1억 ~ 2억 : 1개당 3개월 ~ 12개월
 - 위 SI 관련 프로젝트(교육기간:3달) 10개 중 2개 안드로이드 앱.(교육기간:1달)
- 5명 6개월 선문대 : 개발이사1(ERD), 개발팀과장남1,여1(ERD보고 기본CRUD구현), 
- 개발팀대리1(jsp생산), 디자인팀대리1(퍼블리싱)
- 작업프로젝트 납품할 때, 개발환경, 실행버전, 반드시 적어야 납품이 가능하다
- ===================================================================
- VT 설정 안된 사람은 https://www.osboxes.org/ubuntu/ 에서  Ubuntu 16.04.6 Xenial 32bit 다운받은 후 같이 진행 하십니다.
- 안드로이드 앱 하실때, 같은 문제가 발생한다.
- 우분투 16.04.6 버전의  vdi(버추어 디스크 이미지) 저장했습니다.
- 프로그램 관련해는 한글폴더에 저장위치를 잡으면 안된다.
- vt-x: 바이오스(CMOS)에서 설정 바꿔야야 합니다.
- CMOS바이오스 진입하는 방법 4가지(종류가 여러가지라서...)
- PC전원을 껐다가 켜시고, 바로 [F1], [F2], [F10], [Del]
- Virtualization Technology [disabled] 찾으셔서, 바꾸고 저장-> [enabled] 바꾸시고, [F10] 저장후 재부팅

## OT
디지털컨버전스반
강사: 김일국 (010-8175-6075)

이메일: boramcom@daum.net

강사 블로그: http://blog.daum.net/web_design

IT강의저장소: https://github.com/miniplugin/human
- 우리반은 윈도우기반(PC, 노트북)으로 수업을 진행합니다.
- 오프라인 수업 시, 종이시험지, 과제물 업로드
- 온라인(줌수업)에서는 그림판 이미지 시험지
- 그림판 수정 후 과제물 업로드 하시게 됩니다.
- 서술형시험은 오픈북
- 작업결과는 깃허브에 푸시(업로드)해서, 소스관리하게 됩니다.
- Github:  VCS(버전관리시스템)
- 웹 프로그램 만들기(중간목표) -> 이력서 포트폴리오제출 -> 취업(목표)
- 웹프로그램만들기 위해서 배우는 언어들: 자바스크립트+자바
- 웹프로그램만들기 위해서 배우는 프레임워크: 스프링
- 웹프로그램만들기 위해서 배우는 데이터베이스: mysql, oracle
- 웹프로그램만들기 위해서 배우는 클라우드: 파스타, 헤로쿠
- 자바가 오라클 회사 소유입니다. 자바8(1.8)버전부터 유료화.
- 오픈JDK( 자바개발툴 Java Developement Kit) 8(1.8)으로 개발.
- 현업에 가셔도, jdk7 버전까지는 무료기 때문에...
- 현업에 가시면, openjdk 사용하게 됩니다.
- 요즘 핫트렌드 프로그램부분(3가지)
- 1. RestAPI(빅데이터 처리): 시각화, 댓글처리, 네이버아이디로그인
- 2. 클라우드 서비스: 파스타, 헤로쿠 클라우드에 스프링 웹프로그램 서비스
- 3. IoT: 통신(인터넷)으로 하드웨어 제어(1달)
- 아두이노-안드로이드 앱이용 전구 켜기|끄기
- 라즈베리파이-UART통신(USB:컴퓨터PC to Serial:라즈베리PC)
- 취업하실 곳은 서울(구로,가산), 경기(판교) 취업예상 됩니다.
- 개발자 초임(서울): 연봉2400~2800만( 직원10명 이상, 연매출 10억인, 법인(주식회사) )
- 1달기준, 마지막주 4번째 주 기간에, 5분-10분학생-강사면담.
- 11월달 마지막주 개인카톡으로 질문 사항에 대한 답변, 
- 카톡 면담 화두, 희망 취업분야 알려 주시면, 참고하고, 개인카톡으로 답변을 드리겠습니다.
- 희망취업분야: 백엔드쪽(자바스프링), 앱분야(안드로이드), 프론트엔드쪽(부트스트랩같은js분야)
- 솔루션 + SI(대상업체 맞게 커스터마이징-개발 납품) 한꺼한에 묶여 있습니다.
- 솔루션기반: 전자정부표준프레임워크(이클립스+스프링 4.3.22 버전기반)
- 카톡면담 기간은 11월 23일부터 11월26일까지,
