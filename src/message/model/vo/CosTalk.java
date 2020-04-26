package message.model.vo;

import java.sql.Date;

public class CosTalk {
	private int message_no;
	private String message;
	private Date message_date;
	private String message_read;
	private int dispatch_no;
	private int reception_no;
	
	private int rMember_no;
	private String rMember_id;
	private String rMember_name;
	
	private String user_name;
	private String user_id;

	public CosTalk(String message) {
		super();
		this.message = message;
	}

	public CosTalk(int reception_no, String user_id, String user_name) {
		super();
		this.reception_no = reception_no;
		this.user_id = user_id;
		this.user_name = user_name;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public CosTalk(int message_no, String message, Date message_date, String message_read,
			int dispatch_no, int reception_no) {
		super();
		this.message_no = message_no;
		this.message = message;
		this.message_date = message_date;
		this.message_read = message_read;
		this.dispatch_no = dispatch_no;
		this.reception_no = reception_no;
	}

	public CosTalk(int reception_no, String user_id, String user_name, String message) {
		super();
		this.reception_no = reception_no;
		this.user_id = user_id;
		this.user_name = user_name;
		this.message = message;
	}

	public int getMessage_no() {
		return message_no;
	}

	public void setMessage_no(int message_no) {
		this.message_no = message_no;
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

	public int getrMember_no() {
		return rMember_no;
	}

	public void setrMember_no(int rMember_no) {
		this.rMember_no = rMember_no;
	}

	public String getrMember_id() {
		return rMember_id;
	}

	public void setrMember_id(String rMember_id) {
		this.rMember_id = rMember_id;
	}

	public String getrMember_name() {
		return rMember_name;
	}

	public void setrMember_name(String rMember_name) {
		this.rMember_name = rMember_name;
	}

	@Override
	public String toString() {
		return "CosTalk [message_no=" + message_no + ", message=" + message + ", message_date=" + message_date
				+ ", message_read=" + message_read + ", dispatch_no=" + dispatch_no + ", reception_no=" + reception_no
				+ ", rMember_no=" + rMember_no + ", rMember_id=" + rMember_id + ", rMember_name=" + rMember_name + "]";
	}


}
