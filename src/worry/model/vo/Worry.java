package worry.model.vo;

import java.sql.Date;

public class Worry {
	private int worryNo;
	private int worryThumbUp;
	private int hit;
	private String title;
	private String content;
	private Date date;
	private String category;
	private String userName;
	private int userNo;
	private int worryThumbDown;
	
	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public Worry(int worryNo, int worryThumbUp, int hit, String title, String content, Date date, String category,
			String userName, int userNo) {
		super();
		this.worryNo = worryNo;
		this.worryThumbUp = worryThumbUp;
		this.hit = hit;
		this.title = title;
		this.content = content;
		this.date = date;
		this.category = category;
		this.userName = userName;
		this.userNo = userNo;
	}

	public Worry(int worryNo, int worryThumbUp, int hit, String title, String content, Date date, String category,
			String userName, int userNo, int worryThumbDown) {
		super();
		this.worryNo = worryNo;
		this.worryThumbUp = worryThumbUp;
		this.hit = hit;
		this.title = title;
		this.content = content;
		this.date = date;
		this.category = category;
		this.userName = userName;
		this.userNo = userNo;
		this.worryThumbDown = worryThumbDown;
	}

	public int getWorryThumbDown() {
		return worryThumbDown;
	}

	public void setWorryThumbDown(int worryThumbDown) {
		this.worryThumbDown = worryThumbDown;
	}

	public Worry() {}

	public Worry(int worryNo, int worryThumbUp, int hit) {
		super();
		this.worryNo = worryNo;
		this.worryThumbUp = worryThumbUp;
		this.hit = hit;
	}
	
	
	
	
	public Worry(int worryNo, String title, String content, int userNo) {
		super();
		this.worryNo = worryNo;
		this.title = title;
		this.content = content;
		this.userNo = userNo;
	}

	public Worry(String title, String content, String userName) {
		super();
		this.title = title;
		this.content = content;
		this.userName = userName;
	}

	public Worry(int worryNo, int worryThumbUp, int hit, String title, String content, Date date, String category,
			String userName) {
		super();
		this.worryNo = worryNo;
		this.worryThumbUp = worryThumbUp;
		this.hit = hit;
		this.title = title;
		this.content = content;
		this.date = date;
		this.category = category;
		this.userName = userName;
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

	


	@Override
	public String toString() {
		return "Worry [worryNo=" + worryNo + ", worryThumbUp=" + worryThumbUp + ", hit=" + hit + ", title=" + title
				+ ", content=" + content + ", date=" + date + ", category=" + category + ", userName=" + userName
				+ ", userNo=" + userNo + ", worryThumbDown=" + worryThumbDown + "]";
	}

	public int getWorryNo() {
		return worryNo;
	}

	public void setWorryNo(int worryNo) {
		this.worryNo = worryNo;
	}

	public int getWorryThumbUp() {
		return worryThumbUp;
	}

	public void setWorryThumbUp(int worryThumbUp) {
		this.worryThumbUp = worryThumbUp;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}
	
	
	
	
	
}
