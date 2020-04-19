package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hospital.model.service.HospitalService;
import hospital.model.vo.Hospital;
import member.model.vo.Member;

/**
 * Servlet implementation class MyPageHospital
 */
@WebServlet("/mypage.hos")
public class MyPageHospital extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageHospital() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		Member m = (Member) session.getAttribute("loginUser"); 
		Hospital h = new HospitalService().selectHospital(m);
		
		String page = null;
		if(h != null) {
			page = "views/member/myPageHospital.jsp";
			request.setAttribute("h", h);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "병원 마이페이지 조회 실패");
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
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
