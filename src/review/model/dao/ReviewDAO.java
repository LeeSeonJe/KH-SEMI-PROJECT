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
import review.model.vo.AddFile;
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
	public ArrayList<Review> selectList(Connection conn, int currentPage, int boardLimit) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Review> list = null;
		
		String query = prop.getProperty("selectList");
		
		int startRow = (currentPage -1) * boardLimit +1;
		int endRow = startRow + boardLimit -1;
		System.out.println("ReviewDAO startRow, endRow : " + startRow + ", " + endRow);
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
	public ArrayList<Review> selectSList(Connection conn) {

		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Review> slideList = null;
		
		String query = prop.getProperty("selectSList");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			slideList = new ArrayList<Review>();
			
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

	public int insertBoardReq(Connection conn, Review r) {
//		insert into board values(seq_board_no.nextval, '제품등록요청', ?, sysdate, 'req', ?);
		PreparedStatement pstmt = null;
		int result1 = 0;
		
		String query = prop.getProperty("insertBoardReq");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, r.getContent());
			pstmt.setInt(2, r.getUser_no());
			
			result1 = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result1;
	}

	public int insertAddFile(Connection conn, AddFile af) {
//		insert into addfile values(seq_file_no.nextval, ?, ?, seq_board_no.currval, ?, sysdate, default)
		PreparedStatement pstmt = null;
		int result2 = 0;
		String query = prop.getProperty("insertaAddfile");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, af.getOrigin_name());
			pstmt.setString(2, af.getChange_name());
			pstmt.setString(3, af.getFile_path());

			result2 = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		
		
		return result2;
	}
	
	public ArrayList<Review> selectReq(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Review> list = new ArrayList<>();
		Review r = null;
		
		String query = prop.getProperty("selectReq");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			//리뷰넘버 유저네임 데이트
			while(rset.next()) {
				r = new Review(rset.getInt("board_no"),
								rset.getString("user_name"),
								rset.getDate("board_date"));
				list.add(r);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

	public int insertCosReq(Connection conn, Review r) {
//		insert into cosmetic_req values(seq_board_no.currval, default)
		Statement stmt = null;
		int result3 = 0;
		
		String query = prop.getProperty("insertCosReq");
		
		try {
			stmt = conn.createStatement();
			result3 = stmt.executeUpdate(query);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
		}
		return result3;
	}
	
	public ArrayList<Review> oldList(Connection conn, int currentPage, int boardLimit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Review> list = null;
		
		String query = prop.getProperty("oldList");
		
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
						rset.getInt("review_thumbs_up"),
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
	
	public ArrayList<Review> lovedList(Connection conn, int currentPage, int boardLimit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Review> list = null;
		
		String query = prop.getProperty("lovedList");
		
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
						  rset.getInt("review_thumbs_up"),
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
	public ArrayList<Review> unlovedList(Connection conn, int currentPage, int boardLimit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Review> list = null;
		
		String query = prop.getProperty("unlovedList");
		
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
						rset.getInt("review_thumbs_up"),
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
	public int likeUp(Connection conn, int rno) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("likeUp");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, rno);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int hateUp(Connection conn, int rno) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("hateUp");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, rno);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
}