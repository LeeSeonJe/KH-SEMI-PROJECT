package cosmetic.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import cosmetic.model.service.CosmeticService;
import cosmetic.model.vo.CosmeticReviewList;

/**
 * Servlet implementation class CosmeticSearchServlet
 */
@WebServlet("/cosReview.sc")
public class CosmeticSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CosmeticSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cosName = request.getParameter("cosName");
		String keyword = request.getParameter("keyword");
		
		ArrayList<CosmeticReviewList> crl = new CosmeticService().reviewSearch(cosName, keyword);
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(crl, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
