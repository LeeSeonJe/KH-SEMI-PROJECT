package book.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import book.model.service.BookService;
import book.model.vo.Book;
import hospital.model.service.HospitalService;

/**
 * Servlet implementation class BookUpdateServlet
 */
@WebServlet("/updateBook.hos")
public class BookUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int book_no = Integer.parseInt(request.getParameter("book_no"));
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		String date = request.getParameter("date");
		String time = request.getParameter("time");
		String textbox = request.getParameter("textbox");
		String customer_no = request.getParameter("customer_no");
		String hos_name = request.getParameter("hos_name");
		
		
		Date sqlDate = null;
		if(date.equals("")) {
			sqlDate = new Date(new GregorianCalendar().getTimeInMillis());
		} else {
			String[] dateArr = date.split("-");
			int year = Integer.parseInt(dateArr[0]);
			int month = Integer.parseInt(dateArr[1])-1;
			int day = Integer.parseInt(dateArr[2]);
			
			sqlDate = new Date(new GregorianCalendar(year, month, day).getTimeInMillis());
		}
		
		int hospital_no = new HospitalService().selectHosNo(hos_name); 
		Book b = new Book(book_no, name, tel, sqlDate, time, textbox, Integer.parseInt(customer_no), hospital_no);
		System.out.println(b);
		int result = new BookService().updateBook(b);
		
		response.setCharacterEncoding("UTF-8");
		if(result > 0) {
			response.getWriter().println("예약수정이 완료되었습니다.");
		} else {
			response.getWriter().println("예약수정 실패");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
