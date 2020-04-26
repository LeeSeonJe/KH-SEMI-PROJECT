package customer.model.vo;

public class MyPageBook {
	private String user_name;
	private String tel;
	private String booking_no;
	private String booking_name;
	private String booking_content;
	private String booking_date;
	private String booking_time;
	private String booking_del_ync;

	public MyPageBook() {
		// TODO Auto-generated constructor stub
	}

	public MyPageBook(String user_name, String tel, String booking_no, String booking_name, String booking_content,
			String booking_date, String booking_time, String booking_del_ync) {
		super();
		this.user_name = user_name;
		this.tel = tel;
		this.booking_no = booking_no;
		this.booking_name = booking_name;
		this.booking_content = booking_content;
		this.booking_date = booking_date;
		this.booking_time = booking_time;
		this.booking_del_ync = booking_del_ync;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getBooking_name() {
		return booking_name;
	}

	public void setBooking_name(String booking_name) {
		this.booking_name = booking_name;
	}

	public String getBooking_content() {
		return booking_content;
	}

	public void setBooking_content(String booking_content) {
		this.booking_content = booking_content;
	}

	public String getBooking_date() {
		return booking_date;
	}

	public void setBooking_date(String booking_date) {
		this.booking_date = booking_date;
	}

	public String getBooking_time() {
		return booking_time;
	}

	public void setBooking_time(String booking_time) {
		this.booking_time = booking_time;
	}

	public String getBooking_del_ync() {
		return booking_del_ync;
	}

	public void setBooking_del_ync(String booking_del_ync) {
		this.booking_del_ync = booking_del_ync;
	}

	public String getBooking_no() {
		return booking_no;
	}

	public void setBooking_no(String booking_no) {
		this.booking_no = booking_no;
	}

	@Override
	public String toString() {
		return "MyPageBook [user_name=" + user_name + ", tel=" + tel + ", booking_name=" + booking_name
				+ ", booking_content=" + booking_content + ", booking_date=" + booking_date + ", booking_time="
				+ booking_time + ", booking_del_ync=" + booking_del_ync + "]";
	}

}
