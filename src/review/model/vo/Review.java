package review.model.vo;

import java.sql.Date;

public class Review {
	
	private int review_no;
	private int thumbs_up;
	private int heart;
	private char del_yn;
	private String title;
	private String content;
	private Date date;
	private String category;
	private String userName;
	private int user_no;
	private int cosmetic_no;
	
	public Review () {}

	public Review(int review_no, int thumbs_up, int heart, String title, String content, Date date, String category,
			String userName) {
		super();
		this.review_no = review_no;
		this.thumbs_up = thumbs_up;
		this.heart = heart;
		this.title = title;
		this.content = content;
		this.date = date;
		this.category = category;
		this.userName = userName;
	}


	public Review(int review_no, int thumbs_up, int heart, char del_yn, String title, String content, Date date,
			String category, String userName, int user_no) {
		super();
		this.review_no = review_no;
		this.thumbs_up = thumbs_up;
		this.heart = heart;
		this.del_yn = del_yn;
		this.title = title;
		this.content = content;
		this.date = date;
		this.category = category;
		this.userName = userName;
		this.user_no = user_no;
	}

	public int getReview_no() {
		return review_no;
	}

	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}

	public int getThumbs_up() {
		return thumbs_up;
	}

	public void setThumbs_up(int thumbs_up) {
		this.thumbs_up = thumbs_up;
	}

	public int getHeart() {
		return heart;
	}

	public void setHeart(int heart) {
		this.heart = heart;
	}

	public char getDel_yn() {
		return del_yn;
	}

	public void setDel_yn(char del_yn) {
		this.del_yn = del_yn;
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

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public int getCosmetic_no() {
		return cosmetic_no;
	}

	public void setCosmetic_no(int cosmetic_no) {
		this.cosmetic_no = cosmetic_no;
	}

	@Override
	public String toString() {
		return "Review [review_no=" + review_no + ", thumbs_up=" + thumbs_up + ", heart=" + heart + ", del_yn=" + del_yn
				+ ", title=" + title + ", content=" + content + ", date=" + date + ", category=" + category
				+ ", userName=" + userName + ", user_no=" + user_no + ", cosmetic_no=" + cosmetic_no + "]";
	}
	
	
}


