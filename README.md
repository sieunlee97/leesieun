## 응용SW기초기술활용과목(4개의 단원)
### 20201112(목)
이론

4단원: 개발환경 구축하기 시작
- 빌드(building:건축물): 1. Maven(메이븐,이클립스에서), 2.Gradle(그래들,안드로이드스튜디오 앱)
- ***빌드는 자바소스코드(.java)를 컴파일(.class)하고, 실행가능하게 프로그램모듈을 묶어(패키징)하는 역할.
- 국방부(시청,관공서)와 같이 인터넷망이 분리되어 있는 곳은 망이 분리되어 있어서 프로그램모듈을 인터넷으로 다운받지 못해서, 개발도 못하고, 실행도 안된다.
- 그래서, 메이븐(프로그램모듈관리)에서 레포지토리를 설정하는 과정이 필요합니다.
- *** Maven(메이븐)이라는 프로그램모듈(기능묶어놓은것-조립,분해가 가능것)관리하는 툴로 자동으로 다운로드 받게 됩니다.
- *** 위 메이븐에서 관리하는 프로그램모듈들이 저장되는 위치가 Repository 입니다.
- 프레임워크: 개발에 필요한 여러가지 유틸리티, 플러그인프로그램을 모아서
- 일일이 해당되는 프로그램을 웹페이지에서 다운받는게 아니고, 플러그인을 인터넷으로 다운받아서 웹프로그램에서 사용하게됩니다.
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
- 지금은 개발자가 (서버관리자않통하고)클라우드에 바로 배포합니다.(대세)
- 깃서버와 이클립스 소스 연동
- 깃 저장 순서 : 커밋(.git폴더에 저장 OK) + 푸시(github.com에 저장 OK)
- 커밋만 하면, github.com에 저장 안 됨.
- 형상관리 =버전관리 = 소스관리 = 팀작업
- 깃에 올릴 때, 제외시킬 폴더 지정. target폴더를 깃에서 제외시키는 방법
 : .gitignore 파일을 만들어서, target 이름을 적음
실습4 : 헤로쿠 클라우드에 leesieun 프로젝트 배포, 도메인 URL로 크롬에서 확인
- 아마존웹서비스(AWS)도 마찬가지, 클라우드 파스타와 마찬가지로, 헤로쿠도 클라우드 설정파일을 작성해야지만 작동이 된다.
- 파일 이름은 Procfile (확장자 없음)
- war : 웹실행파일 / jar(Java ARchive 파일) : 자바 샐행 파일

이클립스 사용법)
- 화면 왼쪽 상단 : Package Explorer 패키지 탐색기로 보이게 된다.
- Perspective : 개발자 관점(java, eGov개발자 관점)
- 관점이 너무 이상하게 변해있다면, Window 메뉴>Perspective>Reset~ 클릭으로 해결
- 파일저장 : 화면상단 메뉴아이콘 중 디스켓 모양 클릭 또는 Ctrl+s 저장.
- root : 최상위 위치를 가리킨다.

### 20201111(수)
이론

3단원 : 네트워크 기초 활용하기.
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
- 2단원: 데이터베이스 기초 활용하기: 단원만 마무리되었고, 6개간 지겹도록 하시게 됩니다.
- 전산전공자 - 비전산전공자
- 현업-정보처리기사 크게 의미 없습니다.
- IT분야 현업에서는 1번 해봤다->위주수업진행됩니다.
- 구글에 오픈소스가 많기 때문에, 현업에서는 전공/비전공 의미 없습니다.
- 정보처리기사 시험- 전공자유리 이론시험위주
- 2. 테이블에 자료 입력,조회,수정,삭제 작업예정.
- 인프런(검색) : 무료강의 10분단위이기때문에, 한번씩, 자바, 스프링, 자바스크립트 들으시면 도움이 됩니다.
- CRUD SQL쿼리 실행해 보았습니다.
- Auto Increament : 자동증가처리 개발자를 편하게 해주는 대신,
- 단, 중간 이빨이 빠진 번호가 생깁니다.
- 나중에 jsp(html)에서 출력시 처리해서, 이빨빠진것 없이 보이게처리합니다.
- 위와 같은 것을 다른 Paging 처리 한다고 합니다.
- 페이징처리 한다고해서, 위 에 DB select 원본값이 변하는 것이 아니고,
- 웹프로그램 화면에서 보이기만 이빨 안빠지게 보이게 합니다.
- SQL쿼리 실행시 에러확인: table alreay exist 기존에 테이블이 있으니, 먼저 처리하고, 다시실행.
- 화면 하단(옛날에 CLI 쿼리방식) -> 화면상단(GUI 방식)
- N/A: No Acount 테이블이 아무것도 없다.
- 물리모델ERD(설계도)를 실제 데이터베이스edu에 싱크로나이즈(동기화)시키면, 
- edu데이터에베이스 테이블이 만들어 집니다.
- seq_id:  sequence (시퀸스=순서)
- 인터넷강의 돌려보실수 있으나, 줌은 돌려보실수 없습니다.
- 한번 놓치시더라도, 반복하기때문에 지나셔도 괞찬습니다.
- 단, 수업진도 같이 가셔야, 나중에 반복할때 다시 듣게 됩니다.
- 물리ERD만드실때, 테이블,필드명은 소문자로 합니다.
- 20201111.mwb ( mysql workbench 파일 )
- 왜냐하면, 대소문자를 구분해서 Client != client 사용하는 경우가 있습니다.
- 인덱스 예 배열변수, var member (=엔티티,테이블-표) = [
			{name: "김일국", gender : "남자", age: 40},
			{name : "이병현" , gender : "남자", age: "서른살"},
			{name : "남가인" , gender : "여자", age: 20}
		];
