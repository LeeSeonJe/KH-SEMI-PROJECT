package hospital.model.vo;

import java.sql.Date;

public class HospitalReviewList {
	private String profile_image;
	private String user_name;
	private String age;
	private String skinType;
	private String gender;
	private String board_title;
	private String board_content;
	private Date board_date;
	private String review_heart;

	public HospitalReviewList() {
		// TODO Auto-generated constructor stub
	}

	public HospitalReviewList(String profile_image, String user_name, String age, String skinType, String gender,
			String board_title, String board_content, Date board_date, String review_heart) {
		super();
		this.profile_image = profile_image;
		this.user_name = user_name;
		this.age = age;
		this.skinType = skinType;
		this.gender = gender;
		this.board_title = board_title;
		this.board_content = board_content;
		this.board_date = board_date;
		this.review_heart = review_heart;
	}

	public String getProfile_image() {
		return profile_image;
	}

	public void setProfile_image(String profile_image) {
		this.profile_image = profile_image;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getSkinType() {
		return skinType;
	}

	public void setSkinType(String skinType) {
		this.skinType = skinType;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
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

	public String getReview_heart() {
		return review_heart;
	}

	public void setReview_heart(String review_heart) {
		this.review_heart = review_heart;
	}

	@Override
	public String toString() {
		return "CosmeticReviewList [profile_image=" + profile_image + ", user_name=" + user_name + ", age=" + age
				+ ", skinType=" + skinType + ", gender=" + gender + ", board_title=" + board_title + ", board_content="
				+ board_content + ", board_date=" + board_date + ", review_heart=" + review_heart + "]";
	}

}
