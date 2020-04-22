package board.model.dao;

import static common.JDBCTemplate.*;
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

import board.model.vo.Board;
import member.model.dao.MemberDAO;

public class BoardDAO {
	private Properties prop = new Properties();
	
	public BoardDAO() {
		String fileName = MemberDAO.class.getResource("/sql/board/board-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Board> selectAll(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = new ArrayList<>();
		Board b = null;
		
		String query = prop.getProperty("selectAll");
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				b = new Board(rset.getInt("board_no"),
							  rset.getString("board_title"),
							  rset.getString("board_content"),
							  rset.getDate("board_date"),
							  rset.getString("board_category"),
							  rset.getInt("user_no"),
							  rset.getString("user_name"));
				
				list.add(b);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return list;
	}

	public ArrayList<Board> searchReview(Connection conn, String keyword) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = new ArrayList<>();
		Board b = null;
		
		String query = prop.getProperty("searchReview");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, keyword);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				b = new Board(rset.getInt("board_no"),
							  rset.getString("board_title"),
							  rset.getString("board_content"),
							  rset.getDate("board_date"),
							  rset.getString("board_category"),
							  rset.getInt("user_no"),
							  rset.getString("user_name"));
				
				list.add(b);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int deleteReview(Connection conn, String review_no) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteReview");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, review_no);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public ArrayList<Board> selectBoardAll(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = new ArrayList<>();
		Board b = null;
		
		String query = prop.getProperty("selectBoardAll");
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				b = new Board(rset.getInt("board_no"),
							  rset.getString("board_title"),
							  rset.getString("board_content"),
							  rset.getDate("board_date"),
							  rset.getString("board_category"),
							  rset.getInt("user_no"),
							  rset.getString("user_name"));
				
				list.add(b);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return list;
	}
	
	
}
