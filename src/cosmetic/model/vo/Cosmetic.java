package cosmetic.model.vo;

public class Cosmetic {
	private int cosmetic_no;
	private String cosmetic_name;
	private String cosmetic_about;
	private String volume;
	private String price;
	private int week_rank;
	private int lastweek_rank;
	private String brand_name;
	private String middle_no;
	private String cosmetic_img;

	public Cosmetic() {
		// TODO Auto-generated constructor stub
	}

	public Cosmetic(int cosmetic_no, String cosmetic_name, String cosmetic_about, String volume, String price,
			int week_rank, int lastweek_rank, String brand_name, String middle_no, String cosmetic_img) {
		super();
		this.cosmetic_no = cosmetic_no;
		this.cosmetic_name = cosmetic_name;
		this.cosmetic_about = cosmetic_about;
		this.volume = volume;
		this.price = price;
		this.week_rank = week_rank;
		this.lastweek_rank = lastweek_rank;
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

	public int getWeek_rank() {
		return week_rank;
	}

	public void setWeek_rank(int week_rank) {
		this.week_rank = week_rank;
	}

	public int getLastweek_rank() {
		return lastweek_rank;
	}

	public void setLastweek_rank(int lastweek_rank) {
		this.lastweek_rank = lastweek_rank;
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
				+ cosmetic_about + ", volume=" + volume + ", price=" + price + ", week_rank=" + week_rank
				+ ", lastweek_rank=" + lastweek_rank + ", brand_name=" + brand_name + ", middle_no=" + middle_no
				+ ", cosmetic_img=" + cosmetic_img + "]";
	}

}
