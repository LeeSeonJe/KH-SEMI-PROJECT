package cosmetic.model.vo;

public class Cosmetic {
	private int cosmetic_no;
	private String cosmetic_name;
	private String cosmetic_about;
	private String volume;
	private String price;
	private int count;
	private double avg;
	private String brand_name;
	private String middle_no;
	private String cosmetic_img;

	public Cosmetic() {
		// TODO Auto-generated constructor stub
	}

	public Cosmetic(int cosmetic_no, String cosmetic_name, String cosmetic_about, String volume, String price,
			int count, double avg, String brand_name, String middle_no, String cosmetic_img) {
		super();
		this.cosmetic_no = cosmetic_no;
		this.cosmetic_name = cosmetic_name;
		this.cosmetic_about = cosmetic_about;
		this.volume = volume;
		this.price = price;
		this.count = count;
		this.avg = avg;
		this.brand_name = brand_name;
		this.middle_no = middle_no;
		this.cosmetic_img = cosmetic_img;
	}

	public int getCosmetic_no() {
		return cosmetic_no;
	}

	public void setCosmetic_no(int cosmetic_no) {
		this.cosmetic_no = cosmetic_no;
	}

	public String getCosmetic_name() {
		return cosmetic_name;
	}

	public void setCosmetic_name(String cosmetic_name) {
		this.cosmetic_name = cosmetic_name;
	}

	public String getCosmetic_about() {
		return cosmetic_about;
	}

	public void setCosmetic_about(String cosmetic_about) {
		this.cosmetic_about = cosmetic_about;
	}

	public String getVolume() {
		return volume;
	}

	public void setVolume(String volume) {
		this.volume = volume;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public double getAvg() {
		return avg;
	}

	public void setAvg(double avg) {
		this.avg = avg;
	}

	public String getBrand_name() {
		return brand_name;
	}

	public void setBrand_name(String brand_name) {
		this.brand_name = brand_name;
	}

	public String getMiddle_no() {
		return middle_no;
	}

	public void setMiddle_no(String middle_no) {
		this.middle_no = middle_no;
	}

	public String getCosmetic_img() {
		return cosmetic_img;
	}

	public void setCosmetic_img(String cosmetic_img) {
		this.cosmetic_img = cosmetic_img;
	}

	@Override
	public String toString() {
		return "Cosmetic [cosmetic_no=" + cosmetic_no + ", cosmetic_name=" + cosmetic_name + ", cosmetic_about="
				+ cosmetic_about + ", volume=" + volume + ", price=" + price + ", count=" + count + ", avg=" + avg
				+ ", brand_name=" + brand_name + ", middle_no=" + middle_no + ", cosmetic_img=" + cosmetic_img + "]";
	}

}