- 위 상황에서는 age 에서 에러(error)가 발생됩니다.
- 이런 에러상황을 방지하기 위해서 데이터형태가 존재 합니다.
- 이런 데이터형태를 DataType (데이터타입)이라고 합니다.
- 물리모델ERD만들실때, 주석입력은 해 주셔야지 개발자들이 작업이 가능하게됨.
- 주석: Comments
- 데이터타입: 바차varchar(45); 영문자열 45글자를 저장가능하다.
- 질문: 우편번호, 연락처는 문자열(varchar) 했은데, 숫자기 때문에 int으로 해야..
- 답변: 유연한 개발을 하기 위해서, 우편번호:111-11, 연락처:010-111-1111
- 유연한 개발을 위해서, 확실한 숫자값이 아니면, 문자열로 하시는 것이 좋습니다.
- AI: Auto Increament 자동증가: 1, 2, 3, 4 int정수값을 자동으로 입력해 줌.
- AI 로 자동증가된 정수값을 색인Index용으로 사용하게 됩니다.
- AI 앞에 NN(Not Null): 빈공백값을 허용하지 않겠다.
- NN 앞에 있는 PK(Primary Key): 기본키(고유식별키) 색인키 index키
- PK는 사람으로 치면 주민번호와 같은 역할 입니다.(우리나라에 고유1명)
- 예를 들면, 데이터가 10개 입력되어 있다면,
- delete from client where client_id = 10;
- 클라이언트 테이블에서 클라이언트_아이디가 10번인 가로줄을 삭제하겠다.
- insert into client values('값1', '값2', '값3', now());
- Type : 숫자(int, number), 문자열(varchar), 글내용(text), 날짜(date, timestamp)
- time stamp(시간 도장) : 1970년 1월1일 부터 지금까지 시간을 1초 단위변환한 값.
- timestamp 값은 1605055186 초 => 1970년기준 초단위변환 => 20201111
- 1. wamp 실행 -> 2. 워크벤치 실행 -> 3. DB커넥션 실행 + 어제 Model 오픈.
- 데이터베이스 ERD -> 실제 물리 테이블로 싱크맞추기 예정.
- SQL쿼리실행: 위에서 만든 테이블에 데이터 CRUD(입력,조회,수정,삭제)하기 예정.
- SQL : Structure Queary Language 구조적 질의 언어, 체계가 있는 묻고 답하기 언어
- Insert Into 입력테이블명~
- Select from 조회테이블명~ (where)
- Update 수정테이블명 Set 필드명 ~where
- Delete from 삭제테이블명 where ~

