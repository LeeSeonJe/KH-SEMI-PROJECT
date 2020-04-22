package worry.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.vo.Member;
import worry.model.service.WorryService;
import worry.model.vo.AddFile;
import worry.model.vo.Comments;
import worry.model.vo.Worry;

/**
 * Servlet implementation class worryDetailServlet
 */
@WebServlet("/worryDetail.bo")
public class worryDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public worryDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int worryNo = Integer.parseInt(request.getParameter("worryNo"));	
		Worry w = new Worry(); 
		String result = "no";
		int userNo = 0;
		ArrayList<Comments> list = new WorryService().selectComments(worryNo);
		
		ArrayList<AddFile> fList = new WorryService().selectFile(worryNo);
		
		if(request.getSession().getAttribute("loginUser") != null) {
			userNo = ((Member)request.getSession().getAttribute("loginUser")).getUser_no();
			int result2 = new WorryService().LikeList(worryNo, userNo );
			if(result2 > 0) {
				result = "yes";
			}
		}
		System.out.println(result);
		int last = new WorryService().lastWorry(worryNo);
		w = new WorryService().worryDetail(worryNo);
		System.out.println(w);
		
		request.setAttribute("list", list);
		request.setAttribute("w", w);
		request.setAttribute("fList", fList);
		RequestDispatcher view = request.getRequestDispatcher("views/worry/worryRead.jsp");
		request.setAttribute("result", result);
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
