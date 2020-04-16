package review.model.dao;

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
import review.model.vo.Review;

public class ReviewDAO {
	private Properties prop = new Properties();
	
	public ReviewDAO() {
		String fileName = ReviewDAO.class.getResource("/sql/review/review-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public ArrayList<Review> selectList(Connection conn, int currentPage, int boardLimit) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Review> list = null;
		
		String query = prop.getProperty("selectList");
		
		int startRow = (currentPage -1) * boardLimit +1;
		int endRow = startRow + boardLimit -1;
		
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			list = new ArrayList<Review>();
			
			while(rset.next()) {
				Review r = new Review(rset.getInt("REVIEW_NO"),
									  rset.getInt("REVIEW_THUMBS_UP"),
									  rset.getInt("REVIEW_HEART"),
									  rset.getString("REVIEW_DEL_YN"),
									  rset.getString("board_title"),
									  rset.getString("board_content"),
									  rset.getDate("board_date"),
									  rset.getString("board_category"),
									  rset.getString("user_name"),
									  rset.getString("cosmetic_name"),
									  rset.getString("cosmetic_img"),
									  rset.getInt("review_thumbs_down"),
									  rset.getInt("age"),
									  rset.getString("skintype"),
									  rset.getString("gender"),
									  rset.getString("profile_image"));
				list.add(r);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int getListCount(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("getListCount");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return result;
	}
	public int insertBoard(Connection conn, Review r) {
		// insert into board values(seq_board_no.nextval, ?, ?, sysdate, 리뷰게시판, ?)
		
		PreparedStatement pstmt = null;
		int result1 = 0;
		
		String query = prop.getProperty("insertBoard");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, r.getTitle());
			pstmt.setString(2, r.getContent());
			pstmt.setInt(3, r.getUser_no());
			
			result1 = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
				
		return result1;
	}
	public int insertReview(Connection conn, Review r) {
//		 insert into review values(seq_board_no.currval, default, default, ?, default)

		PreparedStatement pstmt = null;
		int result2 = 0;
		
		String query = prop.getProperty("insertReview");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, r.getHeart());
			
			result2 = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result2;
	}
	public int insertCos_review(Connection conn, Review r) {
//		insert into cosmetic_review values(seq_board_no.currval, ?)

		PreparedStatement pstmt = null;
		int result3 = 0;
		
		String query = prop.getProperty("insertCosReview");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, r.getCosmetic_no());
			
			result3 = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result3;
	}
	public ArrayList selectSList(Connection conn) {
//		select board_title, cosmetic_name, cosmetic_img 
//		from review 
//			 join board on(review_no = board_no) 
//			 join cosmetic_review on(review_no = cos_review_no) 
//			 join cosmetic using(cosmetic_no) 
//		order by review_thumbs_up desc

		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Review> slideList = null;
		
		String query = prop.getProperty("selectSList");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			slideList = new ArrayList<Review>();
			
			while(rset.next()) {
				Review r = new Review(rset.getString("board_title"),
										rset.getString("cosmetic_name"),
										rset.getString("cosmetic_img"));
				slideList.add(r);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return slideList;
		
	}





}