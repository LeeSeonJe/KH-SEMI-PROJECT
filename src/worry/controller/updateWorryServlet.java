package worry.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.vo.Member;
import worry.model.service.WorryService;
import worry.model.vo.Worry;

/**
 * Servlet implementation class updateWorryServlet
 */
@WebServlet("/worryUpdate.bo")
public class updateWorryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateWorryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUser_no();
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int worryNo = Integer.parseInt(request.getParameter("worryNo"));
		
		System.out.println(userNo + title + content + worryNo);
		
		Worry w = new Worry(worryNo, title, content, userNo);
		int result = new WorryService().updateWorry(w);
		
		System.out.println(result);
		
		response.sendRedirect("worryDetail.bo?worryNo=" + worryNo);
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
