package message.model.vo;

import java.sql.Date;

public class CosTalk {
	private int message_no;
	private String message_title;
	private String message;
	private Date message_date;
	private String message_read;
	private int dispatch_no;

	public CosTalk() {
		super();
	}

	public CosTalk(int message_no, String message_title, String message, Date message_date, String message_read,
			int dispatch_no, int reception_no) {
		super();
		this.message_no = message_no;
		this.message_title = message_title;
		this.message = message;
		this.message_date = message_date;
		this.message_read = message_read;
		this.dispatch_no = dispatch_no;
		this.reception_no = reception_no;
	}

	public int getMessage_no() {
		return message_no;
	}

	public void setMessage_no(int message_no) {
		this.message_no = message_no;
	}

	public String getMessage_title() {
		return message_title;
	}

	public void setMessage_title(String message_title) {
		this.message_title = message_title;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Date getMessage_date() {
		return message_date;
	}

	public void setMessage_date(Date message_date) {
		this.message_date = message_date;
	}

	public String getMessage_read() {
		return message_read;
	}

	public void setMessage_read(String message_read) {
		this.message_read = message_read;
	}

	public int getDispatch_no() {
		return dispatch_no;
	}

	public void setDispatch_no(int dispatch_no) {
		this.dispatch_no = dispatch_no;
	}

	public int getReception_no() {
		return reception_no;
	}

	public void setReception_no(int reception_no) {
		this.reception_no = reception_no;
	}

	private int reception_no;

	@Override
	public String toString() {
		return "CosTalk [message_no=" + message_no + ", message_title=" + message_title + ", message=" + message
				+ ", message_date=" + message_date + ", message_read=" + message_read + ", dispatch_no=" + dispatch_no
				+ ", reception_no=" + reception_no + "]";
	}

}
