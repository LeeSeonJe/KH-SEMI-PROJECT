package book.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import book.model.dao.BookDAO;
import book.model.vo.Book;
import member.model.vo.Member;

public class BookService {

	public int insertBook(Book b) {
		Connection conn = getConnection();
		
		int result = new BookDAO().insertBook(conn, b);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}

	public ArrayList<Book> selectBookList(Member m) {
		Connection conn = getConnection();
		
		ArrayList<Book> list = new BookDAO().selectBookList(conn, m);
		close(conn);
		return list;
	}

	public Book selectBookDetail(String booking_no) {
		Connection conn = getConnection();
		
		Book b = new BookDAO().selectBookDetail(conn, booking_no);
		close(conn);
		return b;
	}

	public int deleteBook(String booking_no) {
		Connection conn = getConnection();
		
		int result = new BookDAO().deleteBook(conn, booking_no);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public ArrayList<String> bookTimeCheck(String date) {
		Connection conn = getConnection();
		
		ArrayList<String> list = new BookDAO().bookTimeCheck(conn, date);
		close(conn);
		return list;
	}

}
