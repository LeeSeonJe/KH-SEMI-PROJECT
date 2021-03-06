package hospital.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hospital.model.service.HospitalService;
import hospital.model.vo.Hospital;
import hospital.model.vo.HospitalReviewList;

/**
 * Servlet implementation class DetailHospitalServlet
 */
@WebServlet("/detail.hos")
public class DetailHospitalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DetailHospitalServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String hosName = request.getParameter("hosName");
		Hospital h = new HospitalService().detailHospital(hosName);
//		System.out.println("DetailHospitalServlet.java : " + h.getHospital_no());
		ArrayList<HospitalReviewList> hrlList = new HospitalService().HospitalReviewList(h.getHospital_no());
		
		String page = null;		
		if(h != null && hrlList != null) {
			page = "views/hospital/hospital.jsp";
			request.setAttribute("h", h);
			request.setAttribute("hrlList", hrlList);
//			System.out.println("DetailHospitalServlet.java : " + hrlList.size());
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "병원 상세페이지 조회에 실패하였습니다.");
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
