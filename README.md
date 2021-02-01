##  스프링 작업 순서
- [X] 스프링  HelloWorld MVC 프로젝트 org.edu.controller 제작 OK
- [X] 스프링 HelloWorld MVC 프로젝트 edu.org.controller 제작OK.
- [X] wamp(만세아이콘)으로 마리아DB(3306포트) 설치, 사용자암호 추가 및 한글처리OK.
- [X] 워크벤치 설치 및 ERD 작성연습, 샘플DB(edu)임포트 및 리버스 엔지니어링으로 ERD제작OK.
- [X] 샘플반응형 웹페이지(mobile,tablet,pc용) 및 J쿼리 페이지 작성OK.
- [X] 스프링 프로젝트 관리자단 AdminLTE(부트스트랩)기반으로 제작OK.
- [X] 스프링 테스트 pom.xml(외부라이브러리 가져다가 사용하는 방식) 디펜던시 의존성 추가OK.
- [X] Maven 기반 전자정부표준프레임워크 egov3.9버전 -> 3.10으로 업드레이드OK.
- [X] junit(JavaUnit) 테스트 설정 후 기본 unit유닛(단위)테스트OK.
- [X] jdbc(JavaDataBaseConnection)사용 pom.xml 의존성 추가OK.
- [X] Mysql사용 pom.xml 의존성 추가OK.
- [X] 마이바티스 사용(CRUD쿼리를관리하는툴) pom.xml 의존성 추가OK.
- [X] junit으로 DB접근 후 관리자단 회원관리 CRUD unit테스트 마무리.OK
- [X] @Component어노테이션 사용으로 MemberVO 인젝션 사용 가능OK.
- [X] DB 디버그용 드라이버 사용 pom.xml 의존성 추가 후, log4jdbc.log4j2.properties 추가 OK.
- [X] 실제 회원관리 화면 CRUD 적용 중 member_list(select+검색) 처리 후 페이징 처리 OK.
- [X] member_write, member_update, member_delete 만들기 OK.
- [X] 스프링 AOP(관점지향프로그래밍-OOP의 확장기능)기능으로 개발용 디버그출력환경 만들기 OK.
- [X] 관리자단 게시판 화면 CRUD 적용OK.
- [X] 트랜잭션 @Tansactional추가: root-context.xml에서 dataSource에 트랜잭션 설정추가필수OK.
- [X] 파일업로드 라이브러리 사용 pom.xml 의존성 추가.
- [X] 게시판 업로드 화면 구현.
- [X] Json데이터 사용 pom.xml 의존성 추가.
- [X] 실제 댓글 화면CRUD적용.(우리가 만들어서 제공 Rest-API백엔드단)
- [X] 사용자단 html(https://miniplugin.github.io/) 소스를 커스터마이징 후 jsp로 만들기.
- [X] 스프링시큐리티 로그인 구현 pom.xml 의존성 추가(회원가입시 패스워드 암호화 추가).
- [X] 헤로쿠 클라우드로 배포(Hsql데이터베이스사용).
- [X] 사용자단 CRUD 구현.
- [X] 이후 유효성검사, 파스타클라우드, 네이버아이디 로그인(네이버에서 제공Rest-API백엔드단) 사용 등등. pom.xml 의존성 추가.
- [ ] 오라클로 마이그레이션 작업.

### 오라클로 마이그레이션
- 수정1. now() -> sysdate
- 수정2. limit 사용된 페이징 쿼리 -> 제거 후 기능 변경 (ROWNUM 예약어 사용, concat() -> || 연결문자 사용)
- 수정3. limit 사용된 조회 쿼리 -> 제거 후 기능 변경 (TOP 예약어 사용)
- 수정4. <부등호 들어있는 쿼리 : <![CDATA[ 부등호가 있는 쿼리 ]]>
- 수정5.  insert의 AI(자동증가) 부분 처리 : 마이바티스의 selectKey태그를 이용해서 시퀀스 처리

## v6.0.0 UI구현
### 20210201(월)
- 시작전, 댓글 한개 등록 후 삭제  -> 다시 등록 -> 페이징처리 안나옴 문제 해결
- 시작전, 조회수 카운트도 필드값 NULL 때문에 증가가 안되는 부분 처리 예정(NVL 추가)
- > ORACLE : NVL(V1,V2)
- > MYSQL : IFNULL(V1,V2)
- > MSSQL,HSQL : ISNULL(V1,V2)
 

### 20210129(금)
이론
- 테이블 정도(메타데이터=데이터딕셔너리)와 테이블 내용(데이터-회원/게시물데이터) 차이 확인
- SQL*PLUS는 CLI(명령어라인인터페이스), SQL Developer는  GUI(그래픽유저인터페이스)
- 산술연산자 : +, -, *, /
- 논리연산자 : OR(+), AND(*), NOT(!Inverse)
- 필드명 BETWEEN A AND B : 필드값이 A부터 B까지
- 필드명 IN(배열) : 필드값에 배열에 있는 값을 포함되어 있는지 비교
- 자바 프로그램에서 특수문자는 \s로 s라는 문자가 아니고, 공백이라는 특수문자임을 나타냄
- 위와 같은 \문자에서 \ 역슬래시를 ESCAPE문자라고 하고 정규표현식에서 많이 사용됨.
- DISTINCT : 오라클 전용으로 중복 데이터 삭제용도, 출력물에서 셀 병합시 필요
- 보통 출력툴(레포트툴)이 2000만원 이상
- 오라클 전용 쿼리에서 3개이상의 문자열 연결할 때 파이프라인 특수문자를 사용.


실습
- 테스트 절차 : 게시물 신규 등록, 게시물 신규 등록 시 첨부파일도 신규 등록.
- 수정5 : insert의 AI(자동증가) 부분 처리 : 마이바티스의 selectKey태그를 이용해서 시퀀스 처리

### 20210128(목)
- 시작 전, 어제 백업받은 DATABASE폴더에 oracle_20210127.spl 파일 복원
- 스프링 프로젝트를 오라클로 마이그레이션하기 전 이클립스 준비 작업
- ojdbc6.jar등록 : 스프링에서 오라클 서버에 접속하는 드라이버 클래스 파일
- > pom.xml로 외부 모듈 추가하지 않고, 직접 jar파일 외부모듈 등록
- 매퍼(마이바티스)쿼리에서 오라클 전용일 때 수정할 부분 : boardMapper.xml 처리중
- > 수정1. now() -> sysdate
- > 수정2. limit 사용된 페이징 쿼리 -> 제거 후 기능 변경 (ROWNUM 예약어 사용, concat() -> || 연결문자 사용)
- > 수정3. limit 사용된 조회 쿼리 -> 제거 후 기능 변경 (TOP 예약어 사용)
- > 수정4. <부등호 들어있는 쿼리 : <![CDATA[ 부등호가 있는 쿼리 ]]>
- * 참고 : hsql용 최근 게시물 한 개 뽑아낼 때 쿼리 

```sql
select top 1 bno from tbl_board order by bno desc
```

이론
- SQL : Structured Query Language(구조화된 질의 언어) CRUD 목적의 언어
- Ansi SQL : (미국)표준 SQL -------< 표준 SQL위주로 공부해야함
- 오라클 전용 SQL(전용함수이용, 기능 많음), MS SQL(마이크로소프트사 전용)
- root-context.xml에서 오라클 커넥션 bean(스프링용클래스)을 생성하고, mybatis용 쿼리 생성 예정
- DQL(Select)
- DDL(Create, Alter, Drop)
- DML(Insert, Update, Delete)
- DCL(Commit, Rollback..)
- SQL*PLUS : RUN SQL Command line 실행 -> CONNECT XE/apmsetup XE사용자로 접속
- SELECT * FROM DEPT;
- DELETE와 TRUNCATE 차이점 : 둘 다 테이블 내용을 삭제하는 것은 동일
- DELETE : 100개의 레코드를 지우면, 내용은 지우고, 100개의 공간은 남는다.
- > AI 자동증가 값이 delete 이후 신규등록하면, 101로 자동증가값이 잡힌다.
- TRUNCATE : 100개의 레코드를 지우면, 내용도 지우고, 100개의 공간도 날아간다.
- > AI 자동증가 값이 delete 이후 신규등록하면, 1로 자동증가값이 잡힌다.
- 접속세션에서 commit;을 하지 않으면, 접속 해제시 작업한 내용이 사라짐. 반드시 커밋 필요.


### 20210127(수)
- [X] 오라클 마이그레이션하기 전 외부 준비 작업
- 오라클 DB 서버 관리 화면 기본 URL:8080을 사용한다. 톰캣기반의 스프링웹프로젝트 http://localhost:8080을 실행한 상태에서 오라클을 설치해야 8080을 피해서 9000포트로 설치할 수 있다.
- 오라클 DB 서버 설치 후 사용자 생성 및 테이블 스페이스 생성
- 테이블 스페이스 XE의 사용자 XE/암호 apmsetup 생성
- > XE (Mysql의 스키마, DB같은 의미)
- 오라클용 DB관리툴 sql developer 소프트웨어 압축푼 후 접속. ERD 만들어서 물리 DB로 내보내기
- ERD만들기 : 메뉴 파일 -> Data Modeler -> 임포트 -> 데이터딕셔너리(데이터사전= XE안의 테이블)
- ERD 만든 이후 싱크 맞추기.
- 오라클은 AI PK 자동증가 기능 없기 때문에 시퀀스 기능으로 대체
- 프로시저 : sql로 만드는 프로그램이 프로시저.
- > 더미데이터 생성(회원 100명, 게시물 100개)
- 오라클 전용 방식
- > 1. select는 항상 from 테이블명 필요. 테이블이 없는 select에서는 가상테이블인 dual을 사용
- > 2. 오라클 변수 사용 시 V_USER varchar2(20):='user'; 대입연산자 = 대신 := 사용
- > 3. 프로시저를 생성/수정 반드시 컴파일이 필요하다.(Mysql과 다른점)
- > 4. 작업 후 반드시 commit;을 해야함.
- > 5. sql developer 인코딩 설정 변경 필요. 복원시 한글이 깨질 때 처리. 도구 -> 환경설정 -> 환경메뉴 -> 인코딩 UTF-8
- > 6. 쿼리 : IF같은 비교문에서 비교조건 중 같다는 = 등호 한개, concat('첫번쨰', '두번째'); 문자열 합치는 함수


### 20210126(화)
- boardTypeMapper.insertBoardType does not contain
- > 매퍼쿼리 확인해서 해결
- [X] 게시판 생성 관리 : CRUD 중 미처리한 C부분 처리 
- [X] 사용자 홈페이지 최신 갤러리, 최신 게시물 다중 게시판 적용
- [X] Hsql 변환 후 헤로쿠 배포
 

### 20210125(월)
- 세션변수 session_board_type을 컨트롤러, 서비스, DAO, 매퍼 모두 VO기준 get/set 발생할 때 세션 변수를 사용할 예정. AOP또는 Interceptor가로채기 클래스를 이용해서 구현예정.
- AOP로는 session_board_type변수를 생성 관리
-AdviceController로는 board_type게시판 타입 리스트(List<BoardTypeVO>)를 jsp모델값으로 전송해주는 인터셉터 기능을 사용하여 메뉴 관리
- 기존 작업한 BoardVO 와 PageVO 2군데 주석처리 -> //this.board_type = "notice";//세션변수를 사용할 예정. 

- 컨트롤러에서 PageVO 또는 BoardVO가 Get/Set필요한 순간 항상 아래의 액션이 필요
- > pageVO.setBoard_type(session.getAttribute("session_board_type")); //페이지 진입시 
- > boardVO.setBoard_type(session.getAttribute("session_boartd_type")); //게시판CRUD시 항상필요
- 위와 같이 MVC에서 항상 실행되는 부분을 뽑아내서 공통실행으로 만드는 과정을 AOP(관점지향프로그래밍)라고 한다.

- @Aspect 기능으로 세션관리 :DebugAdvice.java에 sessionManager()메소드 생성
- @ControllerAdvice 기능으로 @ModelAttribute List<BoardTypeVO> 오브젝트 반환 후 jsp 이용
- 오전에 작업한 파일 : DebugAdvice.java, ControllerAdviceException.java

- 게시판 타입(ex.공지사항, 갤러리) 세션을 사용. 스프링시큐리티를 사용하지 않았으면 로그인 인증 체크를 AOP세션으로 처리
- 다중게시판 삭제 시, 게시판 타입에 해당하는 게시물이 존재할 경우 삭제 불가 메시지 후 삭제 로직 빠져나오기

- 세션은 서버에서 생성되는 저장소이다.

### 20210122(금)


### 20210121(목)
- null과 ""의 차이
- > memberVO.setUser(""); 공백값
- > 아예 보내지 않음. null값
- 회원가입 프로그램 처리 결과 확인. 회원가입 후 바로 로그인X 관리자가 enabled를 true로 변경해줘야(승인) 로그인 가능
- > /admin/member/member_update (AdminController클래스매핑)에서 조건변경
- =======================================================================================
- 서비스 URL : http://localhost:8080 -> http://127.0.0.1:8080
- 콜백 URL : function() 콜백함수와 같은 기능. 자동실행되는 함수처럼 자동으로 이동할 URL. 우리 프로그램에서는 로그인 URL
- 로그인 후 URL == 콜백 URL과 같은 이야기 
- 인증(Authentication) - 스프링시큐리티에서 enabled가 인증 체크
- 권한(Authorization) -  스프링시큐리티에서 ROLE_ADMIN, ROLE_USER 가 권한체크
- 네이버아이디 로그인(네이버에서 제공하는 REST_API 백엔드단) 실습

### 20210120(수)
- 이론 ch13 - ch16 마무리
- 마이페이지 권한 부분에서 ROLE_ADMIN 추가 및 disabled 처리 및 input hidden으로 값 지정.
- 회원탈퇴 여부도 disabled 처리 및 input hidden으로 값 지정.
- 사용자단, 유효성 검사 기능을 포함하여 마이페이지 완료.
- 관리자단, @Valid 어노테이션 사용해서 유효성 검사 실습.(pom,xml 외부모듈추가)

### 20210119(화)
- [X] 메인 페이지 최근 게시물 처리, 최근 이미지 처리 
- [X] 헤로쿠 배포
- [X] 사용자단 게시판 CRUD 마무리
- root-context.xml에서, dataSource-hsql_local을 dataSource로 alias 별칭 만들어서  Junit DB 작동 처리
- @PropertySource("classpath:properties/local.properties") JUnit 파일 상단에 추가 (전역변수 필요 없음)

### 20210118(월)
- 로컬 PC의 DB설정 파일 : 개발용 - 헤로쿠용 DB설정 파일 : 운영서버용
- 로컬PC용 업로드 경로 개발용 - 헤로쿠용 업로드 경로 운영서버용
- 현재 해당되는 xml설정파일에서 개발용과 운영서버용 내용을 변경 처리해서 작업한다.
- 현업1 : globals.properties파일을 만들어서 전역변수로 위 설정 내용을 변수처리해서 사용.
- 현업2 : local.properties, prod.properties
- > properties : 속성, product - 운영서버, local - 개발PC
- [X] 지난 주 헤로쿠 배포 시, DB경로 변경, 업로드 경로 변경 복잡한 절차를 개선시킨 과정은 properties파일로 전역변수 처리해서 OK
- 지금은 Hsql이나 Mysql 쿼리가 같다. 하지만 Oracle쿼리는 AI가 없기 때문에 많이 다르다. 그래서 쿼리 경로도 전역 변수로 처리한다.
- [ ] 사용자단 게시판 CRUD 마무리
 


### 20210115(금)
- 서블렛자바+JSP(jstlX)프로그램 - 스트러츠웹프로그램만들기 - 스프링+jsp(jstl)웹프로그램만들기 - 미래에는 알지못하는 프레임워크
- ========================================================================
- 헤로쿠에 배포하기 1-DB부분:
- > 1. 헤로쿠용 : root-context에 Hsql DB위치 변경 /tmp/~ + 1회용 초기화 부분 주석 해제
- > 2. PC용 : root-context에 Hsql DB위치 변경 c:/~ + 1회원 초기화 부분 주석 처리
- 헤로쿠에 배포하기 2-첨부파일부분:
- > 1. 헤로쿠용 : 업로드 경로 변경:헤로쿠: /temp/~
- > 2. PC용 : c:~

### 20210114(목)
- [X] 사용자단 댓글 CRUD 마무리
- [ ] 헤로쿠(URL) 배포(HsqlDB로 배포, 메이븐 외부 라이브러리 추가 필수 pom.xml 수정)
- 헤로쿠 클라우드 특징 : 무료, 한 달 사용 450시간까지 무료 접근 가능. 
- 헤로쿠 단점 : 30분동안 URL에 접근하지 않으면 zzz휴면상태로 진입 -> 활성화시키는데 20초정도 필요.
- > 스프링 기능 중, 스케줄 기능 -> 20분마다 1번씩 URL http://leesieun.herokuapp.com에 접근하도록 만든다.
- HSQL: 간단한 웹프로그램 제작 시 사용하는 DB. 개발자들이 빨리 만들 때, 프로토타입, 신규서비스 전 간단하게 작업 시 주로 사용. HSQL은 서비스용은 아니고 개발전용이다.
- [ ] 사용자단 게시판 CRUD 마무리
- [ ] 사용자단 유효성 감사 기능을 포함해서 마이페이지 + 회원가입 프로그램 처리
- [ ] 네이버 아이디 로그인(네이버에서 제공하는 Rest-API백엔드단) 실습

### 20210111(월)
- 사용자단 html -> jsp변경 : board폴더 부분 jsp파일로 변경
- 공동 error.jsp 추가 (인터셉터 클래스 이용)
- > 웹 프로그램이 작동되는 순서 :
- > 톰캣(server, web, context 3개 xml 순서대로 실행)
- > 스프링 (1. web.xml:404file not found, 500, 400)
- > 2. root-context -> 3. servlet-context (여기서부터 스프링에러표시)

- 스프링시큐리티 적용한 로그인 처리
- > 스프링 시큐리티 필터기능 말고, 대표적인 필터기능솔루션은 글작성시 욕설방지기능 필터 기능으로 작성
- > 스프링시큐리티 2가지 기능 : 인증기능(로그인체크기능- 암호화), 권한기능(권한체크)
- > 네이버아이디 로그인(SSO) RestAPI는 인증만 가능하기 때문에, 사용이 가능. 권한은 개발자가 부여
- 사용자단, 게시판 CRUD처리
- 사용자단, 유효성 검사 기능을 포함해서 마이페이지+회원가입 프로그램 처리
- 네이버아이디 로그인(네이버에서 제공하는 REST-API백엔드단) 실습.
- 헤로쿠(URL)에 배포 (HsqlDB로 배포, 메이븐 외부 라이브러리 추가 필수 pom.xml 수정)
- =======================2월3일까지(위)==========================

- 위 과정 끝나면, MySQL로 작성된 소스를 오라클로 마이그레이션(오라클설치 및 사용자 생성 및 암호 추가)
- 문서작업(완료보고서작업) : 이력서 제출시 사용.
- IoT(노드MCU보드:아두이노계열)로 임베디드 프로그램 실습.
- > 코로나19상황일 때 일주일정도 실습 나와서 한다. 라즈베리파이 임베디드 리눅스 프로그램 = 팀작업, 코로나 상황이면 팀작없 X 아니라면 팀작업.
- 안드로이드 스튜디오를 이용해서 안드로이드앱 1 제작후 IoT장비와 통신
- 안드로이드 앱2 제작 후 위 스프링 프로젝트와 REST API 통신 회원 정보 조회 및 삭제 처리 기능 실습.
- 위 앱 제작 실습시 스프링 프로젝트 RESTAPI 서버 컨트롤러 제작 실습한다.
- 입사지원기간(사람인 사이트에 이력서 제출) : 취업활동

### 20210108(금)
- 사용자단 html 소스를 jsp 로 변환하는 작업진행. views폴더안에 home폴더 생성 후 작업진행.
- HomeController클래스 리퀘스트 매핑부분 추가/수정.
- 사용자단 html(https://miniplugin.github.io/) 소스를 커스터마이징 후 jsp로 만들기.
- 부트스트랩과 AdminLTE라이브러리 가져오기(board_view[write].html 상단에 추가:아래)

```
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
```

- 인터셉터(가로채기-Interceptor)클래스를 이용해서, 예외처리를 공통 error.jsp 로 바인딩 처리.
- 스프링시큐리티 로그인 구현 pom.xml 의존성 추가(회원가입시 패스워드 암호화 추가).

### 20210107(목)
- [X] 댓글 기능 구현, CRUD 마무리
- > btn_reply_list 버튼 id에 부트스트랩(jquery기반의 프레임워크)의 토글 기능 넣어서 하단 댓글 리스트(페이징포함)를 나타내고 숨기는 기능 추가
- > 1. 액션버튼 부분 : data-toggle="collapse" data-target="#div_reply"
- > 2. 대상 타겟 부분 : 토글영역
- [X] 댓글 JSP에서 Ajax + Jquery 화면 처리 마무리
- prepend, append, after : Jquery 기능
------------------------------------------------------------------------
- Ps.싱글톤이 사용되는 이유참조: https://shxrecord.tistory.com/132
- Ps.싱글톤 빈(스프링)에 대해서(1개의 빈은 1개의 빈객체만 생성해서 사용하겠다명시)
https://m.blog.naver.com/PostView.nhn?blogId=sksk3479&logNo=221175889439&proxyReferer=https:%2F%2Fwww.google.com%2F
- Ps.싱글톤 클래스(자바)에 대해서(1개의 클래스는 1개의 인스턴스만 생성해서 사용하겠다명시)
- 우리가 사용한 경우: 달력 인스턴스 생성. Calendar.getInstance() 참조정보(아래)
https://m.blog.naver.com/PostView.nhn?blogId=heartflow89&logNo=221001179016&proxyReferer=https:%2F%2Fwww.google.com%2F

```java
class Singleton{
	private static Singleton instance = new Singleton(); // 정적필드 / 인스턴스 생성 
	private Singleton(){} // private 생성자
	public static Singleton getInstance(){ // getInstance 메서드 정의
		return instance; // instance 객체 리턴
	}
}
public class SingletonEx {
	public static void main(String[] args) {
		Singleton st1 = Singleton.getInstance(); // 싱글톤 인스턴스 호출
		Singleton st2 = Singleton.getInstance();
//		Singleton st3 = new Singleton(); // 생성자 이용 인스턴스 생성 불가
		if(st1 == st2){
			System.out.println("동일 객체");
		}else{
			System.out.println("다른 객체");
		}
	}
}
```

### 20210106(수)
- [X] 부메랑 이용해서 댓글 CRUD 테스트 마무리.
- [X] 댓글 페이징 처리 (매퍼쿼리부터 ~ Controller까지 진행)


### 20210105(화)
- 특이사항 : RestAPI에서 Select는 GET이 기본.(수업 중 이클립스 내장 브라우저에서 실행 오류 -> POST사용)
- 게시판에서 GET으로 전송하는 방식1 (고전) : url:"/reply/reply_list?bno="+bno,
- 게시판에서 GET으로 전송하는 방식2 (시멘틱 웹) : url:"/reply/reply_list/"+bno,
- 시멘틱 웹방식으로 전송하는 목적 : 구글 검색에 노출되기 쉽게 하기 위해.(검색 광고와 관련)
- ==========================================================
- @PathVaribale : URI경로에 변수를 넣어준다. RestAPI에서 사용
- > ReplyController
- @RequestMapping: 메소드가 어떤 HTTP요청을 처리할 것인가
- > value="/../.." : value값의 URL인 것 처리.
- > method=RequestMethod.GET(혹은 POST) : 요청 메소드가 GET(혹은 POST)인 것 처리.
- @RestController : @Controller에 @ResponseBody를 추가한 효과를 가진다. RestAPI 구현을 염두한 축약형 어노테이션
-  > ReplyController
- @ResponseBody : 모든 메소드의 return 오브젝트를 적절한 형태로 변환 후 HTTP응답 메시지의 바디에 담아 반환한다. RestAPI 구현시 적합.
- > CommonController, ReplyController
- ==========================================================

- 부메랑(크롬의 플러그인) : JUnit(스프링-자바단위테스트)과 같은 역할. RestAPI의 단위 테스트 할 때 사용.
- > JUnit으로 CRUD테스트 했다.
- > 부메랑으로도 CRUD테스트 한다.
- 부메랑으로 테스트 후 댓글 클래스 작업 시작 할 것이다.
- 댓글 DB -> VO -> mapper쿼리 -> DAO -> ~Service~(생략) -> Controller -> JSP

### 20210104(월)
- [X] 다중 파일 업로드
- [X] 관리자단 게시판의 뷰화면의 댓글 RestAPI 프로그램작업 시작.
- [ ] 사용자화면 디자인 커스터마이징
- [ ] 인터셉터(가로채기) 클래스 이용해서, 예외처리를 공동 error.jsp로 바인딩 처리
- [ ] 스프링 시큐리티 사용해서 로그인 구현
- =========================================================
- 댓글에서 Json데이터 사용. pom.xml 의존성 추가(댓글 Rest-API에서 필요)
- 보통 jackson, Gson 외부라이브러리를 사용할 때는 pom.xml에 해당 모듈을 추가해야 하지만, 
- Rest컨트롤러 클래스 안에 ResponseEntity<String>를 사용해서 Json데이터로 반환한다.
- 따라서, pom.xml 모듈 추가 없이 작업 진행한다.
 
### 202012231(목)
- [X] 첨부파일: 업로드 부분 OK.(학생들확인)
- [X] 첨부파일: 게시물상세보기 화면에 UUID파일명이 아닌 real_file_name나오게 하기OK.
- [X] 첨부파일: 다운로드 기능 추가.(한글내용, 한글파일명 깨지는 것 방지로직 추가)OK.
- [X] 첨부파일: 게시물 삭제시 첨부파일과 첨부테이블도 삭제처리 하기OK.
- [X] 첨부파일: 게시물 수정시 기존첨부파일 삭제 후 업로드 처리 하기 (미수정시는 해당없음)OK. 

### 202012230(수)

이론
- ch08까지
- ==========================================================


- [ ] 관리자단 게시판 업로드 화면 구현
- [ ] 관리자단 댓글 처리 시작 
- 1월말, 2월 초에 현재 스프링 프로젝트 버전 4.3.22에서 5.2.25버전으로 마이그레이션한다.
- DI(의존성주입)컨테이너 영역안에 스프링빈이 들어간다.(@Controller, @Service, @Repository, @Cmponenet 등)
- MVC : Model, View, Controller = 3티어(3단계)
- 서버/클라이언트(서버 - 클라이언트 분리) : 2티어(네트워크장비쪽)
- DB/웹서버(웹서버 - DB서버 분리) : 2티어(시스템프로그램)
- 스프링에서 DI컨테이너(등록된 Bean들)에 자동 등록될 빈(Bean) 클래스
- @Controller :스프링 웹 MVC 컨트롤러 의미
- > 웹 URI 등록에 사용, 위에 언급한 @RestController(RestFull)을 참조
- > jsp와 @Service 연결해주는 View 프리젠테이션 레이어 클래스
- @Service : 도메인(domain=VO,Value Object멤버변수) 와
  DAO(데이터엑세스Repository)를 연결해 주는 비지니스(서비스) 로직 레이어 클래스
- > 도메인(domain=VO, Value Object멤버변수)
- > 도메인(내용)
- @Repository : 서비스(비지니스)와 DB엑세스(DAO) 를 연결해 주는 레이어 클래스
----------------------------------------
- mvn compile (이클립스에서 run AS -> build -> compile -> run과 동일)
- > ~.java -> .class 로 겸파일된 결과파일 생성된다.
- 스프링 설정 방식 : 아래 2가지
- > 1. xml방식(메이븐빌드) : 태그로 구성, 이클립스 기반 스프링 웹 프로젝트 개발시.(메인)
- > 2. Grovvy 방식 (그래들빌드) : 스크립트 구성, 안드로이드 스튜디오 기반 앱 개발시.(2주)
- IoC : Inversion Of Control(제어의 역전) 프로그램 제어를 개발자가 하지 않고, 스프링이 대신 처리한다.
- > ex. @Inject BoardService boardService; 개발자가 오브젝트를 생성 후 소멸(boardService.close())할 필요가 없다. 스프링이 소멸에 대한 제어를 대신 해준다. 
---------------------------------------------
- 저장할 폴더 지정 : servlet-context.xml에서 저정(pc에 저장위치 설정, 헤로쿠/파스타에서 사용할 클라우드 저장폴더는 별도로 지정예정)
j

### 202012229(화)
- 관리자단 게시판 CRUD작업 중 이제 Read작업 확인(첨부파일 다운로드는 아래 insert 작업 후 다시 확인)
- Create(insert)작업 시 첨부파일 업로드 구현
- input type="file" name="file" 바로 DB테이블에 저장할 수 없다.
- save_file_name, real_file_name 이런 테이블필드에 저장하기 전에 전처리과정 필요
- 첨부파일 등록 시 전처리 과정 
- > 저장공간(폴더)에 save_file_name으로 .hwp, .jpg, .xls 저장되는 기능 필요
- > 물리 DB테이블에 save_file_name, real_file_name 
- 물리 DB(필드명) - DAO - Service - Controller - JSP(input태그의 name 속성)
- >  BoardVO(멤버변수명와 위 5군데 Get/Set 이 가능하려면, 이름이 동일해야함. 필수조건)


실습
- [X] CRUD 중 Delete
- [X] CRUD 중 Update
- [X] content영역 summernote로 변경

### 202012228(월)
- AdminLTE관리자단 게시판 CRUD작업 시작
- resources/home 폴더의 디자인 html파일에서 댓글달기 html 같이 작업 예정
- 위 home폴더를 jsp로 변경처리 후 스프링과 연동하는 작업 진행된다.
- 위 작업은 관리자단 게시판 CRUD작업 후 진행
- 자료구조 : List<BoardVO>, List<String>
- List<BoardVO> : 
-	{bno1, 'title1', 'content1', ...}
-	{bno2, 'title2', 'content2', ...},
- 	{bno3, 'title3', 'content3', ...},
- ...
- ]
- List<String> : [
- 	{'file_name1'},
- 	{'file_name2'},
-	...
- ]

### 202012224(목)
- v6.0.0과목 시작
- 사용자단 홈페이지 퍼블리싱한 결과물 webapp/resources 폴더에 home폴더명으로 생성.
- 관리자단은 /resources루트, 사용자단은 /resources/home에 위치한 이유?
- > 관리자단은 디자인 변경이 없다. 사용자단은 1년마다 리뉴얼 되어 /resources/home2020, resources/home2021 같이 폴더 생성 -> 개발자가 jsp변경


## v5.0.0 통합구현
### 202012224(목)
- AOP 작동이 안되었던 문제점 2가지 처리
- > 1. Controller 클래스가 빈으로 등록되는 servlet-context.xml에도 aop태그 추가
- > 2. DebugAdvice클래스의 logger.debug -> logger.info로 변경, 또는 log4.xml설정 debug로 변경

- 인터셉터(Interceptor-가로채기)클래스 만들 예정 : 예외처리를 erro.jsp로 공통 에러페이지 생성에서 바인딩 처리할 때
- 웹의 3요소 (웹표준-html5, 웹접근성-사회적약자접근이가능한 콘텐츠제작, 웹호환성-크로스브라우징)
- 통합구현에서 사용된 어댑터(Adapter) : 안드로이드 스튜디오 어댑터라는 용어 사용/
- > 어댑터 : 데이터베이스 - 어댑터(데이터를 변환하는 기능, 스프링의DAO클래스와 비슷) - 입출력VO클래스 - 화면출력(바인딩)
- 스프링시큐리티에서 사용하는 암호화는 단방향 암호화이다. (복호화가 안되는 방식)

### 202012223(수)
- 스프링에서 작업 순서 : DATABASE > 쿼리 > DAO > Service > Controller > jsp
- 지금 진행하고 있는 스프링웹 프로젝트 워크벤치로 ERD 만들기
- > ERD만들기 : 발주사의 업무담당자와 협의 끝난 이후 작업. 
- > 발주사(회사, 대학, 관공서)에서 사용하는 출력문서(결제서류, 입학원서, 입사원서, 월급 명세서 등)를 가지고 ERD를 만들게 된다.
- 물리 DB 생성 후 프로시저 사용해서 데이터 입력(게시물 관련) 연습
- ========================================================
- 프로그램에서 데이터 크기 단위 : 8비트=2의 8제곱=256
- > 왜 데이터크기를 255로 설정하는가? 0부터 255까지(256개)
- Mysql에서 엔진 : InnoDB, MyISAM
- > InnoDB : 트랜잭션 가능, 최신버전
- > MyISAM : 트랜잭션 불가능, 구버전
- 트랜잭션 : 묶어서 처리하는 역할. 중간에 에러가 났을 때, ROLLBACK(원상복귀)시키는 기능
- > 은행 사이트에서는 필수.
- =========================================================
- ERD제작 -> 물리DB(스키마) 생성 -> 물리DB(스키마)에 더미데이터 입력(회원, 게시물), 프로시저 이용. -> DATABASE폴더에 만들어진 DB 백업(edu_mysql.sql)
- =========================================================
- 스프링 AOP(관점지향프로그래밍-OOP의 학장기능)기능으로 개발용 디버그 출력환경 만들기 시작.
- AOP(Aspect Oriented Programming) : 구조화된 OOP의 단점인 복잡도 증가를 줄이는 효과를 기대해서 만든 프로그램 방식
- 즉, OOP 자바클래스단에서 제어하던 반복되는 명령을 호출단에서 제어하도록 변경한 내용이 AOP
- ex) 인증처리, 디버그와 같은 예외처리를 개발클래스에서 처리하지 않고, 공통클래스 1개 만들어서 인증이나 예외처리(디버그)가 필요할때마다 효출하는 시스템을 AOP라고 한다.
- 예외처리를 AOP로 구현하면서, 기능을 확인해본다.
- 스프링의 특징 : DI(의존성주입), AOP(관점지향프로그래밍), IoC(제어의 역흐름)
- > IoC(Inversion of Controller: 개발자가 하던 메모리관리(가비지컬렉션-쓰레기프로그램종료시키기, 개발자가 코딩으로 오브젝트클래스 종료할 필요 없이, 스프링이 대신 처리하는 기능), 프로그램 생성추가관리를 개발자가 코딩으로 하지 않고, 스프링이 대신 처리하는 기능
- pom.xml에 AOP 모듈 추가

### 202012222(화)
- 한글 POST시 깨지는 문제 : web.xml에서 한글 처리를 위한 UTF-8 필터 추가

```
<!--  필터는 HTTP통신하는 자료를 걸러주는 역할, 한글처리를 위한 UTF-8 필터 추가 -->
	<filter>
	  <filter-name>encoding</filter-name>
	  <filter-class>org.springframework.web.filter.CharacterEncodingFilter</filter-class>
	  <init-param>
	   <param-name>encoding</param-name>
	   <param-value>UTF-8</param-value>
	  </init-param>
	</filter>	
	<filter-mapping>
	  <filter-name>encoding</filter-name>
	  <url-pattern>/*</url-pattern>
	</filter-mapping>
```

- 오후 수업
- > ID수정 방지 기능, enabled값 jsp바인딩처리 확인. 업데이트 마무리
- > 회원 등록(CRUD 중 C) 작업
- 중복아이디체크(Ajax로 간단한 RestAPI컨트롤러 구성):중복아이디가 존재한다면, SUBMIT버튼을 비활성화(disabled)
- 중복아이디가 존재하지 않을 때만 SUBMIT버튼을 활성화시키는 Jquery사용
- > 중복아이디체크는 버튼을 사용하지 않고, 아이디 input항목을 벗어났을 때 이벤트를 이용해서 Ajax호출

### 202012221(월)
- 마리아DB실행  -> 워크벤치 실행 -> 이클립스 실행
- 리스트 출력 전 페이징 처리부터 해야 하기 때문에,  selectMember호출보다 위로 이동
- 변수변경 
- > 1. 쿼리에서 사용되는 시작인덱스 startNo -> queryStartNo
- > 2. 쿼리에서 사용되는 1페이지 당 출력 개수 perQueryPageNum -> queryPerPageNum
- totalCount가 듣어가는 계산식 변경
- > tempEnd*this.perQueryPageNum > this.totalCount (임시끝페이지 x 쿼리에서1페이지당출력할개수 > 실제전체개수)
- > this.totalCount/(double)this.queryPerPageNum (실제전체개수/쿼리에서1페이당출력할개수)
- > this.endPage*this.perQueryPageNum < this.totalCount (계산된끝페이지 x 쿼리에서1페이지당출력할개수 > 실제전체개수)
- 더미데이터 입력 : DB stored procedure 사용(DB전용 프로그램 방식)
- log4j.xml 로그 등급 변경 및 dtd(Document Type Define)문서타입정의를 아래로 변경예정
- > log4j.xml 레벨 : debug < warn < info , 오른쪽일수록 더 자세한 정보
- > <!DOCTYPE log4j:configuration SYSTEM "http://logging.apache.org/log4j/1.2/apidocs/org/apache/log4j/xml/doc-files/log4j.dtd"> 이걸로 변경
- 리스트, 검색, 페이징 완료
- =====================================================================
- 신규페이지 작업 순서 : 쿼리 > DAO > Service > Controller > jsp

### 20201218(금)
- PK(식별자): Primary Key(기본키, 고유키) 주민번호와 같은 1개의 값.
- 테이블에서 고유한 PK: 엔티티에서 유일한 값
- 연계(인터페이스) 정의서 및 명세서 (11번째 과목에서 작성)
- 위 명세서는 https://www.gitbook.com/에서 작업 or pptx
- ======================================================================
- 1페이지 계산 5*(1-1) = 0 1페이지일 때
- 2페이지 계산 5*(2-1) = 5 2페이지일 때
- SELECT * FROM tbl_board order by bno desc limit 0,5 # 0-시작 인덱스, 5-출력할 개수
- 위 쿼리 결과 : 1(0), 2(1), 3(2) 4(3) 5(4) 까지 5개 출력
- SELECT * FROM tbl_board order by bno desc limit 5,5 # 5-시작 인덱스, 5-출력할 개수
- 위 쿼리 결과 : 6(5), 7(6), 8(7) 9(8) 10(9) 까지 5개 출력
- 위 로직을 처리하는 PageVO.java 데이터 클래스를 만든다.
- > 위의 계산이 가능한 get/set 만든다.
- PageVO클래스 적용하는 순서 : PageVO클래스 생성 -> AdminController클래스 수정 -> MemberService 수정 -> MemberDAO 수정 -> MemberMapper쿼리 수정 -> jsp 화면 수정
- 실제 개발 순서 
- > PageVO클래스 생성 - MemberMapper쿼리 수정 - MemberDAO클래스 수정 - MemberService클래스 수정 - AdminController클래스 수정
- @ModelAttribute("pageVO")
- 조건문 중 삼항 연산자 
- idx==pageVO.page?'active':''
- > if(idx==pageVO.page){'active'} else{''};

### 20201217(목)
- 백엔드개발 : 프로젝트 10개당(6개월X10=5년) 1개 하드웨어(IoT, 아두이노, 라즈베리파이)와 연동
- 프론트개발(웹에이전시) : 2주-1달(1년12개이상)
- ======================================================================
- 쿼리에서 정렬방법 : Ascending(ASC오름차순) 1,2,3,... Descending(DESC내림차순) 10,9,8,...
- 정렬기준 : 페이징처리 시 bno(게시물번호) 기본정렬기준으로 어제 테스트했음.
- ex) 최신등록일 order by reg_date DESC
- ======================================================================

