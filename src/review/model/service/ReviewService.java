package review.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import customer.model.vo.Customer;
import review.model.dao.ReviewDAO;
import review.model.vo.AddFile;
import review.model.vo.Review;

public class ReviewService {

	public int getListCount() {
		Connection conn = getConnection();
		
		int result = new ReviewDAO().getListCount(conn);
		
		close(conn);
		
		return result;
	}

	public ArrayList<Review> selectList(int currentPage, int boardLimit) {
		Connection conn = getConnection();
	
		ArrayList<Review> list = new ReviewDAO().selectList(conn, currentPage, boardLimit);
		close(conn);
		
		return list;
	}



	public int insertReview(Review r) {
		Connection conn = getConnection();
		
		ReviewDAO dao = new ReviewDAO();
		
		int result1 = dao.insertBoard(conn, r);
		int result2 = dao.insertReview(conn, r);
		int result3 = dao.insertCos_review(conn, r);
		
		if(result1 > 0 && result2 > 0 && result3 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);	
		return result1;
	}

	public ArrayList<Review> selectSList() {
		Connection conn = getConnection();
		
		ArrayList<Review> slideList = new ReviewDAO().selectSList(conn);
		
		close(conn);
		
		return slideList;
	}

/*	public int insertReq(Review r, AddFile af) {
		Connection conn = getConnection();
		
		ReviewDAO dao = new ReviewDAO();
		
		int result1 = dao.insertBoardReq(conn, r);
		int result2 = dao.insertAddFile(conn, af);
		int result3 = dao.insertCosReq(conn, r);
		
		close(conn);
		
		return result1;
	} */

	public ArrayList<Review> selectReq() {
		Connection conn = getConnection();
		
		ArrayList<Review> list = new ReviewDAO().selectReq(conn);
		close(conn);
		
		
		return list;
	}


	public int insertReq(Review r, ArrayList<AddFile> fileList) {
		Connection conn = getConnection();
		
		ReviewDAO dao = new ReviewDAO();
		
		int result1 = dao.insertBoardReq(conn, r);
		int result2 = dao.insertAddFile(conn, fileList);
		int result3 = dao.insertCosReq(conn, r);
		
		if(result1 > 0 && result2 > 0 && result3 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result1;
	}

	public Review selectAdminReq(int boardNo) {
		Connection conn = getConnection();
		ReviewDAO dao = new ReviewDAO();
		
		Review review = null;
		review = dao.selectAdminReq(conn, boardNo);
		if(review != null) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);
		
		return review;
	}

	public ArrayList<AddFile> selectReqImg(int boardNo) {
		Connection conn = getConnection();
		ArrayList<AddFile> list = new ReviewDAO().selectReqImg(conn, boardNo);
		
		close(conn);
		
		return list;
	}

	public int updateReq(int boardNo) {
		Connection conn = getConnection();
		
		int result = new ReviewDAO().updateReq(conn, boardNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int deleteReq(int boardNo) {
		Connection conn = getConnection();
		
		int result = new ReviewDAO().deleteReq(conn, boardNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

}