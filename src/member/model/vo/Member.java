package member.model.vo;

public class Member {
	private int user_no;
	private String user_name;
	private String user_id;
	private String user_pwd;
	private String user_category;
	private String status;
	
	public Member() {}

	public Member(String user_id, String user_pwd) {
		super();
		this.user_id = user_id;
		this.user_pwd = user_pwd;
	}

	public Member(String user_name, String user_id, String user_pwd, String user_category) {
		super();
		this.user_name = user_name;
		this.user_id = user_id;
		this.user_pwd = user_pwd;
		this.user_category = user_category;
	}

	public Member(int user_no, String user_name, String user_id, String user_pwd, String user_category, String status) {
		super();
		this.user_no = user_no;
		this.user_name = user_name;
		this.user_id = user_id;
		this.user_pwd = user_pwd;
		this.user_category = user_category;
		this.status = status;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
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

	public String getUser_pwd() {
		return user_pwd;
	}

	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}

	public String getUser_category() {
		return user_category;
	}

	public void setUser_category(String user_category) {
		this.user_category = user_category;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Member [user_no=" + user_no + ", user_name=" + user_name + ", user_id=" + user_id + ", user_pwd="
				+ user_pwd + ", user_category=" + user_category + ", status=" + status + "]";
	}
	
}