이론

- 송신시스템(스프링프로젝트)-중계시스템(RestAPI서버,댓글컨트롤러)-수신시스템(jsp단 Ajax호출)
- 스프링시큐리티와 매칭시켜보면, 2가지 로직으로 진행된다.
- > 1. Authentication 인증체크
- > 2. Authority 권한체크(개발자몫).
- HRD-Net의 인증(보안)절차는 QAuth(Open Authentication 오픈인증) 2.0 사용 (페이스북, 트위터, 네이버아이디 로그인, 구글로그인 같은  OpenAPI인증 사용) -> 로그인 인증은 받았으나, 관리자, 학생, 교수, 일반인 등  기관마다 다 다르기 때문에 권한체크는 개발자가 만들어서 한다.
- HRD-Net에 오픈 API 파라미터(URL쿼리스트링) 키값 확인
- HTML(링크드문서) 다음에 XML(자료를저장한문서) 출시
- 중계시스템(연계시스템):Agent시스템, RestAPI서버(중계시스템)
- ======================================================================

실습

- 구직자 훈련 OpenAPI를 사용한 목적 
- > URL쿼리스트링으로 (HRD-Net시스템의 Rest서버에 전송) 보내면, 반환값을 xml로 받는다.
- > 받은 xml데이터를 화면에 representation(재구현)하는 파싱이 목적이다.(대세기술)
- 우리는 자바앱까지만 콘솔에세ㅓ 확인하고, 우리 프로젝트에서는 댓글, 네이버아이디로그인API 사용할 떄, 위 기술이(OAth 인증 후) 사용할 예정

