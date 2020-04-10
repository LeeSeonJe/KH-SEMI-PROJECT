package review.model.vo;

public class CosmeticReview {
	
	private int cos_review_no;
	private int cosmetic_no;

	public CosmeticReview() {}

	public CosmeticReview(int cos_review_no, int cosmetic_no) {
		super();
		this.cos_review_no = cos_review_no;
		this.cosmetic_no = cosmetic_no;
	}

	public int getCos_review_no() {
		return cos_review_no;
	}

	public void setCos_review_no(int cos_review_no) {
		this.cos_review_no = cos_review_no;
	}

	public int getCosmetic_no() {
		return cosmetic_no;
	}

	public void setCosmetic_no(int cosmetic_no) {
		this.cosmetic_no = cosmetic_no;
	}

	@Override
	public String toString() {
		return "CosmeticReview [cos_review_no=" + cos_review_no + ", cosmetic_no=" + cosmetic_no + "]";
	}
	
}

