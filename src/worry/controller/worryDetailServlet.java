package worry.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		ArrayList<Comments> list = new WorryService().selectComments(worryNo);
		
		ArrayList<AddFile> fList = new WorryService().selectFile(worryNo);

		
		w = new WorryService().worryDetail(worryNo);
		

		request.setAttribute("list", list);
		request.setAttribute("w", w);
		request.setAttribute("fList", fList);
		RequestDispatcher view = request.getRequestDispatcher("views/worry/worryRead.jsp");
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
