package book.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;

import book.model.dao.BookDAO;
import book.model.vo.Book;

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

}
