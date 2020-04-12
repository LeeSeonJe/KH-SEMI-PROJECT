package brand.model.vo;

public class Brand {
	private String brand_Name;
	private String brand_Img;
	
	public Brand() {
		// TODO Auto-generated constructor stub
	}

	public Brand(String brand_Name, String brand_Img) {
		super();
		this.brand_Name = brand_Name;
		this.brand_Img = brand_Img;
	}

	public String getBrand_Name() {
		return brand_Name;
	}

	public void setBrand_Name(String brand_Name) {
		this.brand_Name = brand_Name;
	}

	public String getBrand_Img() {
		return brand_Img;
	}

	public void setBrand_Img(String brand_Img) {
		this.brand_Img = brand_Img;
	}

	@Override
	public String toString() {
		return "Brand [brand_Name=" + brand_Name + ", brand_Img=" + brand_Img + "]";
	}
}
