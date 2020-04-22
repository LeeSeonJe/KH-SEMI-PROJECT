package review.model.vo;

import java.sql.Date;

public class Review {
	
	private int review_no;
	private int thumbs_up;
	private int heart;
	private String del_yn;
	private String title;
	private String content;
	private Date date;
	private String category;
	private String userName;
	private int user_no;
	private int cosmetic_no;
	private String cosmetic_name;
	private String cosmetic_img;
	private int thumbs_down;
	
	private int age;
	private String skintype;
	private String gender;
	private String profile_image;
	
	public Review () {}

	
	public Review(int review_no, int thumbs_up, int heart, String del_yn, String title, String content, Date date,
			String category, String userName, String cosmetic_name, String cosmetic_img, int thumbs_down, int age,
			String skintype, String gender, String profile_image) {
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
		this.cosmetic_name = cosmetic_name;
		this.cosmetic_img = cosmetic_img;
		this.thumbs_down = thumbs_down;
		this.age = age;
		this.skintype = skintype;
		this.gender = gender;
		this.profile_image = profile_image;
	}

	public Review(String title, String cosmetic_name, String cosmetic_img) {
		super();
		this.title = title;
		this.cosmetic_name = cosmetic_name;
		this.cosmetic_img = cosmetic_img;
	}


	public Review(String title, int cosmetic_no) {
		super();
		this.title = title;
		this.cosmetic_no = cosmetic_no;
	}

	public Review(int thumbs_up, String title) {
		super();
		this.thumbs_up = thumbs_up;
		this.title = title;
	}

	public Review(int review_no, int thumbs_up, String title) {
		super();
		this.review_no = review_no;
		this.thumbs_up = thumbs_up;
		this.title = title;
	}

	public Review(int review_no, int thumbs_up, int heart, String title, String content, Date date, String category,
			String userName, int thumbs_down) {
		super();
		this.review_no = review_no;
		this.thumbs_up = thumbs_up;
		this.heart = heart;
		this.title = title;
		this.content = content;
		this.date = date;
		this.category = category;
		this.userName = userName;
		this.thumbs_down = thumbs_down;
	}


	public Review(int review_no, int thumbs_up, int heart, String title, String content, Date date, String category,
			String userName, int user_no, int cosmetic_no) {
		super();
		this.review_no = review_no;
		this.thumbs_up = thumbs_up;
		this.heart = heart;
		this.title = title;
		this.content = content;
		this.date = date;
		this.category = category;
		this.userName = userName;
		this.user_no = user_no;
		this.cosmetic_no = cosmetic_no;
	}

	public Review(int review_no, int thumbs_up, int heart, String del_yn, String title, String content, Date date,
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
	

	public Review(String title, int user_no, String content, String cosmetic_name, int review_no, int thumbs_up,
			String cosmetic_img, int cosmetic_no, String category, Date date, int heart, String del_yn, String userName,
			int thumbs_down) {
		super();
		this.title = title;
		this.user_no = user_no;
		this.content = content;
		this.cosmetic_name = cosmetic_name;
		this.review_no = review_no;
		this.thumbs_up = thumbs_up;
		this.cosmetic_img = cosmetic_img;
		this.cosmetic_no = cosmetic_no;
		this.category = category;
		this.date = date;
		this.heart = heart;
		this.del_yn = del_yn;
		this.userName = userName;
		this.thumbs_down = thumbs_down;
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

	public String getDel_yn() {
		return del_yn;
	}

	public void setDel_yn(String del_yn) {
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

	
	
	public String getCosmetic_name() {
		return cosmetic_name;
	}


	public void setCosmetic_name(String cosmetic_name) {
		this.cosmetic_name = cosmetic_name;
	}


	public String getCosmetic_img() {
		return cosmetic_img;
	}


	public void setCosmetic_img(String cosmetic_img) {
		this.cosmetic_img = cosmetic_img;
	}


	public int getThumbs_down() {
		return thumbs_down;
	}


	public void setThumbs_down(int thumbs_down) {
		this.thumbs_down = thumbs_down;
	}


	public int getAge() {
		return age;
	}


	public void setAge(int age) {
		this.age = age;
	}


	public String getSkintype() {
		return skintype;
	}


	public void setSkintype(String skintype) {
		this.skintype = skintype;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public String getProfile_image() {
		return profile_image;
	}


	public void setProfile_image(String profile_image) {
		this.profile_image = profile_image;
	}


	@Override
	public String toString() {
		return "Review [review_no=" + review_no + ", thumbs_up=" + thumbs_up + ", heart=" + heart + ", del_yn=" + del_yn
				+ ", title=" + title + ", content=" + content + ", date=" + date + ", category=" + category
				+ ", userName=" + userName + ", user_no=" + user_no + ", cosmetic_no=" + cosmetic_no
				+ ", cosmetic_name=" + cosmetic_name + ", cosmetic_img=" + cosmetic_img + ", thumbs_down=" + thumbs_down
				+ ", age=" + age + ", skintype=" + skintype + ", gender=" + gender + ", profile_image=" + profile_image
				+ "]";
	}





	
	
}


