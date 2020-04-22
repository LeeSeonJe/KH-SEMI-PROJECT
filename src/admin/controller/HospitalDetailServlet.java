package admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hospital.model.service.HospitalService;
import hospital.model.vo.Hospital;
import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class HospitalDetailServlet
 */
@WebServlet("/hospitalDetail.admin")
public class HospitalDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HospitalDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		
		Member m = new MemberService().memberDetail(userNo);
		Hospital h = new HospitalService().hospitalDetail(userNo);
		
		String page = null;
		if(m != null && h != null) {
			page = "views/admin/adminHospitalDetail.jsp";
			request.setAttribute("m", m);
			request.setAttribute("h", h);
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "회원 상세정보 조회에 실패하였습니다.");
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
