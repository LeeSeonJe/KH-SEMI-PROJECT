package cosmetic_req.model.vo;

public class Cosmetic_req {
	private int board_no;
	private String cosmetic_reqyn;
	
	public Cosmetic_req() {
	}

	public Cosmetic_req(int board_no, String cosmetic_reqyn) {
		super();
		this.board_no = board_no;
		this.cosmetic_reqyn = cosmetic_reqyn;
	}

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public String getCosmetic_reqyn() {
		return cosmetic_reqyn;
	}

	public void setCosmetic_reqyn(String cosmetic_reqyn) {
		this.cosmetic_reqyn = cosmetic_reqyn;
	}

	@Override
	public String toString() {
		return "Cosmetic_req [board_no=" + board_no + ", cosmetic_reqyn=" + cosmetic_reqyn + "]";
	}
}
