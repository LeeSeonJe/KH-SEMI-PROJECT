package customer.model.vo;

public class Customer {
	private int customer_no;
	private String email;
	private String age;
	private String skintype;
	private String gender;
	private String profile_image;
	public Customer() {
		super();
	}
	public Customer(int customer_no, String email, String age, String skintype, String gender, String profile_image) {
		super();
		this.customer_no = customer_no;
		this.email = email;
		this.age = age;
		this.skintype = skintype;
		this.gender = gender;
		this.profile_image = profile_image;
	}
	public int getCustomer_no() {
		return customer_no;
	}
	public void setCustomer_no(int customer_no) {
		this.customer_no = customer_no;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
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
		return "Customer [customer_no=" + customer_no + ", email=" + email + ", age=" + age + ", skintype=" + skintype
				+ ", gender=" + gender + ", profile_image=" + profile_image + "]";
	}
}
