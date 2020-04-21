package review.model.vo;

import java.sql.Date;

public class AddFile {
	private int file_no;
	private String origin_name;
	private String change_name;
	private int board_no;
	private String file_path;
	private Date upload_date;
	private String status;
	
	public AddFile() {}
	
	public AddFile(int file_no, String origin_name, String change_name, int board_no, String file_path,
			Date upload_date, String status) {
		super();
		this.file_no = file_no;
		this.origin_name = origin_name;
		this.change_name = change_name;
		this.board_no = board_no;
		this.file_path = file_path;
		this.upload_date = upload_date;
		this.status = status;
	}

	public int getFile_no() {
		return file_no;
	}

	public void setFile_no(int file_no) {
		this.file_no = file_no;
	}

	public String getOrigin_name() {
		return origin_name;
	}

	public void setOrigin_name(String origin_name) {
		this.origin_name = origin_name;
	}

	public String getChange_name() {
		return change_name;
	}

	public void setChange_name(String change_name) {
		this.change_name = change_name;
	}

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public String getFile_path() {
		return file_path;
	}

	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}

	public Date getUpload_date() {
		return upload_date;
	}

	public void setUpload_date(Date upload_date) {
		this.upload_date = upload_date;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "addFile [file_no=" + file_no + ", origin_name=" + origin_name + ", change_name=" + change_name
				+ ", board_no=" + board_no + ", file_path=" + file_path + ", upload_date=" + upload_date + ", status="
				+ status + "]";
	}
	
	

}
