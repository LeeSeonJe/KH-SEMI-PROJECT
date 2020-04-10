package customer.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EmailCheckNumberServlet
 */
@WebServlet("/emailCheckNumber.me")
public class EmailCheckNumberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmailCheckNumberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String AuthenticationKey = (String) request.getSession().getAttribute("AuthenticationKey");
		String emailCheck = request.getParameter("emailCheck");
		response.setCharacterEncoding("UTF-8");
		
		if(!AuthenticationKey.equals(emailCheck)) {
			response.getWriter().println("인증번호 불일치");
		} else {
			response.getWriter().println("인증번호 일치");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
