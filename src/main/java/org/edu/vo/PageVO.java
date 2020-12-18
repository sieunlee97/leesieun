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
	private Integer perPageNum; //1페이지당 출력할 개수값이 들어가는 변수
	private Integer page; //jsp에서 선택한 페이지 번호값이 들어가는 변수
	private Integer startNum; //[계산식] 쿼리에서 사용될 시작번호가 들어가는 변수
	private Boolean prev; //[계산식]페이징에서 이전 번호가 있을 때 표시값이 들어가는 변수
	private Boolean next; //[계산식]페이징에서 이후 번호가 있을 때 표시값이 들어가는 변수
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
	public Integer getPerPageNum() {
		return perPageNum;
	}
	public void setPerPageNum(Integer perPageNum) {
		this.perPageNum = perPageNum;
	}
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getStartNum() {
		return startNum;
	}
	public void setStartNum(Integer startNum) {
		this.startNum = startNum;
	}
	public Boolean getPrev() {
		return prev;
	}
	public void setPrev(Boolean prev) {
		this.prev = prev;
	}
	public Boolean getNext() {
		return next;
	}
	public void setNext(Boolean next) {
		this.next = next;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
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
