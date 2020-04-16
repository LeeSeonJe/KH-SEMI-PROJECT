package cosmetic.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cosmetic.model.service.CosmeticService;
import cosmetic.model.vo.Cosmetic;

/**
 * Servlet implementation class CosmeticListServlet
 */
@WebServlet("/cosmetic.li")
public class CosmeticListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CosmeticListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cos_middle_no = request.getParameter("cos_middle_no");
		ArrayList<Cosmetic> list = new CosmeticService().selectCosmeticList(cos_middle_no);
		
		// 화장품 테이블에 중분류가 숫자이므로 카테고리 테이블에서 조인해서 중분류 이름 가져옴
		String middleName = new CosmeticService().cosMiddleName(cos_middle_no);
		
		
		String page = null;
		if(list != null) {
			page="views/cosmetic/cosmeticRank.jsp";
			request.setAttribute("list", list);
			request.setAttribute("middleName", middleName);
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "공지사항 조회에 실패하였습니다.");
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