## v4.0.0 프로그램언어 활용
### 20201216(수)
- 인터페이스(책목차) - 임플리먼트클래스(책내용) 관계 : 1대1 원칙
- DB 디버그용 드라이버(실행쿼리가 콘솔화면에 나오도록 -개발자가 실행확인을 편리하게 함) 사용 pom.xml 의존성 추가
- 의존성 추가 후 root-context.xml에서 jdbc 드라이버설정을 변경하면, 아래 콘솔창에서 쿼리가 보이고, 전송자료들을 확인할 수 있어서 개발할 때 필수이다.ㄷ

- 페이징 처리
- 수의순서: 0,10 -> 10,10 -> 20,10
- jsp에서 사용가 선택한 페이지번호를 이용해야 페이징처리가 가능.
- ?page=3&searchType=all&searchKeyword=
- PageVO클래스만들때, get 페이지번호, set 계산식을 적용 쿼리에 limit변수 첫번째 값으로 넣어줌.
- GET page=위 URL쿼리스트링의 페이지 번호;
- 1페이지계산 10x(1-1) = 0 1페이지일때
- 2페이지계산 10x(2-1) = 10 2페이지일때
- 3페이지계산 10x(10-1) = 90 10페이지일때
- SELECT * FROM tbl_board
- order by bno desc
- limit [SET으로 받은 계산된 변수값], 10;
- 데이터 정렬에 사용되는 기준값 위에서는 bno(게시판번호)
- Order By 데이터정렬에 상용되는 키워드(예약어)
- 정렬은 오름차순(Ascending)낮은수->높은수 : 옛글부터 보여준다.
- 내림차순(Descending) 높은수->낮은수 : 최신글부터 보여준다.

