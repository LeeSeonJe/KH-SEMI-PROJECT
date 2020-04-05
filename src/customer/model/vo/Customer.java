package customer.model.vo;

public class Customer {
	private int customer_no;
	private String email;
	private String age;
	private String skintype;
	private String gender;

	public Customer() {}
	public Customer(int customer_no, String email, String age, String skintype, String gender) {
		super();
		this.customer_no = customer_no;
		this.email = email;
		this.age = age;
		this.skintype = skintype;
		this.gender = gender;
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
	@Override
	public String toString() {
		return "Customer [customer_no=" + customer_no + ", email=" + email + ", age=" + age + ", skintype="
				+ skintype + ", gender=" + gender + "]";
	}
	
}
