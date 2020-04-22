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
@WebServlet("/worryList.bo")
public class worryListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public worryListServlet() {
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
		
		
		
		ArrayList<Worry> list = service.selectList(currentPage, boardLimit);
//		ArrayList<Worry> topList = new WorryService().selectTopList(currentPage, boardLimit);
		ArrayList<Worry> top10List = new WorryService().selectTop10List(currentPage, boardLimit);
		ArrayList<Worry> lowList = new WorryService().selectLowList(currentPage, boardLimit);
//		ArrayList<Worry> hitList = new WorryService().selectHitList(currentPage, boardLimit);
//		ArrayList<Worry> hit10List = new WorryService().selectHit10List(currentPage, boardLimit);

		
		RequestDispatcher view = request.getRequestDispatcher("views/worry/worryMain.jsp");
		request.setAttribute("list", list);
//		request.setAttribute("topList", topList);
		request.setAttribute("top10List", top10List);
		request.setAttribute("lowList", lowList);
//		request.setAttribute("hitList", hitList);
//		request.setAttribute("hit10List", hit10List);
		request.setAttribute("pi", pi);
		
		String value = "hit";
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
