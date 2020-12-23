package org.edu.vo;

import java.util.Date;

/**
 * 게시판에서 사용되는 데이터 입출력 클래스
 * @author 이시은
 *
 */
public class BoardVO {
	//멤버변수 선언
	private Integer bno; //int는 입력값이 null일 때 에러나기 때문에, Integer로 변경
	private String title;
	private String content;
	private String writer;
	private Date reg_date;
	private Date update_date;
	private Integer view_count;
	private Integer reply_count;
	
	@Override
	public String toString() {
		return "디버그 BoardVO [bno=" + bno + ", title=" + title + ", content=" + content + ", writer=" + writer + ", regdate="
				+ reg_date + ", update_date=" + update_date + ", view_count=" + view_count + ", reply_count="
				+ reply_count + "]";
	}
	
	public Integer getBno() {
		return bno;
	}
	public void setBno(Integer bno) {
		this.bno = bno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public Date getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(Date update_date) {
		this.update_date = update_date;
	}
	public Integer getView_count() {
		return view_count;
	}
	public void setView_count(Integer view_count) {
		this.view_count = view_count;
	}
	public Integer getReply_count() {
		return reply_count;
	}
	public void setReply_count(Integer reply_count) {
		this.reply_count = reply_count;
	}
	
}
