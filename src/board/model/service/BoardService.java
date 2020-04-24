package board.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import board.model.dao.BoardDAO;
import board.model.vo.Board;
import member.model.dao.MemberDAO;
import review.model.dao.ReviewDAO;

public class BoardService {

	public ArrayList<Board> selectAll(int currentPage, int boardLimit) {
		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDAO().selectAll(conn, currentPage, boardLimit);
		close(conn);
		return list;
	}

	public ArrayList<Board> searchReview(String keyword, int currentPage, int boardLimit) {
		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDAO().searchReview(conn, keyword, currentPage, boardLimit);
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

	public ArrayList<Board> selectBoardAll(int currentPage, int boardLimit) {
		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDAO().selectBoardAll(conn, currentPage, boardLimit);
		close(conn);
		return list;
	}
	
	public int getListCountR() {
		Connection conn = getConnection();
		
		int result = new BoardDAO().getListCountR(conn);
		
		close(conn);
		
		return result;
	}

	public int getListCountW() {
Connection conn = getConnection();
		
		int result = new BoardDAO().getListCountW(conn);
		
		close(conn);
		
		return result;
	}
	
}
