package admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import inquiry.model.service.InquiryService;
import inquiry.model.vo.Inquiry;

/**
 * Servlet implementation class InqDetailServlet
 */
@WebServlet("/InqDetail.admin")
public class InqDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InqDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String board_no = request.getParameter("board_no");
		

		Inquiry i = new InquiryService().detailQna(board_no);
		i.setBoard_no(Integer.parseInt(board_no));
		String page = null;
		if(i != null) {
			page = "views/admin/answerQnA.jsp";
			request.setAttribute("i", i);
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "1대1문의 조회 실패");
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
