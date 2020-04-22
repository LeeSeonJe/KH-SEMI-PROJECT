package customer.model.vo;

import java.sql.Date;

public class MyPageWorry {
	private String board_no;
	private String board_title;
	private String board_date;
	private String user_name;

	public MyPageWorry() {
		// TODO Auto-generated constructor stub
	}

	public MyPageWorry(String board_no, String board_title, String board_date, String user_name) {
		super();
		this.board_no = board_no;
		this.board_title = board_title;
		this.board_date = board_date;
		this.user_name = user_name;
	}

	public String getBoard_no() {
		return board_no;
	}

	public void setBoard_no(String board_no) {
		this.board_no = board_no;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public String getBoard_date() {
		return board_date;
	}

	public void setBoard_date(String board_date) {
		this.board_date = board_date;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	@Override
	public String toString() {
		return "MyPageWorry [board_no=" + board_no + ", board_title=" + board_title + ", board_date=" + board_date
				+ ", user_name=" + user_name + "]";
	}

}
