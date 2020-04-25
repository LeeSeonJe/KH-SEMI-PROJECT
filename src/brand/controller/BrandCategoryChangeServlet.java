package brand.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import brand.model.service.BrandService;
import cosmetic.model.vo.Cosmetic;

/**
 * Servlet implementation class BrandCategoryChangeServlet
 */
@WebServlet("/bCategory.ch")
public class BrandCategoryChangeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BrandCategoryChangeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String middleCategory = request.getParameter("middleCategory");
		String bname = request.getParameter("bname");
		System.out.println(bname);
		System.out.println(middleCategory);
		ArrayList<Cosmetic> abcl = new BrandService().ajaxBrandCosmeticList(middleCategory, bname);
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(abcl, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
