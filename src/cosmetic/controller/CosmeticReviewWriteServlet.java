package cosmetic.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cosmetic.model.service.CosmeticService;
import cosmetic.model.vo.Cosmetic;

/**
 * Servlet implementation class CosmeticReviewWriteServlet
 */
@WebServlet("/CosmeticReviewWriteServlet")
public class CosmeticReviewWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CosmeticReviewWriteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cosName = request.getParameter("cosName");
		Cosmetic c = new CosmeticService().selectCosmeticDetail(cosName);
		System.out.println(cosName);
		
		String page = "";
		if(c != null) {
			page = "views/cosmetic/cosmeticReviewWrite.jsp";
			request.setAttribute("c", c);
		} else {
			page = "views/cosmetic/cosmeticReviewWrite.jsp";
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
