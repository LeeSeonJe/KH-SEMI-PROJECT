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
import cosmetic.model.vo.CosmeticReviewList;

/**
 * Servlet implementation class CosmeticDetailServlet
 */
@WebServlet("/detail.cos")
public class CosmeticDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CosmeticDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cosName = request.getParameter("cosName");
		CosmeticService cs = new CosmeticService();
		
		Cosmetic c = cs.selectCosmeticDetail(cosName);
		String bImg = new CosmeticService().cosmeticBrand(cosName);
		String category = request.getParameter("category");
		String categoryNo = request.getParameter("categoryNo");
		
		// 리뷰 리스트
		ArrayList<CosmeticReviewList> rList = cs.cosmeticReviewList(cosName);
		System.out.println(cosName);
		
		// 리뷰 수와 평균 평점
		double[] rca = cs.ReviewCountAvg(cosName);
		
		String page = null;
		if(c!=null && bImg!=null) {
			page = "views/cosmetic/cosmeticDetail.jsp";
			request.setAttribute("cosmeticInform",c);
			request.setAttribute("bImg", bImg);
			if(category == null) {
				// 브랜드에서 화장품으로 들어올떄
				String category2 = new CosmeticService().cosMiddleName(categoryNo);
				request.setAttribute("middleName", category2);
			} else {
				// 화장품랭킹에서 화장품으로 들어올때
				request.setAttribute("middleName", category);
			}
			request.setAttribute("rList", rList);
			request.setAttribute("rca", rca);
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
