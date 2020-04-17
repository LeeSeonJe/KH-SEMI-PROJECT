package customer.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import customer.model.vo.Customer;

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

}
