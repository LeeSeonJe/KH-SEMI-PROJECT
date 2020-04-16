package worry.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import worry.model.service.WorryService;
import worry.model.vo.PageInfo;
import worry.model.vo.Worry;

/**
 * Servlet implementation class worryList
 */
@WebServlet("/worryList3.bo")
public class worryListServlet3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public worryListServlet3() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		
		WorryService service = new WorryService();
		int listCount = service.getListCount();
		
		int currentPage;			
		int pageLimit = 10;			
		int maxPage;			
		int startPage;				
		int endPage;				
		int boardLimit = 10;			
		
		currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		maxPage = (int)((double)listCount/boardLimit + 0.9);
		
		startPage = (((int)((double)currentPage/pageLimit +0.9)) -1) * pageLimit + 1;
		
		endPage = pageLimit + startPage -1;
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);
		
		
		String text = request.getParameter("text");
		String select = request.getParameter("select-worry");
		
		
		
		ArrayList<Worry> list = service.selectList2(currentPage, boardLimit);
		ArrayList<Worry> topList = new WorryService().selectTopList();
		ArrayList<Worry> lowList = new WorryService().selectLowList();
		ArrayList<Worry> hitList = new WorryService().selectHitList();
		ArrayList<Worry> searchList = new WorryService().selectSearchList(text, select);
		
		RequestDispatcher view = request.getRequestDispatcher("views/worry/worryMain.jsp");
		request.setAttribute("list", searchList);
		request.setAttribute("topList", topList);
		request.setAttribute("lowList", lowList);
		request.setAttribute("hitList", hitList);
		request.setAttribute("searchList", searchList);
		request.setAttribute("pi", pi);
		
		String value = "thumb";
		request.setAttribute("value", value);
		
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
