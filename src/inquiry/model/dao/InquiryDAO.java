package inquiry.model.dao;

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
import static common.JDBCTemplate.*;
import customer.model.dao.CustomerDAO;
import inquiry.model.vo.Inquiry;

public class InquiryDAO {
	
	private Properties prop = new Properties();

	public InquiryDAO() {
		String fileName = CustomerDAO.class.getResource("/sql/inquiry/inquiry-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Inquiry> selectAll(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Inquiry> list = new ArrayList<>();
		Inquiry i = null;
		
		String query = prop.getProperty("selectAll");
		
		try {
			stmt= conn.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				i = new Inquiry(rset.getInt("board_no"),
								rset.getString("board_title"),
								rset.getDate("board_date"),
								rset.getString("user_name"),
								rset.getString("answer_yn"));
				
				list.add(i);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return list;
	}

	public Inquiry detailQnA(Connection conn, String board_no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Inquiry i = null;
		
		String query = prop.getProperty("detailQnA");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, board_no);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				i = new Inquiry(rset.getString("board_title"),rset.getString("board_content"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return i;
	}

	public int insertAnswer(Connection conn, String board_no, String content) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertAnswer");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, content);
			pstmt.setString(2, board_no);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}