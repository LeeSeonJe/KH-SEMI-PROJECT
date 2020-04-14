package hospital.model.vo;

public class Hospital {
	private int hospital_no;
	private String hospital_about;
	private String tel;
	private String address;
	private String regi;
	private String hospital_img;
	private String join_yn;
	private int hospital_heart;
	private String email;
	
	public Hospital() {}

	public Hospital(int hospital_no, String hospital_about, String tel, String address, String join_yn,
			int hospital_heart, String email) {
		super();
		this.hospital_no = hospital_no;
		this.hospital_about = hospital_about;
		this.tel = tel;
		this.address = address;
		this.join_yn = join_yn;
		this.hospital_heart = hospital_heart;
		this.email = email;
	}

	public Hospital(int hospital_no, String hospital_about, String tel, String address, String regi,
			String hospital_img, String join_yn, int hospital_heart, String email) {
		super();
		this.hospital_no = hospital_no;
		this.hospital_about = hospital_about;
		this.tel = tel;
		this.address = address;
		this.regi = regi;
		this.hospital_img = hospital_img;
		this.join_yn = join_yn;
		this.hospital_heart = hospital_heart;
		this.email = email;
	}

	public int getHospital_no() {
		return hospital_no;
	}

	public void setHospital_no(int hospital_no) {
		this.hospital_no = hospital_no;
	}

	public String getHospital_about() {
		return hospital_about;
	}

	public void setHospital_about(String hospital_about) {
		this.hospital_about = hospital_about;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getRegi() {
		return regi;
	}

	public void setRegi(String regi) {
		this.regi = regi;
	}

	public String getHospital_img() {
		return hospital_img;
	}

	public void setHospital_img(String hospital_img) {
		this.hospital_img = hospital_img;
	}

	public String getJoin_yn() {
		return join_yn;
	}

	public void setJoin_yn(String join_yn) {
		this.join_yn = join_yn;
	}

	public int getHospital_heart() {
		return hospital_heart;
	}

	public void setHospital_heart(int hospital_heart) {
		this.hospital_heart = hospital_heart;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "Hospital [hospital_no=" + hospital_no + ", hospital_about=" + hospital_about + ", tel=" + tel
				+ ", address=" + address + ", regi=" + regi + ", hospital_img=" + hospital_img + ", join_yn=" + join_yn
				+ ", hospital_heart=" + hospital_heart + ", email=" + email + "]";
	}
}
