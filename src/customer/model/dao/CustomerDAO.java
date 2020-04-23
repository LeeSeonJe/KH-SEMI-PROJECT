package customer.model.dao;

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

import org.apache.catalina.filters.RestCsrfPreventionFilter;

import customer.model.vo.Customer;
import customer.model.vo.MyPageCustomer;
import customer.model.vo.MyPageQnA;
import customer.model.vo.MyPageReview;
import customer.model.vo.MyPageWorry;

public class CustomerDAO {

	private Properties prop = new Properties();

	public CustomerDAO() {
		String fileName = CustomerDAO.class.getResource("/sql/customer/customer-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertMember(Connection conn, Customer c) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertCustomer");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, c.getEmail());
			pstmt.setString(2, c.getAge());
			pstmt.setString(3, c.getSkintype());
			pstmt.setString(4, c.getGender());
			pstmt.setString(5, c.getProfile_image());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public Customer customerDetail(Connection conn, int userNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Customer c = null;

		String query = prop.getProperty("customerDetail");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, userNo);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				c = new Customer(rset.getInt("customer_no"), rset.getString("email"), rset.getString("age"),
						rset.getString("skintype"), rset.getString("gender"), rset.getString("profile_image"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return c;
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
				profile = rset.getString("profile_image");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return profile;
	}

	public MyPageCustomer selectCustomer(Connection conn, String user_id) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		MyPageCustomer mpc = null;
		String query = prop.getProperty("selectCustomer");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, user_id);
			rset = pstmt.executeQuery();

			if (rset.next()) {
				mpc = new MyPageCustomer(rset.getString("USER_NO"), rset.getString("USER_NAME"),
						rset.getString("USER_ID"), rset.getString("USER_PWD"), rset.getString("EMAIL"),
						rset.getString("AGE"), rset.getString("SKINTYPE"), rset.getString("GENDER"),
						rset.getString("PROFILE_IMAGE"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return mpc;
	}

	public int updateCustomer(Connection conn, MyPageCustomer mpc) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("updateCustomer");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, mpc.getSkintype());
			pstmt.setString(2, mpc.getProfile_image());
			pstmt.setInt(3, Integer.parseInt(mpc.getUser_no()));

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int updateBasicCustomer(Connection conn, String userNo, String skinType) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updateBasicCustomer");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, skinType);
			pstmt.setInt(2, Integer.parseInt(userNo));

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int updateSkinTypeCustomer(Connection conn, String userNo, String skinType) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updateSkinTypeCustomer");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, skinType);
			pstmt.setInt(2, Integer.parseInt(userNo));

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public ArrayList<MyPageReview> selectCustomerReview(Connection conn, String user_id, int currentPage,
			int boardLimit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<MyPageReview> mpr = new ArrayList<MyPageReview>();
		String query = prop.getProperty("selectCustomerReview");

		int startRow = (currentPage - 1) * boardLimit + 1;
		int endRow = startRow + boardLimit - 1;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, user_id);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				mpr.add(new MyPageReview(rset.getString("user_id"), rset.getString("user_name"),
						rset.getString("board_no"), rset.getString("board_title"), rset.getString("board_date"),
						rset.getString("COSMETIC_NAME")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return mpr;
	}

	public int getReviewCount(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = prop.getProperty("getReviewCount");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			if (rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}

	public ArrayList<MyPageWorry> selectCustomerWorry(Connection conn, String user_id, int currentPage,
			int boardLimit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<MyPageWorry> mpr = new ArrayList<MyPageWorry>();
		int startRow = (currentPage - 1) * boardLimit + 1;
		int endRow = startRow + boardLimit - 1;
		String query = prop.getProperty("selectCustomerWorry");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, user_id);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();
			while (rset.next()) {
				mpr.add(new MyPageWorry(rset.getString("board_no"), rset.getString("board_title"),
						rset.getString("board_date"), rset.getString("user_name")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return mpr;
	}

	public int getWorryCount(Connection conn, String user_id) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;

		String query = prop.getProperty("getWorryCount");
		System.out.println(user_id);
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, user_id);
			rset = pstmt.executeQuery();
			if (rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}

	public MyPageReview ReviewDetail(Connection conn, String reviewNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		MyPageReview mpr = null;
		String query = prop.getProperty("ReviewDetail");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, reviewNo);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				mpr = new MyPageReview(rset.getString("board_no"), rset.getString("board_title"),
						rset.getString("board_date"), rset.getString("cosmetic_name"), rset.getString("board_content"),
						rset.getString("brand_name"), rset.getString("cosmetic_img"), rset.getString("review_heart"),
						rset.getString("cosmetic_no"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		close(rset);
		return mpr;
	}

	public int reviewUpdate1(Connection conn, MyPageReview mpr) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("reviewUpdate1");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, mpr.getReview_heart());
			pstmt.setString(2, mpr.getBoard_no());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int reviewUpdate2(Connection conn, MyPageReview mpr) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("reviewUpdate2");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, mpr.getBoard_title());
			pstmt.setString(2, mpr.getBoard_content());
			pstmt.setString(3, mpr.getBoard_no());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int reviewDelete(Connection conn, String board_no) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("reviewDelete");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, board_no);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int sendQnA1(Connection conn, MyPageQnA mpq) {
		PreparedStatement pstmt = null;
		int result = 0;

		String qeury = prop.getProperty("sendQnA1");

		try {
			pstmt = conn.prepareStatement(qeury);
			pstmt.setString(1, mpq.getBoard_title());
			pstmt.setString(2, mpq.getBoard_content());
			pstmt.setString(3, mpq.getUser_no());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int sendQnA2(Connection conn, MyPageQnA mpq) {
		Statement stmt = null;
		int result = 0;

		String qeury = prop.getProperty("sendQnA2");

		try {
			stmt = conn.createStatement();
			result = stmt.executeUpdate(qeury);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(stmt);
		}
		return result;
	}

	public int getQnACount(Connection conn, String user_id) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;

		String query = prop.getProperty("getQnACount");
		System.out.println(user_id);
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, user_id);
			rset = pstmt.executeQuery();
			if (rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}

	public ArrayList<MyPageQnA> selectCustomerQnA(Connection conn, String user_id, int currentPage, int boardLimit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<MyPageQnA> mpr = new ArrayList<MyPageQnA>();
		int startRow = (currentPage - 1) * boardLimit + 1;
		int endRow = startRow + boardLimit - 1;
		String query = prop.getProperty("selectCustomerQnA");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, user_id);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();
			while (rset.next()) {
				mpr.add(new MyPageQnA(
						rset.getString("user_id"),
						rset.getString("user_name"),
						rset.getString("board_no"), 
						rset.getString("board_title"),
						rset.getString("board_date"), 
						rset.getString("answer_yn"),
						rset.getString("comments"),
						rset.getString("COMMENT_DATE")
						));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return mpr;
	}

	public int emailCheck(Connection conn, String email) {
// select count(*) from customer where email = ?
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("emailCheck");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, email);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt(1);
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}
}
