package customer.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import customer.model.service.CustomerService;
import customer.model.vo.MyPageQnA;
import member.model.vo.Member;

/**
 * Servlet implementation class MyPageSendQnAServlet
 */
@WebServlet("/sendQnA.me")
public class MyPageSendQnAServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageSendQnAServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		String user_no = Integer.toString(loginUser.getUser_no());
		
		String board_title = request.getParameter("title");
		String board_content = request.getParameter("content");
		
		MyPageQnA mpq = new MyPageQnA(user_no, board_title, board_content);
		
		int result = new CustomerService().sendQnA(mpq);
		if(result == 2) {
			response.setContentType("text/html; charset=UTF-8");
			 
			PrintWriter out = response.getWriter();
			 			
			out.println("<script>");
			
			out.println("alert('작성이 완료되었습니다.');");			
			out.println("self.close()");
			out.println("</script>");		 
			out.flush();
			out.close();
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
