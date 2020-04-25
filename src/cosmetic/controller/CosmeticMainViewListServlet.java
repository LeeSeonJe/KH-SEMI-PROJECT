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
import cosmetic.model.vo.Cosmetic;

/**
 * Servlet implementation class CosmeticMainViewListServlet
 */
@WebServlet("/mainViewList.cos")
public class CosmeticMainViewListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CosmeticMainViewListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String cos_middle_no = "";
		System.out.println(cos_middle_no);
		ArrayList<Cosmetic> cList = new CosmeticService().selectCosmeticList(cos_middle_no);
		String cosMiddleName = "";
		while(true) {
			if(cList.isEmpty() || cList.size() < 3) {
				cos_middle_no = Integer.toString((int)(Math.random() * 126) + 1);
				cList = new CosmeticService().selectCosmeticList(cos_middle_no);
				cosMiddleName = new CosmeticService().cosMiddleName(cos_middle_no);
				System.out.println(cosMiddleName);
			} else {
				cList.get(0).setMiddle_no(cosMiddleName);
				break;
			}
		}
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(cList, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
