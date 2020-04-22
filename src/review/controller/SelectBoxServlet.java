package review.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import review.model.service.ReviewService;
import review.model.vo.PageInfo;
import review.model.vo.Review;

/**
 * Servlet implementation class SelectBoxServlet
 */
@WebServlet("/select.re")
public class SelectBoxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectBoxServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		ReviewService service = new ReviewService();
		ArrayList<Review> slideList = service.selectSList();
		
		int listCount = service.getListCount();
		System.out.println(listCount);
		
		int currentPage;		// 현재 페이지
		int pageLimit = 10;		// 한 페이지에 표시될 페이징 수
		int maxPage;			// 전체 페이지 중 마지막 페이지
		int startPage;			// 페이징 된 페이지 중 시작 페이지
		int endPage;			// 페이징 된 페이지 중 마지막 페이지
		int boardLimit = 10;	// 한 페이지에 보일 게시글 수

		currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		maxPage = (int)((double)listCount / boardLimit + 0.9);
		
		startPage = (((int)((double)currentPage / pageLimit + 0.9)) - 1) * pageLimit + 1;
		
		endPage = pageLimit + startPage - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);		

		String value = request.getParameter("selectId");
		
		ArrayList<Review> list = null;
		
		if(value.contentEquals("latest")) {
			list = service.selectList(currentPage, boardLimit);
		} else if(value.contentEquals("oldest")) {
			list = service.oldList(currentPage, boardLimit);
		}  else if(value.contentEquals("loved")) {
			list = service.lovedList(currentPage, boardLimit);
		}  else if(value.contentEquals("unloved")) {
			list = service.unlovedList(currentPage, boardLimit);
		}
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(list, response.getWriter());
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
