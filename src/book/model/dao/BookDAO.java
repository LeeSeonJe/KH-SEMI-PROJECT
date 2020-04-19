package book.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import book.model.vo.Book;
import customer.model.dao.CustomerDAO;
import member.model.vo.Member;

public class BookDAO {

private Properties prop = new Properties();
	
	public BookDAO() {
		String fileName = CustomerDAO.class.getResource("/sql/book/book-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int insertBook(Connection conn, Book b) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertBook");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, b.getBooking_name());
			pstmt.setString(2, b.getBooking_tel());
			pstmt.setDate(3, b.getBooking_date());
			pstmt.setString(4, b.getBooking_time());
			pstmt.setString(5, b.getBooking_content());
			pstmt.setInt(6, b.getCustomer_no());
			pstmt.setInt(7, b.getHospital_no());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Book> selectBookList(Connection conn, Member m) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Book> list = new ArrayList<>();
		Book b = null;
		
		String query = prop.getProperty("selectBookList");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, m.getUser_no());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				b = new Book(rs.getInt("booking_no"),
							 rs.getString("booking_name"),
							 rs.getString("booking_tel"),
							 rs.getDate("booking_date"),
							 rs.getString("booking_time"),
							 rs.getString("booking_content"),
							 rs.getInt("customer_no"),
							 rs.getInt("hospital_no"));
				
				list.add(b);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
	}

}
