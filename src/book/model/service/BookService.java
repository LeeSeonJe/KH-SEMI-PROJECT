package book.model.service;

import static common.JDBCTemplate.*;

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

}