- 암호는 공통 으로 지정합니다: apmsetup
- 1. 마리아DB데이터베이스 관리자root 암호지정. ( 웹프로그램 개발시 필수 )
- phpMyAdmin 웹프로그램에서 암호없이 로그인 
- > 로그인 후 상단 메뉴중 사용자 계정 클릭
- > 제일아래 root 계정 localhost 권한수정 버튼 클릭
- > 권한수정 화면 상단 [암호변경] 버튼클릭
- > 마지막으로 암호 옵션에서 apmsetup 입력처리
-----------------------------------------------------------------------------
- 2. 마리아DB한글입출력이 가능하게 처리. ( 웹프로그램 개발시 필수 )
- UTF-8: 유니코드 타입 폰트 약자(Unicode Type Font) 다국어:한국어, 일본어, 베트남 등등...
- wamp서비스 모두중지 -> mariaDB에서 my.ini (initialize초기화설정파일) 수정 후
- > wamp서비스 모두재실행 끝
----------------------------------------------------------------------------
- Mysql서비스 Stop 중지클릭 -> Remove Service 클릭
- Maria DB포트 3307 -> 3306 변경예정.
- localhost 특별한 도메인PC에서 인식하는 : http://localhost/ 실행(개발자용도메인)
- http://127.0.0.1 (개발자용 전용의 PC 아이피) = http://localhost
- 포트: 서비스 위치( http://kimilguk-mysql.paas-ta.org:80포트 )
- 웹서비스: http://localhost:80 포트
- Mysql DB서비스: http://localhost:3306 포트 -> 3308포트로 변경
- Maria DB서비스: http://localhost:3307 포트 -> 3306포트로 변경
- 톰켓(자바스프링서비스): http://localhost:8080 포트
- 오라클 DB서비스는? : http://localhost:9000 포트
- 실습준비: wamp 확인 ( Windows Apache웹서버, Mysql서버(마리아DB), Php서버 )
- 코딩 참조: stackoverflow
- 오픈소스참조: sourceforge : wamp 3.2x 기본이 mariaDB (it 강의저장소 3.1x 기본 mysql)
- 워크벤치로 백업 도 실습하실 예정 입니다.
- index = 색인을 만들면 장점은 검색속도 빨라집니다. 모든검색하지 않고, 검색키값만 검색
- index 자동으로 만들어 집니다. 테이블 생성할때, 기본키(Primary Key: PK)만들때 자동생성
- var member = [ {name:"김일국"}, {name:"김일국"}, {name:"남가인"} ];
- Update 명령어는 주의: update member SET name = "김일국"; //이렇게 실행 시말서
- delete from member; //위 3개 데이터 모두 지워집니다.
- delete from member where index = 0;
- update member SET name = "김일국" where index = 1; 이렇게 해서 1개 수정하게처리
- * 애스터리스크 , ? 물음표 : 와일드 카드(대체가능한) 문자
- abc.txt = a?c.txt : 물음표는 1개의 문자만 대체가능합니다.
- abc.txt = *.txt : 별표는 여러개의 문자를 대체가능합니다.
- 자바 : 프로그래밍 언어.
- 데이터베이스 언어 분류: DDL, DCL, DML
- DDL: Data Definition(정의) Language 테이블+필드생성명령어 Create Table..., Alter Table
- DCL: Data Controll(제어) Language 예, show tables (테이블명을 출력하는 명령어)
- DML: Data Manufulation(조작) Language 데이터 생성, 수정, 삭제명령어 Insert, Update, Delete ...
- 워크벤치 ERD를 논리모델로 만들어서 실제 물리DB에 밀어넣어서 동기화(싱크) 시킵니다.
- ERD 스키마(구조): 논리모델, 물리모델(Model=데이터베이스)
- 참고: MVC 개발방식, Model(db)-View(jsp,html)-Controller(java)
- 관계: 1:m(many, 1대다관계), n:m(다대다관계)
- var member (=엔티티,테이블-표) = [ 자바-스프링에서는 VO(Value Object)클래스라고 함.
			{name (=속성,필드,컬럼) : "김일국" (=속성값,필드값) ...

- 5명 6개월 선문대 : 개발이사1(ERD), 개발팀과장남1,여1(ERD보고 기본CRUD구현), 
- 개발팀대리1(jsp생산), 디자인팀대리1(퍼블리싱)
- CRUD: Create(입력-insert), Read(조회-select), Update(수정), Delete(삭제)
- E-R다이어그램(도형ERD) : Entity(테이블-표) - Relation(관계-닭발) 워크벤치에서 구현합니다.
- 제조업 같은 경우: 300인 이상을 중소기업이라고 합니다.
- IT 같은 경우: 직원 10인 이상, 연매출액 10억이상 중소기업(주식회사) 입니다.
- 개발하기전 데이터베이스를 선택: oracle, mysql, maria, mongo 기타 등등
- 용어 : | = 파이프라인 = 또는
- 관계형데이터베이스 관계기호: 1개 : 0개 | 닭발(까마귀발=CrowFoot)
- 관계형데이터베이스: RDBMS(Relational DataBase Management System)
- 관계형: 자료(테이블=표)사이에 부모-자식.
- 게시판(부모) <- 댓글(자식)
- 1개의 게시물(부모) > 댓글(자식들) 1, 2, 3, 4.....
- 만약 게시물-댓글 관계가 없다고 하면, 댓글이 어떤 게시물에 대한 댓글 모르게 됨.
- 그래서, 관계(부-자) 가 필요합니다.
- mysql시작(오픈소스-오라클에 팔려서), oracle마무리(상용)
- mysql 만드사람이 오라클 퇴사 후 자기 딸 이름으로 maria(마리아) DB를 만드었습니다.
- 오픈소스로 만들었습니다. 요즘 오라클회사의 mysql 유료화 될 수 있기때문에
- 그래서, 마리아 DB(mysql과 호환됨)를 사용합니다.
- 맥(부트캠프기반) 윈도 mysql실행이 않됨. 겸사겸사 마리아 DB로 진행 하겠습니다.
- 오라클 Java8 대신에 OpenJDK 8 사용하는 것과 같이(두버전 모두 호환됨)
- 오라클의 mysql대신에 maria DB(오픈소스)사용 합니다.(두버전 모두 호환됨)

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
- 데이터베이스 용어중 인덱스가 뭔지 확인: 크롬 > 개발자도구로 확인
=============================================================================================
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


#### 20201109 (월)
이론

1단원: 운영체제 기초기술 활용
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

--------------------------------------------------------------------------------------------------------
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
