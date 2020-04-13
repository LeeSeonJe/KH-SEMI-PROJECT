package worry.model.vo;

import java.sql.Date;

public class Comments {
	private int commentsNo;
	private int worryNo;
	private int userNo;
	private String commentsText;
	private Date commentsDate;
	private String userName;
	
	
	
	public Comments() {}



	public Comments(int commentsNo, int worryNo, int userNo, String commentsText, Date commentsDate, String userName) {
		super();
		this.commentsNo = commentsNo;
		this.worryNo = worryNo;
		this.userNo = userNo;
		this.commentsText = commentsText;
		this.commentsDate = commentsDate;
		this.userName = userName;
	}



	public String getUserName() {
		return userName;
	}



	public void setUserName(String userName) {
		this.userName = userName;
	}



	public Comments(int worryNo, int userNo, String commentsText) {
		super();
		this.worryNo = worryNo;
		this.userNo = userNo;
		this.commentsText = commentsText;
	}

	public int getCommentsNo() {
		return commentsNo;
	}

	public void setCommentsNo(int commentsNo) {
		this.commentsNo = commentsNo;
	}

	public int getWorryNo() {
		return worryNo;
	}

	public void setWorryNo(int worryNo) {
		this.worryNo = worryNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getCommentsText() {
		return commentsText;
	}

	public void setCommentsText(String commentsText) {
		this.commentsText = commentsText;
	}

	public Date getCommentsDate() {
		return commentsDate;
	}

	public void setCommentsDate(Date commentsDate) {
		this.commentsDate = commentsDate;
	}



	@Override
	public String toString() {
		return "Comments [commentsNo=" + commentsNo + ", worryNo=" + worryNo + ", userNo=" + userNo + ", commentsText="
				+ commentsText + ", commentsDate=" + commentsDate + ", userName=" + userName + "]";
	}

	
	
	
	
	
	

}
