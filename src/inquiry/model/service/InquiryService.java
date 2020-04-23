package inquiry.model.service;

import static common.JDBCTemplate.*;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import inquiry.model.dao.InquiryDAO;
import inquiry.model.vo.Inquiry;

public class InquiryService {

	public ArrayList<Inquiry> selectAll(int currentPage, int boardLimit) {
		Connection conn = getConnection();
		ArrayList<Inquiry> list = new InquiryDAO().selectAll(conn, currentPage, boardLimit);
		close(conn);
		return list;
	}

	public Inquiry detailQna(String board_no) {
		Connection conn = getConnection();
		Inquiry i = new InquiryDAO().detailQnA(conn, board_no);
		close(conn);
		return i;
	}

	public int insertAnswer(String board_no, String content) {
		Connection conn = getConnection();
		int result = new InquiryDAO().insertAnswer(conn, board_no, content);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}

	public int getListCountI() {
		Connection conn = getConnection();
		int result = new InquiryDAO().getListCountI(conn);
		
		close(conn);
		
		return result;
	}

}
