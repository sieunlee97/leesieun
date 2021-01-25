package org.edu.vo;

/**
 * PageVO클래스로서 회원, 게시판 공통으로 사용된다.
 * 1페이지당 보여줄 개수를 이용해서 전체 데이터를 분할해서 보여주는 역할 
 * 필요성 : 회원 또는 게시물이 10만건이라면, 한꺼번에 보여주게 되면 조회 속도가 매우 느리다. 
 * => 1페이지당 10개 또는 20개,30개 등 제한을 두어서, 속도 향상 및 사용자 화면을 개선
 * 아래 계산식에서 []부분이 멤버변수로 생성해야할 부분.
 * - 1페이지 계산>  10[1페이지당 출력할 개수] * (1[몇번째 페이지]-1) = 0
 * - 2페이지 계산>  10*(2-1) = 10[페이지 시작번호]
 * @author 이시은
 *
 */

public class PageVO {
	private String board_type;
	private int perPageNum; // 리스트하단에보이는 번호의 개수 (페이징리스트목록개수)
	private int queryPerPageNum; //쿼리에서 1페이지당 출력할 자료 개수 변수
	private Integer page; //jsp에서 선택한 페이지 번호값이 들어가는 변수
	private int queryStartNo; //[계산식] 쿼리에서 사용되는 시작인덱스값 변수
	private boolean prev; //[계산식]페이징에서 이전 번호가 있을 때 표시값이 들어가는 변수
	private boolean next; //[계산식]페이징에서 이후 번호가 있을 때 표시값이 들어가는 변수
	//위의 프리뷰, 넥스트 변수 값이 있는지 없는지 확인하려면, [계산식]이 필요하다. 계산할 때 필요한 변수 3개(아래)
	private int totalCount;//회원(게시물) 전체의 개수값이 들어가는 변수
	private int startPage;//jsp화면에서 보여주는 페이징 리스트의 시작 번호
	private int endPage;//jsp화면에서 보여주는 페이징 리스트의 끝 번호
	//start페이지와 end페이지 변수가 필요한 이유?
	// ex) <  1  2  3  4  5  6  7  8  9 10 > 페이징 리스트의 시작(1)과 끝(10) 값이 바뀌게 된다.
	// ex) < 11 12 13 14 15 16 17 18 19 20 > 시작(11), 끝(20)
	//검색에 필요한 변수 2개도 포함시켜서, 컨트롤러에서 매개변수 사용을 줄인다.(아래)
	private String search_type; //검색조건(분류)
	private String search_keyword; //검색어
	
//================================================================================	
	// 전체 클래스에서 [계산식] 4개 필요 -> 개발자가 만듦
	// 계산식 4개로 반환되는 값 : startPage, endPage, prev, next
	private void calcPage() {
		// page변수는 현재 jsp에서 클릭한 페이지번호를 1을 받아서 아래 계산식에서 사용
		// (int)형변환 : 2.1 , 2.8 모두 형변환하면 2로 출력
		// ceil메소드 : 천장값을 반환   1.1 -> 2, 2.3 -> 3
		// floor메소드 : 바닥함수 반환 1.1 -> 1, 2.3 -> 2
		// ceil(1/10) => 0.1 -> 1
		// ceil((1/10)*10) -> 10페이지
		int tempEnd = (int)(Math.ceil(
				page/(double)this.perPageNum)*this.perPageNum
				);
		//jsp에서 클릭한 페이지번호 예로 1을 기준으로 끝페이지를 계산한다.(위)
		// ex) <  1  2  3  4  5  6  7  8  9 10(tempEnd) > 페이징 리스트의 시작(1)과 끝(10) 값이 바뀌게 된다.
		// ex) < 11 12 13 14 15 16 17 18 19 20(tempEnd) > 시작(11), 끝(20)
		this.startPage = ((tempEnd-this.perPageNum)+1);
		// jsp에서 11을 클릭했을 때 (20-10)+1 = 11(start 페이지)(위)
		
		// ex) 20 * 10 = 200개의 레코드 (회원(게시물))
		// 만약 회원(게시물)이 195개 일 경우가 있다.
		if( tempEnd*this.queryPerPageNum > this.totalCount ) { //ex. 200>195 
			//클릭한 page번호로 계산된 게시물 수가 실제 회원(게시물)수(totalCount)보다 클 때
			this.endPage = (int)Math.ceil(
					this.totalCount/(double)this.queryPerPageNum
					); // 195 / 10 = 19.5 -> 20 
		} else { // 전체게시물 수(totalCount) = 195개인데, 1페이지 클릭한 경우 
				 // 195/10 계산으로 20페이지가  endPage가 되면 안되기 때문에, else로 처리
			this.endPage = tempEnd;
		}
//=====================(위)startPage, endPage구하는 계산식============================
		
		this.prev = this.startPage != 1; 
		// ex. startPage = 11 일 때, 결과값은 true
		//시작 페이지가 1보다 크면 무조건 이전 페이지가 있다로 본다.(위)
		this.next = (this.endPage*this.queryPerPageNum < this.totalCount); 
		// 20 * 10 < 195 일 때, 결과값은 false => jsp에서 > 안보임.
		//ex) < 11 12 13 14 15 16 17 18 19 20(tempEnd) > 시작(11), 끝(20)
		
//===================-======(위)prev, next 계산식===================================	
	}
	
	public String getBoard_type() {
		//this.board_type = "notice"; // 세션 변수를 사용할 예정
		return board_type;
	}

	public void setBoard_type(String board_type) {
		this.board_type = board_type;
	}

	public int getPerPageNum() {
		return perPageNum;
	}
	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
	}
	
	public int getQueryPerPageNum() {
		return queryPerPageNum;
	}

	public void setQueryPerPageNum(int queryPerPageNum) {
		this.queryPerPageNum = queryPerPageNum;
	}

	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public int getQueryStartNo() {
		// DB쿼리에서 사용 시작 인덱스번호(0)를 구하는 계산식
		// 계산식 =  (jsp에서 클릭한 페이지 번호 -1) * 페이지당 보여지는 페이지번호 개수
		// 1페이지 계산>  10[1페이지당 출력할 개수] * (1[몇번째 페이지]-1) = 0
		// 2페이지 계산>  10*(2-1) = 10[페이지 시작번호]
		queryStartNo = queryPerPageNum*(this.page-1); //개발자가 추가한 계산식
		return queryStartNo;
	}
	public void setQueryStartNo(int queryStartNo) {
		this.queryStartNo = queryStartNo;
	}
	public boolean getPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean getNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		// totalCount 변수값이 만들어지는 순간, totalCount값을 필수로 하는 calcPage메소드 실행
		// -> 4개의 변수값 반환
		calcPage();
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public String getSearch_type() {
		return search_type;
	}
	public void setSearch_type(String search_type) {
		this.search_type = search_type;
	}
	public String getSearch_keyword() {
		return search_keyword;
	}
	public void setSearch_keyword(String search_keyword) {
		this.search_keyword = search_keyword;
	}
	
}
