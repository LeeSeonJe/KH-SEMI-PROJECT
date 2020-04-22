package book.model.vo;

import java.sql.Date;

public class Book {
	private int booking_no;
	private String booking_name;
	private String booking_tel;
	private Date booking_date;
	private String booking_time;
	private String booking_content;
	private int customer_no;
	private int hospital_no;
	
	public Book() {}

	public Book(int booking_no, String booking_name, String booking_tel, Date booking_date, String booking_time,
			String booking_content, int customer_no, int hospital_no) {
		super();
		this.booking_no = booking_no;
		this.booking_name = booking_name;
		this.booking_tel = booking_tel;
		this.booking_date = booking_date;
		this.booking_time = booking_time;
		this.booking_content = booking_content;
		this.customer_no = customer_no;
		this.hospital_no = hospital_no;
	}

	public int getBooking_no() {
		return booking_no;
	}

	public void setBooking_no(int booking_no) {
		this.booking_no = booking_no;
	}

	public String getBooking_name() {
		return booking_name;
	}

	public void setBooking_name(String booking_name) {
		this.booking_name = booking_name;
	}

	public String getBooking_tel() {
		return booking_tel;
	}

	public void setBooking_tel(String booking_tel) {
		this.booking_tel = booking_tel;
	}

	public Date getBooking_date() {
		return booking_date;
	}

	public void setBooking_date(Date booking_date) {
		this.booking_date = booking_date;
	}

	public String getBooking_time() {
		return booking_time;
	}

	public void setBooking_time(String booking_time) {
		this.booking_time = booking_time;
	}

	public String getBooking_content() {
		return booking_content;
	}

	public void setBooking_content(String booking_content) {
		this.booking_content = booking_content;
	}

	public int getCustomer_no() {
		return customer_no;
	}

	public void setCustomer_no(int customer_no) {
		this.customer_no = customer_no;
	}

	public int getHospital_no() {
		return hospital_no;
	}

	public void setHospital_no(int hospital_no) {
		this.hospital_no = hospital_no;
	}

	@Override
	public String toString() {
		return "Book [booking_no=" + booking_no + ", booking_name=" + booking_name + ", booking_tel=" + booking_tel
				+ ", booking_date=" + booking_date + ", booking_time=" + booking_time + ", booking_content="
				+ booking_content + ", customer_no=" + customer_no + ", hospital_no=" + hospital_no + "]";
	}
	
}
