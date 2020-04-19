package book.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import static common.JDBCTemplate.*;
import book.model.vo.Book;
import customer.model.dao.CustomerDAO;

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
			pstmt.setString(1, b.getBooking_tel());
			pstmt.setDate(2, b.getBooking_date());
			pstmt.setString(3, b.getBooking_time());
			pstmt.setString(4, b.getBooking_content());
			pstmt.setInt(5, b.getCustomer_no());
			pstmt.setInt(6, b.getHospital_no());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
