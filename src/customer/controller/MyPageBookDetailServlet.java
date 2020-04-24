package customer.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import book.model.service.BookService;
import book.model.vo.Book;

/**
 * Servlet implementation class BookDetailServlet
 */
@WebServlet("/myPageBookDetail.hos")
public class MyPageBookDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageBookDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String booking_no = request.getParameter("booking_no");
		String hos_name = request.getParameter("hos_name");
		Book b = new BookService().selectBookDetail(booking_no);
		
		String page = null;
		if(b!=null) {
			page = "views/customer/MyPageBookControl.jsp";
			request.setAttribute("b", b);
			request.setAttribute("hos_name", hos_name);
		} else {
			page ="views/common/errorPage.jsp";
			request.setAttribute("msg", "예약 상세정보 조회 실패");
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