### 20201215(화)
- 워크벤치 쿼리 실행한 것 참조 -> mapper쿼리 만듦 (selectMember) -> DAO클래스(에서 selectMember 호출) -> Service클래스(에서 DAO호출) -> Controller(에서 Service호출) -> jsp
- [DAO클래스(에서 selectMember 호출) -> Service클래스(에서 DAO호출)]를 한개의 클래스로 사용하는 것 = 스프링부트방식(소규모프로젝트용)
- [Controller(에서 Service호출) -> jsp] = JUnit테스트
- DAO와 Service를 두 개의 클래스로 나눈 이유?
- > 1. 현업에서 사용되는 솔루션들이 두 개로 클래스를 나눈 구조이다.
- > 2. 근본적인 이유) DAO는 DB에 접근하는 부분(DAO)은 최소화, DAO를 호출하는 서비스는 다수
- > ->ex) DAO클래스에 selectMember() 메소드 1개, DAO.selectMember() 호출하는 서비스는  관리자단에서 호출, 사용자단 서비스에서 호출. 따라서 1:2(1:n)

- 인터페이스 영역(메소드 명세 파일) - implements - 임플리먼트 클래스(메소드 구현 파일 - 오버라이드된 메소드 구현 내용)
- 메소드 명세 메소드명 -> 오버라이드된 메소드명

