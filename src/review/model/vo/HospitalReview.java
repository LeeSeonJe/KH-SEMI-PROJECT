package review.model.vo;

public class HospitalReview {
	
	private int hos_review_no;
	private int hospital_no;
	
	public HospitalReview() {}

	public HospitalReview(int hos_review_no, int hospital_no) {
		super();
		this.hos_review_no = hos_review_no;
		this.hospital_no = hospital_no;
	}

	public int getHos_review_no() {
		return hos_review_no;
	}

	public void setHos_review_no(int hos_review_no) {
		this.hos_review_no = hos_review_no;
	}

	public int getHospital_no() {
		return hospital_no;
	}

	public void setHospital_no(int hospital_no) {
		this.hospital_no = hospital_no;
	}

	@Override
	public String toString() {
		return "HospitalReview [hos_review_no=" + hos_review_no + ", hospital_no=" + hospital_no + "]";
	}

}

