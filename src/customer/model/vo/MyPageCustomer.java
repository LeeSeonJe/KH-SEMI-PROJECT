package customer.model.vo;

public class MyPageCustomer {
	private String user_no;
	private String user_name;
	private String user_id;
	private String user_pwd;
	private String email;
	private String age;
	private String skintype;
	private String gender;
	private String profile_image;

	public MyPageCustomer(String user_no, String skintype, String profile_image) {
		super();
		this.user_no = user_no;
		this.skintype = skintype;
		this.profile_image = profile_image;
	}

	public MyPageCustomer(String user_no, String user_name, String user_id, String user_pwd, String email, String age,
			String skintype, String gender, String profile_image) {
		super();
		this.user_no = user_no;
		this.user_name = user_name;
		this.user_id = user_id;
		this.user_pwd = user_pwd;
		this.email = email;
		this.age = age;
		this.skintype = skintype;
		this.gender = gender;
		this.profile_image = profile_image;
	}

	public String getUser_pwd() {
		return user_pwd;
	}

	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}

	public String getUser_no() {
		return user_no;
	}

	public void setUser_no(String user_no) {
		this.user_no = user_no;
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
		return "MyPageCustomer [user_no=" + user_no + ", user_name=" + user_name + ", user_id=" + user_id
				+ ", user_pwd=" + user_pwd + ", email=" + email + ", age=" + age + ", skintype=" + skintype
				+ ", gender=" + gender + ", profile_image=" + profile_image + "]";
	}

}
