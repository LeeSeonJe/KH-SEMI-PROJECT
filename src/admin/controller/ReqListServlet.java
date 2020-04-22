package admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import review.model.service.ReviewService;
import review.model.vo.Review;

/**
 * Servlet implementation class ReqListServlet
 */
@WebServlet("/list.req")
public class ReqListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReqListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Review> list = new ReviewService().selectReq();
		
		String page = null;
		if(list != null) {
			page = "views/admin/adminCosReq.jsp";
			request.setAttribute("list", list);
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "제품등록요청 조회에 실패했습니다.");
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
