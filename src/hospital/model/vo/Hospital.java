package hospital.model.vo;

public class Hospital {
	private int hospital_no;
	private String hospital_about;
	private String tel;
	private String address;
	private String regi;
	private String hospital_img;
	private String join_yn;
	private double hospital_heart;
	private double review_count;
	private String email;
	
	private String user_name;	// 병원 랭킹 불러올때용
	
	public Hospital() {}
	
	public Hospital(int hospital_no, String hospital_about, String hospital_img) {
		super();
		this.hospital_no = hospital_no;
		this.hospital_about = hospital_about;
		this.hospital_img = hospital_img;
	}

	// 병원 랭킹 불러올때용
	public Hospital(String user_name, String hospital_about, String address, String hospital_img, double hospital_heart, double review_count) {
		super();
		this.user_name = user_name;
		this.hospital_about = hospital_about;
		this.address = address;
		this.hospital_img = hospital_img;
		this.hospital_heart = hospital_heart;
		this.review_count = review_count;
	}
	
	public Hospital(int hospital_no, String user_name, String hospital_about, String tel, String address, String hospital_img, double hospital_heart, double review_count, String email) {
		super();
		this.hospital_no = hospital_no;
		this.user_name = user_name;
		this.hospital_about = hospital_about;
		this.tel = tel;
		this.address = address;
		this.hospital_img = hospital_img;
		this.hospital_heart = hospital_heart;
		this.review_count = review_count;
		this.email = email;
	}

	public Hospital(int hospital_no, String hospital_about, String tel, String address, String join_yn,
			double hospital_heart, String email) {
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
			String hospital_img, String join_yn, double hospital_heart, double review_count, String email) {
		super();
		this.hospital_no = hospital_no;
		this.hospital_about = hospital_about;
		this.tel = tel;
		this.address = address;
		this.regi = regi;
		this.hospital_img = hospital_img;
		this.join_yn = join_yn;
		this.hospital_heart = hospital_heart;
		this.review_count = review_count;
		this.email = email;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	
	public int getHospital_no() {
		return hospital_no;
	}

	public double getReview_count() {
		return review_count;
	}

	public void setReview_count(double review_count) {
		this.review_count = review_count;
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

	public double getHospital_heart() {
		return hospital_heart;
	}

	public void setHospital_heart(double hospital_heart) {
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
				+ ", hospital_heart=" + hospital_heart + ", review_count=" + review_count + ", email=" + email + "]";
	}
	
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((address == null) ? 0 : address.hashCode());
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + ((hospital_about == null) ? 0 : hospital_about.hashCode());
		long temp;
		temp = Double.doubleToLongBits(hospital_heart);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result + ((hospital_img == null) ? 0 : hospital_img.hashCode());
		result = prime * result + hospital_no;
		result = prime * result + ((join_yn == null) ? 0 : join_yn.hashCode());
		result = prime * result + ((regi == null) ? 0 : regi.hashCode());
		temp = Double.doubleToLongBits(review_count);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result + ((tel == null) ? 0 : tel.hashCode());
		result = prime * result + ((user_name == null) ? 0 : user_name.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Hospital other = (Hospital) obj;
		if (address == null) {
			if (other.address != null)
				return false;
		} else if (!address.equals(other.address))
			return false;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (hospital_about == null) {
			if (other.hospital_about != null)
				return false;
		} else if (!hospital_about.equals(other.hospital_about))
			return false;
		if (Double.doubleToLongBits(hospital_heart) != Double.doubleToLongBits(other.hospital_heart))
			return false;
		if (hospital_img == null) {
			if (other.hospital_img != null)
				return false;
		} else if (!hospital_img.equals(other.hospital_img))
			return false;
		if (hospital_no != other.hospital_no)
			return false;
		if (join_yn == null) {
			if (other.join_yn != null)
				return false;
		} else if (!join_yn.equals(other.join_yn))
			return false;
		if (regi == null) {
			if (other.regi != null)
				return false;
		} else if (!regi.equals(other.regi))
			return false;
		if (Double.doubleToLongBits(review_count) != Double.doubleToLongBits(other.review_count))
			return false;
		if (tel == null) {
			if (other.tel != null)
				return false;
		} else if (!tel.equals(other.tel))
			return false;
		if (user_name == null) {
			if (other.user_name != null)
				return false;
		} else if (!user_name.equals(other.user_name))
			return false;
		return true;
	}

	
	
}
