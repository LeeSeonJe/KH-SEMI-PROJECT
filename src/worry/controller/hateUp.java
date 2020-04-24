package worry.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.vo.Member;
import worry.model.service.WorryService;

/**
 * Servlet implementation class hitsUp
 */
@WebServlet("/hate.bo")
public class hateUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public hateUp() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int worryNo = Integer.parseInt(request.getParameter("worryNo"));
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUser_no();
		
		int result2 = new WorryService().hater(worryNo, userNo);
		
		int result = new WorryService().hateUp(worryNo);
		
		System.out.println(result2);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
