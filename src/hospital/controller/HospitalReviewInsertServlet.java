package hospital.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import hospital.model.service.HospitalService;
import hospital.model.vo.HospitalReviewList;
import member.model.vo.Member;

/**
 * Servlet implementation class HospitalReviewInsertServlet
 */
@WebServlet("/reviewInsert.hos")
public class HospitalReviewInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HospitalReviewInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int hospitalNo = Integer.parseInt(request.getParameter("hospitalNo"));
		Member m = (Member) session.getAttribute("loginUser"); 
		String heart = request.getParameter("heart");
		
		ArrayList<HospitalReviewList> hrlList = new HospitalService().insertHospitalReview(title, content, m.getUser_no(), hospitalNo, heart);
//		System.out.println(m.getUser_id());
//		System.out.println(m.getUser_no());
//		System.out.println(title);
//		System.out.println(content);
		
		response.setContentType("applicatino/json; charset=UTF-8");
		new Gson().toJson(hrlList, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
