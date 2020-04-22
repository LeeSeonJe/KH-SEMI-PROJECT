package admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import review.model.service.ReviewService;
import review.model.vo.AddFile;
import review.model.vo.Review;

/**
 * Servlet implementation class ReqDetailServlet
 */
@WebServlet("/detail.req")
public class ReqDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReqDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		
		System.out.println("ReqDetailServlet boardNo : " + boardNo);
		
		ReviewService service = new ReviewService();
		
		Review review = service.selectAdminReq(boardNo);
		ArrayList<AddFile> fileList = service.selectReqImg(boardNo);
		
		if(review != null && fileList != null) {
			request.setAttribute("board", review);
			request.setAttribute("fileList", fileList);
			request.getRequestDispatcher("views/admin/adminReqDetail.jsp").forward(request, response);
		} else {
			request.setAttribute("msg", "등록요청조회 상세보기에 실패했습니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