### 20201214(월)
- =================<개발시작 전 준비 단계>==============================
- JUnit 테스트 (자바단위테스트) 목적: jsp,contorller 하기 전 CRUD 테스트 
- jsp -> controller -> service -> dao -> mapper.xml -> DB(Mysql, Oracle)
- 자바단위테스트(JUnit) -> service -> dao -> mapper.xml -> DB(Mysql, Oracle)

- 톰캣/JUnit 실행해야만 DB가 연동된다.
- 톰캣이 종료되거나 JUnit 테스트가 끝나면, DB연동 끊어진다.
- JUnit 테스트 준비 OK
- 데이터베이스 접속 테스트.
- > 데이터베이스 사용 라이브러리 추가 (pom.xml)
- 스프링 테스트 pom.xml dependency 의존성 추가
- > servlet 버전 2.5 -> 3.0.1로 변경 필수
- > 의존성추가 1. jdbc(Java DataBase Connection) 모듈추가 후 설정 필수
- > 의존성추가 2. Mysql 모듈 추가 설정
- > -> 위 2가지로 스프링에서 데이터베이스 커넥션 처리, DriverManagerDataSource(DB커넥션)
- > ===============================================================
- > 의존성추가 3. jdbc와 Mysql DB 중간에 쿼리를 사용하는 역할인 MyBatis 모듈 추가 후 설정 필수
- > * Mybatis : SELECT, INSERT, UPDATE, DELETE 쿼리를 수행하는 메소드들 존재
- > -> 위 1가지(MyBatis)로 스프링에서 쿼리를 관리하는 처리, sqlSessionFactory(쿼리생성)
- > -> 위 1가지(MyBatis)로 스프링에서 쿼리를 호출하는 메소드명(인터페이스)을 처리, sqlSessionTemplate(쿼리호출)

