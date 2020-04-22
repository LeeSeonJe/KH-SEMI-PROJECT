package customer.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import customer.model.service.CustomerService;
import customer.model.vo.MyPageReview;
import sun.rmi.server.Dispatcher;

/**
 * Servlet implementation class MyPageReviewUpdateServlet
 */
@WebServlet("/reviewDetail.me")
public class MyPageReviewDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageReviewDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String reviewNo = request.getParameter("reviewNo");
//		System.out.println(reviewNo);
		
		MyPageReview mpr = new CustomerService().ReviewDetail(reviewNo);
//		System.out.println(mpr);
		String page = "views/customer/myPageReviewUpdate.jsp";
		if(mpr != null) {
			request.setAttribute("mpr", mpr);
		} else {
			request.setAttribute("error", "error");			
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
