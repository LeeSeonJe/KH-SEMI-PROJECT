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

import customer.model.vo.Customer;
import customer.model.vo.MyPageCustomer;
import customer.model.vo.MyPageReview;

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
			
			if(rset.next()) {
				c = new Customer(rset.getInt("customer_no"),
								rset.getString("email"),
								rset.getString("age"),
								rset.getString("skintype"),
								rset.getString("gender"),
								rset.getString("profile_image"));
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
			
			if(rset.next()) {
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
			
			if(rset.next()) {
				mpc = new MyPageCustomer(
						rset.getString("USER_NO"),
						rset.getString("USER_NAME"),
						rset.getString("USER_ID"),
						rset.getString("USER_PWD"),
						rset.getString("EMAIL"),
						rset.getString("AGE"),
						rset.getString("SKINTYPE"),
						rset.getString("GENDER"),
						rset.getString("PROFILE_IMAGE")
						);
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

	public ArrayList<MyPageReview> selectCustomerReview(Connection conn, String user_id, int currentPage, int boardLimit) {
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
			
			while(rset.next()) {
				mpr.add(new MyPageReview(
							rset.getString("user_id"),
							rset.getString("user_name"),
							rset.getString("board_no"),
							rset.getString("board_title"),
							rset.getString("board_date")
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
}
