package cosmetic_req.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cosmetic.model.vo.Cosmetic;
import cosmetic_req.model.service.Cosmetic_reqService;

/**
 * Servlet implementation class CosmeticInsertServlet
 */
@WebServlet("/insert.cos")
public class CosmeticInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CosmeticInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String brandName = request.getParameter("brandName");
		String middleCg = request.getParameter("middleCg");
		String name = request.getParameter("name");
		String content = request.getParameter("content");
		String volume = request.getParameter("volume");
		String price = request.getParameter("price");
		Cosmetic c = new Cosmetic(0, name, content, volume, price, 0, 0, brandName, middleCg, "임시");
		
		int result = new Cosmetic_reqService().insertCos(c);
		
		String page = null;
		if(result > 0) {
			page = "views/admin/cosmeticReqPopup.jsp";
			request.setAttribute("result", result);
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "화장품 등록에 실패하였습니다.");
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
