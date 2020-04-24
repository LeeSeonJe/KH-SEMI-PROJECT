package review.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import review.model.service.ReviewService;

/**
 * Servlet implementation class LikeServlet
 */
@WebServlet("/vote.re")
public class VoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VoteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int rno = Integer.parseInt(request.getParameter("rno"));
		System.out.println("rno : " + rno);
		
		String vote = (String)request.getParameter("vote");
		System.out.println("ttttt : " + vote);
		int result = 0;
		int result1 = 0;
		
		if(vote.equals("좋아요")) {
			result = new ReviewService().likeUp(rno);
			System.out.println("VoteServlet result : " + result);
		} else if(vote.equals("싫어요")) {
			result1 = new ReviewService().hateUp(rno);
			System.out.println("VoteServlet result1 : " + result1);
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
