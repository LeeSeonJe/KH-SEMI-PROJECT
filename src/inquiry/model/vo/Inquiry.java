package inquiry.model.vo;

import java.sql.Date;

public class Inquiry {
	private int board_no;
	private String board_title;
	private String board_content;
	private Date board_date;
	private int user_no;
	private String user_name;
	
	private int inquiry_no;
	private String answer_yn;
	private String comments;
	private Date comment_date;
	
	public Inquiry() {}

	
	public Inquiry(String board_title, String board_content) {
		super();
		this.board_title = board_title;
		this.board_content = board_content;
	}


	public Inquiry(int board_no, String board_title, Date board_date, String user_name, String answer_yn) {
		super();
		this.board_no = board_no;
		this.board_title = board_title;
		this.board_date = board_date;
		this.user_name = user_name;
		this.answer_yn = answer_yn;
	}

	public Inquiry(int board_no, String board_title, String board_content, Date board_date, int user_no,
			String user_name, int inquiry_no, String answer_yn, String comments, Date comment_date) {
		super();
		this.board_no = board_no;
		this.board_title = board_title;
		this.board_content = board_content;
		this.board_date = board_date;
		this.user_no = user_no;
		this.user_name = user_name;
		this.inquiry_no = inquiry_no;
		this.answer_yn = answer_yn;
		this.comments = comments;
		this.comment_date = comment_date;
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

	public int getInquiry_no() {
		return inquiry_no;
	}

	public void setInquiry_no(int inquiry_no) {
		this.inquiry_no = inquiry_no;
	}

	public String getAnswer_yn() {
		return answer_yn;
	}

	public void setAnswer_yn(String answer_yn) {
		this.answer_yn = answer_yn;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public Date getComment_date() {
		return comment_date;
	}

	public void setComment_date(Date comment_date) {
		this.comment_date = comment_date;
	}


	@Override
	public String toString() {
		return "Inquiry [board_no=" + board_no + ", board_title=" + board_title + ", board_content=" + board_content
				+ ", board_date=" + board_date + ", user_no=" + user_no + ", user_name=" + user_name + ", inquiry_no="
				+ inquiry_no + ", answer_yn=" + answer_yn + ", comments=" + comments + ", comment_date=" + comment_date
				+ "]";
	}
	
	
}
