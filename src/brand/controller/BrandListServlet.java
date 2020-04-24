package brand.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.google.gson.Gson;

import brand.model.service.BrandService;
import brand.model.vo.Brand;

/**
 * Servlet implementation class BrandListServlet
 */
@WebServlet("/brand.li")
public class BrandListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BrandListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String brandFilter = request.getParameter("brand_filter");
		String count = request.getParameter("count");
		ArrayList<Brand> list = null;
		
		if(count == null) {
			count = "20";
			String page = null;
			list = new BrandService().selectBrnadList(brandFilter, count);
			if(list != null) {
				page="views/brand/brand.jsp";
				request.setAttribute("list", list);
			} else {
				page = "views/common/errorPage.jsp";
				request.setAttribute("msg", "�������� ��ȸ�� �����Ͽ����ϴ�.");
			}
			RequestDispatcher view = request.getRequestDispatcher(page);
			view.forward(request, response);
		} else {			
//			System.out.println(count);			
			list = new BrandService().selectBrnadList(brandFilter, count);
//			for(Brand b : list) {
//				System.out.println(b);
//			}
			response.setContentType("application/json; charset=UTF-8");
			new Gson().toJson(list, response.getWriter());
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
