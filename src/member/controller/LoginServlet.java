package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import customer.model.service.CustomerService;
import hospital.model.service.HospitalService;
import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login.me")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String userId = request.getParameter("id");
		String userPwd = request.getParameter("pwd");
		String category = request.getParameter("category");
		Member m = new Member(userId, userPwd);
		
		String profile_image = null;
		
		Member loginUser = null;
		if(category.equals("H")) {
			loginUser = new MemberService().loginHospital(m);
		} else {
			loginUser = new MemberService().loginCustomer(m);
		}
		
		if(loginUser !=null) {
			if(loginUser.getUser_category().equals("C")) {
				profile_image = new CustomerService().selectProfile(loginUser.getUser_no()); 
			} else if(loginUser.getUser_category().equals("H")){
				profile_image = new HospitalService().selectProfile(loginUser.getUser_no());
			} else {
				profile_image = "admin";
			}
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", loginUser);
			session.setAttribute("profile_image", profile_image);
			session.setMaxInactiveInterval(3600);
			
			response.sendRedirect(request.getContextPath());
		} else {
			request.setAttribute("msg", "로그인에 실패하였습니다.");
			RequestDispatcher view = request.getRequestDispatcher("views/common/login.jsp");
			view.forward(request, response);
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
