package customer.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import customer.model.service.CustomerService;
import customer.model.vo.MyPageBook;
import customer.model.vo.MyPageCustomer;
import customer.model.vo.MyPageQnA;
import customer.model.vo.MyPageReview;
import customer.model.vo.MyPageWorry;
import member.model.vo.Member;
import review.model.vo.PageInfo;

/**
 * Servlet implementation class MyPageServlet
 */
@WebServlet("/mypage.me")
public class MyPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		Member m = (Member) session.getAttribute("loginUser");
		// 마이페이지 내정보관리 내용을 가져옴
		
		
		
		// 페이징 처리
		CustomerService service = new CustomerService(); // 두 개의 서비스를 호출하기 때문에 참조변수로 생성
		
		// 게시글의 총 개수
		int getReviewCount = service.getReviewCount(m.getUser_id());
		int getWorryCount = service.getWorryCount(m.getUser_id());
		int getBookCount = service.getBookCount(m.getUser_id());
		int getQnACount = service.getQnACount(m.getUser_id());
		
		int currentPage;  		// 현재 페이지
		int pageLimit = 10;  	// 한 페이지에 표시될 페이징 수
		int maxPage;	  		// 전체 페이지 중에서 마지막 페이지
		int startPage;    		// 페이징된 페이지 중 시작페이지
		int endPage;	  		// 페이징된 페이지 중 마지막페이지
		int boardLimit = 10;   	// 한 페이지에 보여지는 게시글 수
		
		PageInfo reviewPi = null;
		PageInfo worryPi = null;
		PageInfo qnaPi = null;
		PageInfo bookPi = null; // 예약 페이징 시켜야함
		ArrayList<MyPageReview> mpr = null;
		ArrayList<MyPageWorry> mpw = null;
		ArrayList<MyPageQnA> mpq = null;
		ArrayList<MyPageBook> mpb = null;
		
		if(request.getParameter("currentPage") != null) {			
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
			startPage = (((int)((double)currentPage / pageLimit + 0.9)) - 1) * pageLimit + 1;
			maxPage = (int)((double)getReviewCount / pageLimit + 0.9);
			endPage = pageLimit + startPage - 1;
			
			if(maxPage < endPage) {
				endPage = maxPage;
			}
			
			// 마이페이지 내 리뷰 내용을 가져옴
			mpr = service.selectCustomerReview(m.getUser_id(), currentPage, boardLimit); 
			
			response.setContentType("application/json; charset=UTF-8");
			new Gson().toJson(mpr, response.getWriter());
		} else if(request.getParameter("currentPage2") != null){
			currentPage = Integer.parseInt(request.getParameter("currentPage2"));
//			System.out.println(currentPage);
			startPage = (((int)((double)currentPage / pageLimit + 0.9)) - 1) * pageLimit + 1;
			maxPage = (int)((double)getReviewCount / pageLimit + 0.9);
			endPage = pageLimit + startPage - 1;
			
			if(maxPage < endPage) {
				endPage = maxPage;
			}			
			mpw = service.selectCustomerWorry(m.getUser_id(), currentPage, boardLimit);
			
			response.setContentType("application/json; charset=UTF-8");
			new Gson().toJson(mpw, response.getWriter());
		} else if(request.getParameter("currentPage3") != null){
			currentPage = Integer.parseInt(request.getParameter("currentPage3"));
			startPage = (((int)((double)currentPage / pageLimit + 0.9)) - 1) * pageLimit + 1;
			maxPage = (int)((double)getReviewCount / pageLimit + 0.9);
			endPage = pageLimit + startPage - 1;
			
			if(maxPage < endPage) {
				endPage = maxPage;
			}			
			mpq = service.selectCustomerQnA(m.getUser_id(), currentPage, boardLimit);
			
			response.setContentType("application/json; charset=UTF-8");
			new Gson().toJson(mpq, response.getWriter());
			
		} else if (request.getParameter("currentPage4") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage4"));
			startPage = (((int)((double)currentPage / pageLimit + 0.9)) - 1) * pageLimit + 1;
			maxPage = (int)((double)getReviewCount / pageLimit + 0.9);
			endPage = pageLimit + startPage - 1;
			
			if(maxPage < endPage) {
				endPage = maxPage;
			}			
			mpb = service.selectCustomerBook(m.getUser_id(), currentPage, boardLimit);
			
			response.setContentType("application/json; charset=UTF-8");
			new Gson().toJson(mpb, response.getWriter());
		} else {
			MyPageCustomer mpc = new CustomerService().selectCustomer(m.getUser_id());
			currentPage = 1;
			
			startPage = (((int)((double)currentPage / pageLimit + 0.9)) - 1) * pageLimit + 1;
			maxPage = (int)((double)getReviewCount / pageLimit + 0.9);
			endPage = pageLimit + startPage - 1;
			if(maxPage < endPage) {
				endPage = maxPage;
			}
			
			// 리뷰 페이징
			reviewPi = new PageInfo(currentPage, getReviewCount, pageLimit, maxPage, startPage, endPage, boardLimit);
			mpr = service.selectCustomerReview(m.getUser_id(), currentPage, boardLimit); 
			
			startPage = (((int)((double)currentPage / pageLimit + 0.9)) - 1) * pageLimit + 1;
			maxPage = (int)((double)getWorryCount / pageLimit + 0.9);
			endPage = pageLimit + startPage - 1;
			if(maxPage < endPage) {
				endPage = maxPage;
			}

			worryPi = new PageInfo(currentPage, getWorryCount, pageLimit, maxPage, startPage, endPage, boardLimit);
			mpw = service.selectCustomerWorry(m.getUser_id(), currentPage, boardLimit);
			
			startPage = (((int)((double)currentPage / pageLimit + 0.9)) - 1) * pageLimit + 1;
			maxPage = (int)((double)getQnACount / pageLimit + 0.9);
			endPage = pageLimit + startPage - 1;
			if(maxPage < endPage) {
				endPage = maxPage;
			}
			
			qnaPi = new PageInfo(currentPage, getQnACount, pageLimit, maxPage, startPage, endPage, boardLimit);
			mpq = service.selectCustomerQnA(m.getUser_id(), currentPage, boardLimit);
			
			startPage = (((int)((double)currentPage / pageLimit + 0.9)) - 1) * pageLimit + 1;
			maxPage = (int)((double)getBookCount / pageLimit + 0.9);
			endPage = pageLimit + startPage - 1;
			if(maxPage < endPage) {
				endPage = maxPage;
			}
			
			bookPi = new PageInfo(currentPage, getBookCount, pageLimit, maxPage, startPage, endPage, boardLimit);
			mpb = service.selectCustomerBook(m.getUser_id(), currentPage, boardLimit);
			
			String page = "";
			if(mpc != null) {
				page = "/views/customer/myPage.jsp";
				request.setAttribute("mpc", mpc);
				request.setAttribute("mpr", mpr);
				request.setAttribute("reviewPi", reviewPi);
				request.setAttribute("mpw", mpw);
				request.setAttribute("worryPi", worryPi);
				request.setAttribute("mpq", mpq);
				request.setAttribute("qnaPi", qnaPi);
				request.setAttribute("mpb", mpb);
				request.setAttribute("bookPi", bookPi);
			} else {
				request.setAttribute("msg", "회원조회 실패");
			}
			
			RequestDispatcher view = request.getRequestDispatcher(page);
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
