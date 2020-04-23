package hospital.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import common.AgeCalculator;
import customer.model.dao.CustomerDAO;
import hospital.model.vo.Hospital;
import hospital.model.vo.HospitalReviewList;
import member.model.vo.Member;

public class HospitalDAO {

	private Properties prop = new Properties();

	public HospitalDAO() {
		String fileName = CustomerDAO.class.getResource("/sql/hospital/hospital-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertMember(Connection conn, Hospital h) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertHospital");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, h.getHospital_about());
			pstmt.setString(2, h.getTel());
			pstmt.setString(3, h.getAddress());
			pstmt.setString(4, h.getRegi());
			pstmt.setString(5, h.getHospital_img());
			pstmt.setString(6, h.getEmail());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public ArrayList<Hospital> selectHospitalList(Connection conn, String hospitalFilter) {
		PreparedStatement pstmt = null;
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Hospital> list = new ArrayList<Hospital>();

		try {
			if (hospitalFilter == null || hospitalFilter.equals("랭킹순")) {
				String query = prop.getProperty("selectHospitalList");
				stmt = conn.createStatement();
				rset = stmt.executeQuery(query);
				while (rset.next()) {
					list.add(new Hospital(rset.getString("user_name"), rset.getString("hospital_about"),
							rset.getString("address"), rset.getString("hospital_img"), rset.getDouble("hospital_heart"),
							rset.getDouble("review_count")));
				}
			} else if (hospitalFilter.equals("리뷰 많은 순")) {
				String query = prop.getProperty("selectReviewH");
				stmt = conn.createStatement();
				rset = stmt.executeQuery(query);
				while (rset.next()) {
					list.add(new Hospital(rset.getString("user_name"), rset.getString("hospital_about"),
							rset.getString("address"), rset.getString("hospital_img"), rset.getDouble("hospital_heart"),
							rset.getDouble("review_count")));
				}
			} else if (hospitalFilter.equals("리뷰 적은 순")) {
				String query = prop.getProperty("selectReviewL");
				stmt = conn.createStatement();
				rset = stmt.executeQuery(query);
				while (rset.next()) {
					list.add(new Hospital(rset.getString("user_name"), rset.getString("hospital_about"),
							rset.getString("address"), rset.getString("hospital_img"), rset.getDouble("hospital_heart"),
							rset.getDouble("review_count")));
				}
			} else if (hospitalFilter.equals("평점 높은 순")) {
				String query = prop.getProperty("selectHeartH");
				stmt = conn.createStatement();
				rset = stmt.executeQuery(query);
				while (rset.next()) {
					list.add(new Hospital(rset.getString("user_name"), rset.getString("hospital_about"),
							rset.getString("address"), rset.getString("hospital_img"), rset.getDouble("hospital_heart"),
							rset.getDouble("review_count")));
				}
			} else if (hospitalFilter.equals("평점 낮은 순")) {
				String query = prop.getProperty("selectHeartL");
				stmt = conn.createStatement();
				rset = stmt.executeQuery(query);
				while (rset.next()) {
					list.add(new Hospital(rset.getString("user_name"), rset.getString("hospital_about"),
							rset.getString("address"), rset.getString("hospital_img"), rset.getDouble("hospital_heart"),
							rset.getDouble("review_count")));
				}
			} else if (hospitalFilter.equals("답변 많은 순")) {
				String query = prop.getProperty("selectReplyH");
				stmt = conn.createStatement();
				rset = stmt.executeQuery(query);
				while (rset.next()) {
					list.add(new Hospital(rset.getString("user_name"), rset.getString("hospital_about"),
							rset.getString("address"), rset.getString("hospital_img"), rset.getDouble("hospital_heart"),
							rset.getDouble("review_count")));
				}
			} else if (hospitalFilter.equals("답변 적은 순")) {
				String query = prop.getProperty("selectReplyL");
				stmt = conn.createStatement();
				rset = stmt.executeQuery(query);
				while (rset.next()) {
					list.add(new Hospital(rset.getString("user_name"), rset.getString("hospital_about"),
							rset.getString("address"), rset.getString("hospital_img"), rset.getDouble("hospital_heart"),
							rset.getDouble("review_count")));
				}

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
			close(pstmt);
		}
		return list;
	}

	public ArrayList<Hospital> searchAddress(Connection conn, String sidoCd, String sggu, String dong) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Hospital> list = new ArrayList<Hospital>();

		String plusQuery = "";

		if (!sidoCd.equals("first")) {
			plusQuery += " address LIKE '%" + sidoCd + "%'";
		}

		if (!sggu.equals("first")) {
			if (plusQuery.contains("address")) {
				plusQuery += " and address LIKE '%" + sggu + "%'";
			} else {
				plusQuery += " address LIKE '%" + sggu + "%'";
			}
		}

		if (dong != null) {
			if (plusQuery.contains("address")) {
				plusQuery += " and address LIKE '%" + dong + "%'";
			} else {
				plusQuery += " address LIKE '%" + dong + "%'";
			}
		}

		String query = prop.getProperty("searchAddress");

		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query + plusQuery);

