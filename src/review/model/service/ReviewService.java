package review.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import review.model.dao.ReviewDAO;
import review.model.vo.Review;

public class ReviewService {

	public ArrayList<Review> selectList(int currentPage, int boardLimit) {
		Connection conn = getConnection();
	
		ArrayList<Review> list = new ReviewDAO().selectList(conn, currentPage, boardLimit);
		close(conn);
		
		return list;
	}

	public int getListCount() {
		Connection conn = getConnection();
		int result = new ReviewDAO().getListCount(conn);
		
		close(conn);
		
		
		return result;
	}

	public int insertReview(Review r) {
		Connection conn = getConnection();
		
		ReviewDAO dao = new ReviewDAO();
		
		int result1 = dao.insertReview(conn, r);
		if(result1 > 0 ) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);	
		return result1;
	}

}