DataSource(커넥션) - sqlSessionFactory(쿼리생성) - sqlSessionTemplate(쿼리호출)

- MyBatis에서는 sqlSession을 생성하기 위해 sqlSessionFactory사용
- 마이바티스 스프링 연동모듈을 사용하면 sqlSessionFactory 직접 사용할 필요 X
- > 스프링 트랜잭션 설정에 따라 자동으로 커밋 혹은 롤백을 수행하고 닫혀지는, 쓰레드에 안전한 SqlSession 개체가 스프링 빈에 주입될 수 있기 때문
- sqlSessionTemplate은 마이바티스 스프링 연동모듈의 핵심
- > sqlSession 구현, sqlSession대체 역할. SqlSessionTemplate은 쓰레드에 안전하고 여러개의 DAO나 매퍼에서 공유 가능
- sqlSessionTemplate은 생성자 인자로 SqlSessionFactory를 사용해서 생성 

--------------------------------------------------------------------------------------
- 외부 라이브러리가 있어야 커넥션 가능
- junit(JavaUnit) 테스트 설정 후 기본 unit(유닛) 단위 테스트
- 단위테스트(junit)를 하는 이유는 실행환경에서 테스트하기 전에 미리 예행연습 하는 역할이다.
- 주로 CRUD 테스트 후에 jsp 프로그램 작업이 들어간다.
- ibatis(아이바티스 - 쿼리생성 불편) -> mybatis(마이바티스 - 쿼리생성 편리)
- > 클래스 이름은 ibatis 이지만 우리가 쓰는건 mybatis이다.


### 20201211(금)
- BoardVO 클래스 만들기
- > AdminController에서 model클래스를 이용해서 jsp로 board_list 데이터 세트를 보낼 때 필요한 클래스
- AdminController에서 board_list, board_view, board_write 바인드 매핑 만들기
- board_list.jsp, board_view.jsp, board_jsp 만들기

- 게시판 로직 핵심 : CRUD기본, 검색기능, 페이징처리로직, 첨부파일기능
- 게시판 로직 확장 : 댓글기능(Rest-API)
- Rest-API 확장기능 : 네이버아이디로그인(수업시간에 할 것), SNS(페이스북, 트위터, 구글) 로그인 API
- RestAPI 컨트롤러 1개 만든다. - 네이버에서 RestAPI서버를 1개 만드는 것과 같음

- 첨부파일 설정 : servlet-context.xml에 파일업로드 경로, 업로드 용량제한 설정 필요

- =========================================================================
- 쿼리스트링 : 쿼리(질의)시트링(문자열) URL에서 쿼리스트링이라고 하면, ?키1=값1&z키2=value2
- /admin/member/member_view?user_id=${member.user_id}
- =========================================================================
- java에서 인스턴스 오브젝트를 만들 때, ClassName className = new ClassName(); 방식으로 만들었음
- 스프링에서는 오브젝트를 생성하지 않고, 오브제트를 "주입"한다고 한다. 기술용어로 DI(Dependency Injection) 의존성 주입
- 의존성주입(DI, 외부모듈주입)할 떄, @Inject=@Autowired(어노테이션 사용) 줄바꿈 후 ClassName className;
- 위와 같은 DI방식으로 SecurityCode 클래스 주입받아서 unscript메소드 사용했음

------------------------------------------------------------------

- 스프링 빈(등록되어 사용가능한 클래스)이 등록되는 절차.
- 톰캣 서버(WAS)가 실행될 때, 로딩해서 실행되는 파일 순서(아래)
- web.xml 최초 실행
- 1. root-context.xml 실행.
- 2. servlet(SERVer + LET = 서버프로그램): servlet-context.xml 실행
- > servlet-context 안에 있는 component-scan이 지정한 package경로에 존재하는 @Controller, @Service, @Repository, @RestController(Rest-API) 어노테이션 클래스를  자동으로  읽어들여서 빈으로 등록. => 실행가능

------------------------------------------------------------------

- 앞으로 작업예정 내용
- 스프링 테스트 pom.xml dependency 의존성 추가
- junit(JavaUnit)테스트 설정 후 기본 unit(단위)테스트
- jdbc(Java DB Connection) 사용 pom.xml 의존성 추가
- Hsql 사용 pom.xml 의존성 추가
- MyBatis(CRUD쿼리 관리툴) 사용 pom.xml 의존성 추가 
- DB 디버그용 드라이버 사용 pom.xml 의존성 추가
- junit으로 DB접근 후 관리자단 회원관리 CRUD unit 테스트 
- 스프링 AOP(관점지향프로그래밍-OOP의 확장)기능으로 개발용 디버그출력환경 만들기
- 실제 회원관리 화면 CRUD 적용
- 실제 게시판 화면 CRUD 적용
- 파일 업로드 라이브러리 사용 pom.xml 의존성 추가
- 게시판 업로드 화면 구현
- Json데이터 사용 pom.xml 의존성 추가
- 실제 댓글 화면 CRUD 적용(우리가 만들어서 제공 REST-API 백엔드단)
- 사용자단 화면 html 소스를 jsp로 만들기
- 스프링시큐리티 로그인 구현 pom.xml 의존성 추가
- 사용자단 CRUD 구현
- 이후 유효성검사, 파스타클라우드, 네이버아이디 로그인(네이버에서 제공REST-API 백엔드단) 사용 등등. pom.xml 의존성 추가
- 오라클로 마이그레이션 작업

### 20201210(목)
- 모달(Modal) : 이용자가 팝업 대화상자 내용을 작업하기 전에는 다른 화면으로 이동하지 못하는 방식의 팝업창
- 모달리스(Modeless) : 이용자가 팝업 대화상자 내용을 작업하기 전이라도 팝업창을 띄운 상태에서 다른 창으로 이동 가능
- 첨부파일 등록에 사용되는 form태그에는 특별한 속상이 추가되어야만, 파일 전송이 가능하다.
- > 속성 : encType="multipart/form-data" 필수. 파일 전송이 포함된 폼에서는 encType속성에서 파일분할로 전송해라.
- html 게시판 소스를 jsp로 변환.