			while (rset.next()) {
				list.add(new Hospital(rset.getString("user_name"), rset.getString("hospital_about"),
						rset.getString("address"), rset.getString("hospital_img"), rset.getDouble("hospital_heart"),
						rset.getDouble("review_count")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}

		return list;
	}

	public Hospital detailHospital(Connection conn, String hosName) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Hospital h = null;

		String query = prop.getProperty("detailHospital");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, hosName);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				h = new Hospital(rset.getInt("hospital_no"), rset.getString("user_name"),
						rset.getString("hospital_about"), rset.getString("tel"), rset.getString("address"),
						rset.getString("hospital_img"), rset.getDouble("hospital_heart"),
						rset.getDouble("review_count"), rset.getString("email"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return h;
	}

	public String selectProfile(Connection conn, int user_no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String profile = null;

		String query = prop.getProperty("selectProfile");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, user_no);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				profile = rset.getString("hospital_img");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return profile;
	}

	public int selectHosNo(Connection conn, String hos_name) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int user_no = 0;

		String query = prop.getProperty("selectHosNo");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, hos_name);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				user_no = rset.getInt("user_no");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return user_no;
	}

	public Hospital selectHospital(Connection conn, Member m) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		Hospital h = null;

		String query = prop.getProperty("selectHospital");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, m.getUser_no());

			rset = pstmt.executeQuery();

			if (rset.next()) {
				h = new Hospital(rset.getInt("hospital_no"), rset.getString("hospital_about"), rset.getString("tel"),
						rset.getString("address"), rset.getString("regi"), rset.getString("hospital_img"),
						rset.getString("join_yn"), rset.getDouble("hospital_heart"), rset.getDouble("review_count"),
						rset.getString("email"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return h;
	}

	public Hospital hospitalDetail(Connection conn, int userNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Hospital h = null;

		String query = prop.getProperty("hospitalDetail");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, userNo);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				h = new Hospital(rset.getInt("hospital_no"), rset.getString("hospital_about"), rset.getString("tel"),
						rset.getString("address"), rset.getString("regi"), rset.getString("hospital_img"),
						rset.getString("join_yn"), rset.getDouble("hospital_heart"), rset.getDouble("review_count"),
						rset.getString("email"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return h;
	}

	public ArrayList<HospitalReviewList> HospitalReviewList(Connection conn, int hospitalNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HospitalReviewList> hrlList = new ArrayList<HospitalReviewList>();
		String query = prop.getProperty("HospitalReviewList");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, hospitalNo);
			rset = pstmt.executeQuery();
			AgeCalculator ac = new AgeCalculator();
			while (rset.next()) {
				String age = rset.getString("age");
				age = ac.ageCal(age);
				hrlList.add(new HospitalReviewList(
						rset.getString("profile_image"), 
						rset.getString("user_name"), age,
						rset.getString("skinType"), 
						rset.getString("gender"), 
						rset.getString("board_title"),
						rset.getString("board_content"), 
						rset.getDate("board_date"), 
						rset.getString("review_heart"),
						rset.getString("hospital_heart"),
						rset.getString("review_count")
				));
			}
			
//			System.out.println("HospitalDAO.java : " + hrlList.size());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return hrlList;
	}

	public int insertHospitalReview1(Connection conn, String title, String content, int user_no) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertHospitalReview1");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setInt(3, user_no);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int insertHospitalReview2(Connection conn, String heart) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertHospitalReview2");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, heart);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int insertHospitalReview3(Connection conn, int hospitalNo) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertHospitalReview3");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, hospitalNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int updateHospitalReview(Connection conn, int hospitalNo) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("updateHospitalReview");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, hospitalNo);
			pstmt.setInt(2, hospitalNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
	}

	public ArrayList<HospitalReviewList> hospitalList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<HospitalReviewList> hList = new ArrayList<HospitalReviewList>();
		String query = prop.getProperty("hospitalList");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			while (rset.next()) {
				hList.add(new HospitalReviewList(
						rset.getString("user_name"),
						rset.getString("board_no"),
						rset.getString("board_title")
						));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return hList;
	}

}
