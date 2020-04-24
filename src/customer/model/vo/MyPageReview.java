package customer.model.vo;

public class MyPageReview {
	private String user_id;
	private String user_name;
	private String board_no;
	private String board_title; //
	private String board_date; //
	private String cosmetic_name;//

	private String board_content; //
	private String brand_name; //
	private String cosmetic_img; //
	private String review_heart; //
	private String cosmetic_no; //

	public MyPageReview() {
		// TODO Auto-generated constructor stub
	}

	// 마이페이지에서 리뷰 받아오는 요소
	public MyPageReview(String user_id, String user_name, String board_no, String board_title, String board_date,
			String cosmetic_name) {
		super();
		this.user_id = user_id;
		this.user_name = user_name;
		this.board_no = board_no;
		this.board_title = board_title;
		this.board_date = board_date;
		this.cosmetic_name = cosmetic_name;
	}

	
	
	public MyPageReview(String board_no, String board_title, String cosmetic_name, String board_content,
			String brand_name, String review_heart, String cosmetic_no) {
		super();
		this.board_no = board_no;
		this.board_title = board_title;
		this.cosmetic_name = cosmetic_name;
		this.board_content = board_content;
		this.brand_name = brand_name;
		this.review_heart = review_heart;
		this.cosmetic_no = cosmetic_no;
	}

	// 마이페이지에서 수정시 받아올 요소

	public MyPageReview(String board_no, String board_title, String board_date, String cosmetic_name, String board_content,
			String brnad_name, String cosmetic_img, String review_heart, String cosmetic_no) {
		super();
		this.board_no = board_no;
		this.board_title = board_title;
		this.board_date = board_date;
		this.cosmetic_name = cosmetic_name;
		this.board_content = board_content;
		this.brand_name = brnad_name;
		this.cosmetic_img = cosmetic_img;
		this.review_heart = review_heart;
		this.cosmetic_no = cosmetic_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
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

	public String getCosmetic_name() {
		return cosmetic_name;
	}

	public void setCosmetic_name(String cosmetic_name) {
		this.cosmetic_name = cosmetic_name;
	}

	public String getBoard_content() {
		return board_content;
	}

	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}

	public String getBrnad_name() {
		return brand_name;
	}

	public void setBrnad_name(String brnad_name) {
		this.brand_name = brnad_name;
	}

	public String getCosmetic_img() {
		return cosmetic_img;
	}

	public void setCosmetic_img(String cosmetic_img) {
		this.cosmetic_img = cosmetic_img;
	}

	public String getReview_heart() {
		return review_heart;
	}

	public void setReview_heart(String review_heart) {
		this.review_heart = review_heart;
	}

	public String getCosmetic_no() {
		return cosmetic_no;
	}

	public void setCosmetic_no(String cosmetic_no) {
		this.cosmetic_no = cosmetic_no;
	}

	@Override
	public String toString() {
		return "MyPageReview [user_id=" + user_id + ", user_name=" + user_name + ", board_no=" + board_no
				+ ", board_title=" + board_title + ", board_date=" + board_date + ", cosmetic_name=" + cosmetic_name
				+ ", board_content=" + board_content + ", brand_name=" + brand_name + ", cosmetic_img=" + cosmetic_img
				+ ", review_heart=" + review_heart + ", cosmetic_no=" + cosmetic_no + "]";
	}

}
