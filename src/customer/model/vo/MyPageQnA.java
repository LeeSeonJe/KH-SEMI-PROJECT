package customer.model.vo;

public class MyPageQnA {
	private String user_no;
	private String board_title;
	private String board_content;

	public MyPageQnA() {
		// TODO Auto-generated constructor stub
	}

	public MyPageQnA(String user_no, String board_title, String board_content) {
		super();
		this.user_no = user_no;
		this.board_title = board_title;
		this.board_content = board_content;
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

	@Override
	public String toString() {
		return "MyPageQnA [user_no=" + user_no + ", board_title=" + board_title + ", board_content=" + board_content
				+ "]";
	}

}
