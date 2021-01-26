package org.edu.vo;

public class BoardTypeVO {
	private String board_type;
	private String board_name;
	private Integer board_sun;
	
	
	public String getBoard_type() {
		return board_type;
	}
	public void setBoard_type(String board_type) {
		this.board_type = board_type;
	}
	public String getBoard_name() {
		return board_name;
	}
	public void setBoard_name(String board_name) {
		this.board_name = board_name;
	}
	public Integer getBoard_sun() {
		return board_sun;
	}
	public void setBoard_sun(Integer board_sun) {
		this.board_sun = board_sun;
	}
	@Override
	public String toString() {
		return board_type;
	}
	
	
}