### 20201209(수)
- 서버시간 가져오기 미션 MainController클래스 수정
- pom.xml 외부라이브러리를 관리하는 메이븐설정파일을 이용해서 외부모듈 가져와 사용하는 목적. 스프링프로젝트에서 메이븐 기본작업 테스트용
- Step3(열거형-Enum형 자료형클래스 사용) 를 생성
- 전체 틀 : 자바이론, 아래 데이터 흐름을 제어하는데 사용.
- > 여러명의 회원 정보(MemberVO-자료형클래스를이용부분)를
- > 전달주고받고(MainControler-메서드,URL호출부분),
- > 출력(MemberService-비지니스로직부분)하는 메소드 선언하기
- > 미지의 부분 -----------------------------------------
- > 데이터베이스CRUD처리부분(MemberDAO-데이터베이스엑세스부분)
- ====================================================================
- prefix(jstl), suffix(servlet-context.xml)
- 아래에서 사용된 prefix는 생략 가능하다.
- <beans:property name="prefix" value="/WEB-INF/views/" />
- 아래에서 사용된 suffix는 생략 가능하다.
- <beans:property name="suffix" value=".jsp" />
- @RequestMapping ... 반환값에서 prefix(/WEB-INF/views/)가 사용,suffix(.jsp)사용
-	...
-		return "{prefix}admin/board/board_list{sufflix};
-	...
- =====================================================================
- 스프링 관리자단에서 [게시물 관리]메뉴 만들기
- webapp/resources/html 만들고 jsp 변환 작업
- Rest API 방식으로 화면처리하는 것이 트렌드(빅데이터를 시각화하는데 RestAPI+Ajax 기술 사용)
- Rest: Representation 기존 데이터를 가지고, 화면 깜빡임 없이 데이터를 재가공하는 처리
- Rest API 사용되는 기술 : 데이터 전송/수신을 Ajax기술(프론트-개발자)로 처리. API(서버단기술)
- Ajax : Asyncronized Javascript and Xml, 비동기통신으로 자바스크립트로 JSON(text)를 재처리하는 기술

### 20201208(화)
- 파일입출력 처리 마무리
- member_list.jsp에서 MemberVO 클래스 테스트 사용 예정
- 데이터타입에 대해서 배열 타입, 리스트타입 그리고 해시타입
- 2차원 배열 타입 변수 -> 클래스 오브젝트 배열 타입 변수로 변경 -> 클래스오브젝트 List타입 변수로 변경
- 코드 인스펙션 : 코드 분석 -> 코드 생성
- 회사 자체 솔루션(프레임워크) 기반으로 직원들이 코딩작업한다.
- 선배와 같이 프로젝트 진행 3개월, 6개월 진행하면, 회사 자체 프레임워크(솔루션)를 이해하게됨
- =========================================================================
- 제네릭 : Generic 일반적인 변수 타입.
- Map<String, Integer> mapTest = new HashMap <String, Integer>();
- 제네릭을 사용하는 이유 : 코딩작업시 매개변수의 타입에 제한을 두어서, 값을 입출력할때 에러상황을 미리 확인.
- =========================================================================
- 람다식 : 자바버전8부터 지원하는 축소코딩 방식 -> 애로우화살표로 익명메소드(콜백함수)를 표시해서 자동실행 구현, Lambda클래스 만들어서 실습.
- 자바스크립트에서 콜백함수 부분을 애로우화살표(=>)로 대체해서 축약해서 표시해서 호출시 자동실행구현
- 람다식 사용은 특별한 로직이 없어서 논리적인 내용이 없고, 단순히 코드를 생략할 때 ->에로우, ()익명함수 이용해서 코드 사용을 축소하는 것에 의미가 있다.
- 우리나라 스프링에서는 일반적이지 않지만, 외국에서는 많이 사용. 외국 소스를 쓸 때, 람다식을 볼 줄 알아야 무리없이 외국 소스를 사용할 수 있다.
- =========================================================================
- 라이브러리(jar) : 오브젝트 클래스가 모여있는 패키지(묶음)을 라이브러리라고 함.
- 연산자 : +, - , *, /, =(대입연산자) ex) int sum = 3+5;
- 반복문 : for, forEach(가장 많이 사용), while(많이 안쓰는 이유: 무한루프로 빠지는 오류가 발생)
- forEach 예시) for(members:member_list){구현내용}
- 조건문 : if, switch(조건)~case문
- ====================================================
- Step2.java 클래스 파일 1개를 src/test/java 폴더 안에 kr.or.member 패키지를 만들어서 3개의 클래스 파일로 분리
- 즉, 3개의 자바클래스 모여서 1개의 프로그램이 된다. 이 말은, 진입점인 main() 1개만 필요하다.
- > 1. ERD 보고 MemberVO.java 클래스 만들기
- > 2. DB 자료를 가공하는(비즈니스 로직) 서비스 클래스 만들기
- > * 데이터를 가공한다는 것 : 데이터 select가져오기, insert입력하기, update수정하기, delete삭제하기 => (CRUD구현)

### 20201207(월)
- 다형성 : 오버로딩/오버라이딩을 구현할 때, 다형성을 사용한다.
- 동적바인딩 : 동적(runtime) 실행 시, 적용되는 값. 메소드의 매개변수(파라미터,인자값)는 메소드를 호출할 때, 값을 전송하게 되는데 이것을 바인딩한다고 한다.
- 예외처리 : 에러발생 시 프로그램을 멈추지않고, 계속 사용할 수 있도록 하는 목적. ex) 스마트폰 앱에서 에러발생 시, 앱이 종료되는 경우 계속 이어서 사용할 수 없다. 예외처리를 하게 되면 종료되지 않고, 그 화면만 사용하지 못하고, 다른 화면은 계속 사용 가능
- ===========================================================================
- java.lang 패키지 : Thread클래스는 통신프로그램에서 사용. ex)안드로이드앱
- 통신에서 Thread를 사용하는 이유?
- 데이터를 요청하고 응답을 받을 때까지 기다려야한다. -> 1개의 Thread가 기다린다.
- 위 상태에서는 통신프로그램때문에, 웹프로그램이 멈춰야한다. 이 상황을 방지하려고 비동기(다중) Thread를 사용한다. 
- 데이터를 응답받는 Thread 중간에, 다른 Thread를 실행하는 역할이 필요하다. 
- Thread특징 : 비동기적으로 run이 실행된다. 그래서 통신 프로그램에서 많이 사용 (ex.안드로이드앱)
- 마지막 달에 배우는 안드로이드앱도 자바 기반의 기술을 이용한다. 
- ===========================================================================
- 헤로쿠 클라우드에서는 HSql 데이터베이스(프로토타입)를 사용한다.
- 헤로쿠에서도 Mysql(MariaDB) DB를 사용할 순 있으나, 신용카드번호가 필요해서 보류한다.
- 로컬 PC에서는 HSql+Mysql -> 오라클용으로 마이그레이션해서 사용하는 방법을 배울 것이다.
- ===========================================================================
- File클래스와 입출력 스트림 : 게시판에서 파일업로드/다운로드 기술에 사용된다.
- 파일 업로드 경로가 없으면, /tmp에 저장된다. 이러면 업로드된 파일이 관리가 안되기 때문에, 위와 같은 경로로 경로 지정이 필요함.
- 헤로쿠에서 /tmp에 저장할것이나, 실제로는 tmp에 저장하면 서버ON/OFF시 tmp내용 사라진다.
- 실제 서버 운영에서는 파일업로드경로를 제대로 지정해야 한다.
- 바이트스트림(문자가 아닌 데이터) : InputStream(업로드), OutputStream(다운로드) 클래스 사용
- 게시판 첨부파일은 바이트스트림으로 데이터를 인풋, 아웃풋한다.
- 파일로부터 입력/출력이 필요할 때 : FileInputStream(FileReader), FileOutputStream(FileWriter)
- 이미지 파일을 업로드할 떄, 다운로드할 때 100MB 초고화질 이미지 제한 필요.-> 이미지크기(해상도)조정이 필요한 경우, 별도의 처리 클래스 필요. 1회 업로드 용량은 2M정도로 제한을 두는 코딩이 들어간다.
- 캐릭터스트림(문자데이터) : Reader, Writer 클래스 사용림
- ===========================================================================
- 

### 20201204(금)

이론
- 다국어지원하는 문자셋을 만들 때 : 유니코드로 만든다. \u0041->유니코드 에디터에서 A로 수정한다.
- 참조형 변수: 객체가 위치해 있는 주소 값을 저장한다. = 실행 가능한 변수 = 인스턴스변수 = 메모리에 로딩된 변수
- 참조형 변수 예) String s3 = new String(); s3="참조변수입니다"; // 인스턴스 변수를 이런 방식으로 만들어서 사용함.
- > new String()처럼 클래스이름과 똑같은 메소드를 생성자 메소드라고 한다.
- > new String("초기값인자");// ()안에 매개변수가 없는 생성자를 기본 생성자라고 한다.
- 클래스 만들 때 생성자 메소드를 만들 필요가 없다. 왜? 자바에서 컴파일할 때 자동으로 만들어주기 때문에 필수이지만 직접 만들 필요 없음.
- String 클래스 -> new 키워드로 만들어진 s3는 Object(객체), 인스턴스변수, 실행가능한 클래스 변수
- 기본형 변수 예) String s3 = "일반변수입니다";
- 일반변수는 기본형 변수를 사용. 단, 클래스형 변수는 new 키워드로 생성한 참조형 변수 주로 사용. 
- 스프링에서는 @inject(주입) 방식의 변수를 사용.(Dependency Inject, 의존성 주입) -> 스프링의 특징 
- 객체지향프로그래밍 : Object Oriented Programming, 인스턴스(실행가능한 클래스)를 사용하는 프로그램.
- new 키워드로 만드는 오브젝트를 사용한 방식이 필수.
- abstract(추상)클래스/메소드 예) 
- abstract class calc {add(){}; minus(){}; multi(){}, sub(){}; }
- 클래스는 개별 객체의 상태 정보를 저장하는 필드와 개별 객체의 행동 양식을 규정하는 메소드를 포함할 수 있다.

