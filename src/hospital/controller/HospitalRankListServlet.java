package hospital.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import hospital.model.service.HospitalService;
import hospital.model.vo.Hospital;

/**
 * Servlet implementation class HospitalRankListServlet
 */
@WebServlet("/hospital.li")
public class HospitalRankListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HospitalRankListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String hospitalFilter = request.getParameter("hospital_filter");
		ArrayList<Hospital> list = null;
		
		if(hospitalFilter == null) {
			String page = null;
			list = new HospitalService().selectHospitalList(hospitalFilter);
			if(list != null) {
				page="views/hospital/hospitalRank.jsp";
				request.setAttribute("list", list);
			} else {
				page ="views/common/errorPage.jsp";
				request.setAttribute("msg", "병원 랭킹 페이지 호출 실패");
			}
			RequestDispatcher view = request.getRequestDispatcher(page);
			view.forward(request, response);
		} else {
			list = new HospitalService().selectHospitalList(hospitalFilter);
			response.setContentType("application/json; charset=UTF-8");
			new Gson().toJson(list, response.getWriter());
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
