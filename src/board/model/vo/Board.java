package board.model.vo;

import java.sql.Date;

public class Board {
	private int board_no;
	private String board_title;
	private String board_content;
	private Date board_date;
	private String board_category;
	private int user_no;
	
	private String user_name;
	
	public Board() {}

	
	public Board(int board_no, String board_title, String board_content, Date board_date, String board_category,
			int user_no, String user_name) {
		super();
		this.board_no = board_no;
		this.board_title = board_title;
		this.board_content = board_content;
		this.board_date = board_date;
		this.board_category = board_category;
		this.user_no = user_no;
		this.user_name = user_name;
	}

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public String getBoard_content() {
		return board_content;
	}

	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}

	public Date getBoard_date() {
		return board_date;
	}

	public void setBoard_date(Date board_date) {
		this.board_date = board_date;
	}

	public String getBoard_category() {
		return board_category;
	}

	public void setBoard_category(String board_category) {
		this.board_category = board_category;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getUser_name() {
		return user_name;
	}


	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	@Override
	public String toString() {
		return "Board [board_no=" + board_no + ", board_title=" + board_title + ", board_content=" + board_content
				+ ", board_date=" + board_date + ", board_category=" + board_category + ", user_no=" + user_no
				+ ", user_name=" + user_name + "]";
	}

}