-------------------------------------------------------------

실습
- 자바프로그램 반복문 : 향상된 for문을 시작한다.
- member_list.jsp에 사용해보기
- 회원 멤버클래스 만들기 : 회원상태정보를 저장하는 필드(멤버변수: user_id, user_name, email,...) 생성. VO(Value Object) 클래스
- 회원 멤버변수의 행동양식을 규정하는 메소드(함수) 생성
- 자바 프로그램 : 배열, 추상,상속, 인터페이스 연습

### 20201203(목)

이론 
- 오픈소스 - 자바스크립트(웹브라우저용 js스크립트용, 프론트쪽) : 크롬브라우저만 있으면 실행 가능
- 오라클 - 자바(웹서버용 jsp컴파일언어, 백엔드쪽) : 크롬브라우저 + 톰캣 서버가 있어야만 실행 가능.
- 분산처리 : 댓글달기, Ajax = RESTAPI (개발의 핫 트렌드) - 대표 예시) 네이버아이디 로그인 구현
- 일반웹프로그램은 동기처리 : 화면 기능이 실행 중이면, 종료될 때까지 멈춰있다.
- 분산웹프로그램은 비동기처리 : 기능이 실행중이어도 다른 웹프로그램을 실행가능, 화면이 멈춰있지 않게 됨.
- javac HelloWorldApp.java -encoding uTF-8 (자바 컴파일 방법 : 소스에 한글 옵션)
- javac 자바컴파일러로 위에서 만든 HelloWorldApp.class파일은 실행가능한 파일
- 클래스파일 실행: java kr.or.test.HelloWorldApp (단, 실행할 위치 : src/test/java)
- 변수의 종류
- 지역변수 : 메소드 내에서 만든 변수, 메소드 안에서만 유효함
- 멤버변수(클래스변수) : 클래스 전역에서 사용가능한 변수. VO(Value Object) 클래스에서 주로 사용.
- static변수/메소드 : 클래스에서 유일한 변수/메소드 라는 말
- 인스턴스 클래스 = object = 실행가능한 클래스
- 파라미터 = 매개변수, 메소드명(파라미터위치);

## v3.0.0 화면구현
### 20201203(목)

실습
- 스프링관리자단 화면구현에서 왼쪽메뉴 active시키는 것 마무리
- > footer.jsp에 script 추가
- > current 변수에 location.pathname 값 반환.
- > *location.pathname 은 현재 선택된 URL 값을 가져오는 명령
- > current_2 변수 생성 -> 현재 URL 주소 중 맨 마지막 문자가 무엇인지 반환하여 배열에 저장
- > if문과 indexOf함수 사용해서 현재 URL주소에 current_2값이 포함되어 있다면 active 클래스 추가
- > indexOf 말고 includes 함수 사용해도 되지만, includes는 Chrome에서만 인식.
- > *active 클래스 : 선택한 메뉴의 배경 색상을 흰색으로 처리
- > *addClass, removeClass (클래스 추가, 클래스 제거)

- jsp화면에서 데이터 전송하기->admin컨트롤러로 데이터 수신받고 전송하기->jsp화면에서 데이터수신받기
- > AdminController 설정
- > (@RequestParam("가져올 데이터 이름 user_id")<데이터타입 String><가져온 데이터 담을 변수  user_ID>, Model model
- > model.addAttribute("attributeName (=user_id2)", attributeValue(=user_ID))
- > attributeValue값을 attributeName에 넣어서 사용한다.

- 헤로쿠 배포처리
- > 파스타정책이 체험신청기간이 2주로 줄어, 수료할 때 면접일정에 맞춰서 프로젝트를 파스타에 배포하는 것 추천

- ===========================================================
- 취업프로세스1 : 1.이력서+포트폴리오 2.면접 => 취업
- 취업프로세스2 : 1.이력서+포트폴리오 2.코딩테스트(자바, j쿼리) 3.면접 => 취업

### 20201202(수)
- 저장소 이름 : 변수(내용에 변하는 값을 java로 불러움) / 상수(내용에 정해진 값을 불러옴)
- 게시판 html화면 구현하기 전, 관리자관리 부분 제어용 컨트롤러 클래스 만듦
- admin/include/header.jsp의 메뉴링크를 html상대경로-> admin컨트롤러의 절대경로로 변경
-/admin/member_list(관리자관리 메뉴와 바인딩), /admin/board_list(게시물관리 메뉴와 바인딩)
- 데이터 전송/수신하는 관계는 나중에 진행. 오늘은 URL과 jsp만 바인딩시킨다.
- admin폴더의 2가지 기능 : 관리자관리(member폴더), 게시물관리(board폴더)
- 상대경로 : ./(현재폴더위치), ../(상위폴더위치), 파일위치를 지정할 때 사용. return(스프링반환값)
- 절대경로 : URL경로(웹브라우저로 접근가능한 경로)를 사용할 때, @RequestMapping에서(스프링)
- admin컨트롤러 클래스에서 URL경로와 실제jsp파일과 바인딩처리
- jsp파일에서 폼 action 속성값 == button태그의 submit값 이동, 링크경로를 html경로에서 컨트롤러의 바인딩 경로로 변경
- 게시물관리는 지금 하지 않고, 빈 화면 1개 만들어서 바인딩 처리 후, 헤로쿠 클라우드에 배포.
- 헤로쿠 배포 전에, 왼쪽 메뉴에서 선택된 메뉴(관리자관리or게시물관리)가 무엇인지 active시키는 jquery 적용하고 나서 업로드.
- ====================================================================

실습
- member_view.html 마무리
- member_write.html 화면 작업 : 부트스트랩 참조 URL (아래)
- http://localhost:8080/resources/pages/forms/general.html
 

### 20201201(화)
실습
- AdminLTE로 만드는 스프링 관리자 메인 화면구현 마무리
- 관리자 관리 : member_list.html, member_view.html, member_write.html
- 게시물 관리 : board_list.html, board_view.html, board_write.html
- 관리자단 화면 구현한 내용을 jsp로 만들어서 컨트롤러자바클래스에서 링크를 걸어준다.(프로그램 입히는 것은 4단원에서)
- =====================================================================
- 상대경로를 절대경로로 변경
- html lang="en" 이 부분은 pc가 영문 윈도우면 정상이지만, 우리 pc는 한글 윈도우이기 때문에, html lang="ko"로 변경하면 편리.
- member_list.html에 responsive hover table 소스 붙이기 (/resources/pages/tables/simple.html)


### 20201130(월)
- AdminLTE(부트스트랩기반 디자인템플릿)로 관리자단 화면을 구현.
- 위 템플릿을 사용한다는 것은, 템플릿의 html-css-js를 가져다가 사용하는 방법을 익히는 것이다.
- 위에서 화면구현 한 스태틱 html소스를(퍼블리셔가 만든소스), V6.0.0시간에 jsp로 변경해서, 프로그램을 입히게 된다.(개발자 하는일)

- AdminLTE 다운받은 압축파일 풀어서, 폴더(dist, pages, plugins) index(1,2,3).html 까지 6개 복사해서  src/webapp/resources에 붙여넣기
- index1.html 복사해서 home.html 만든 후, 필요한 부분만 남기고 삭제,수정하기
- =====================================================================
- 프론트엔드단 대세 중 2가지 플러그인(자바스크립트템플릿) 위에 포함되어 있다.
- 부트스트랩, chart(빅데이터 시각화할 때 사용하는 js템플릿)
- 고전 자바스크립트(네이티브 자바스크립트)에서는 위 문제가 에러표시가 되지만, 아래es6부터는 정상으로 표시됨. es6, es5(엑마스크립트 버전을 말한다.)
- 자바스크립트 버전, es5(2015년 js버전)이전버전-위 문제 에러, es6(2016년 js버전)-위 문제 정상.
- 그래픽 이미지 2가지: 비트맵이미지(jpg,png,gif 확대하면 깨짐), 벡터이미지(확대해도 깨지지 않는다. 스크립트(코드)로 만들어진 이미지)
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

```css
  *, :after, :before { /* 콜론 : 의 의미 - 가상요소 */
    -webkit-box-sizing: border-box; /* 크롬, 사파리용 크로스브라우징 때문에 추가  */
    -moz-box-sizing: border-box; /* 파이어폭스용 크로스브라우징 때문에 추가  */
    box-sizing: border-box; /* IE용 박스크기를 지정하는데 테두리 포함하겠다. */
	}

```

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
