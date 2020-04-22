package board.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import board.model.dao.BoardDAO;
import board.model.vo.Board;
import review.model.dao.ReviewDAO;

public class BoardService {

	public ArrayList<Board> selectAll() {
		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDAO().selectAll(conn);
		close(conn);
		return list;
	}

	public ArrayList<Board> searchReview(String keyword) {
		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDAO().searchReview(conn, keyword);
		close(conn);
		return list;
	}

	public int deleteReview(String review_no) {
		Connection conn = getConnection();
		int result = new BoardDAO().deleteReview(conn, review_no);
		if(result>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
}
