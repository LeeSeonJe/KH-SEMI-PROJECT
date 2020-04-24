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

/**
 * Servlet implementation class MyPageReviewUpdateServlet
 */
@WebServlet("/reviewUpdate.me")
public class MyPageReviewUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageReviewUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String board_no = request.getParameter("board_no"); //
		String cosmetic_no = request.getParameter("cosmetic_no"); //
		String cosmetic_name = request.getParameter("cosmetic_name"); //
		String brand_name = request.getParameter("brand_name");  //
		String review_heart = request.getParameter("reviewScore");//
		String board_title = request.getParameter("title");//
		String board_content = request.getParameter("content");//
		
		MyPageReview mpr = new MyPageReview(board_no, board_title, cosmetic_name, board_content, brand_name, review_heart, cosmetic_no);
		int result = new CustomerService().reviewUpdate(mpr);
//		System.out.println(result);
		String page = "";
		if(result == 2) {
			page = "mypage.me";
			request.setAttribute("RUS", "RUS");
		} else {
			page = "views/customer/myPage.jsp";
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
