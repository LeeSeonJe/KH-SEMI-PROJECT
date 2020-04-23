package customer.model.vo;

public class MyPageQnA {
	private String user_no;
	private String board_title;
	private String board_content;
	private String user_id;
	private String user_name;
	private String board_no;
	private String board_date;
	private String answer_yn;
	private String comments;
	private String comment_date;
	
	public MyPageQnA() {
		// TODO Auto-generated constructor stub
	}

	public MyPageQnA(String user_no, String board_title, String board_content) {
		super();
		this.user_no = user_no;
		this.board_title = board_title;
		this.board_content = board_content;
	}

	public MyPageQnA(String user_id, String user_name, String board_no, String board_title, String board_date,
			String answer_yn, String comments, String comment_date) {
		super();
		this.user_id = user_id;
		this.user_name = user_name;
		this.board_no = board_no;
		this.board_title = board_title;
		this.board_date = board_date;
		this.answer_yn = answer_yn;
		this.comments = comments;
		this.comment_date = comment_date;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getBoard_no() {
		return board_no;
	}

	public void setBoard_no(String board_no) {
		this.board_no = board_no;
	}

	public String getBoard_date() {
		return board_date;
	}

	public void setBoard_date(String board_date) {
		this.board_date = board_date;
	}

	public String getAnswer_yn() {
		return answer_yn;
	}

	public void setAnswer_yn(String answer_yn) {
		this.answer_yn = answer_yn;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_no(String user_no) {
		this.user_no = user_no;
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

	public String getUser_no() {
		return user_no;
	}

	public void setUser_id(String user_no) {
		this.user_no = user_no;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public String getComment_date() {
		return comment_date;
	}

	public void setComment_date(String comment_date) {
		this.comment_date = comment_date;
	}

	@Override
	public String toString() {
		return "MyPageQnA [user_no=" + user_no + ", board_title=" + board_title + ", board_content=" + board_content
				+ ", user_id=" + user_id + ", user_name=" + user_name + ", board_no=" + board_no + ", board_date="
				+ board_date + ", answer_yn=" + answer_yn + "]";
	}

}
