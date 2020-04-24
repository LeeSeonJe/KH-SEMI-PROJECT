package worry.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.vo.Member;
import worry.model.service.WorryService;
import worry.model.vo.AddFile;
import worry.model.vo.Comments;
import worry.model.vo.Worry;

/**
 * Servlet implementation class worryDetailServlet
 */
@WebServlet("/afterWorryDetail.bo")
public class afterWorryDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public afterWorryDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int	worryNo = Integer.parseInt(request.getParameter("worryNo"));	
		int last = new WorryService().lastWorry(worryNo);
		String like = "no";
		String hate = "no";
		int userNo = 0;
		Worry w = new Worry(); 

		if(worryNo == last) {
			response.setContentType("text/html; charset=UTF-8");
			 
			PrintWriter out = response.getWriter();
			 			
			out.println("<script>");
			
			out.println("alert('마지막 페이지 입니다.');");
			
			out.println("location.href='worryDetail.bo?worryNo=" + worryNo + "';");
			
			out.println("</script>");		 
			out.flush();
		} else {
			w = new WorryService().afterWorryDetail(worryNo);
			
			ArrayList<Comments> list = new WorryService().selectComments(w.getWorryNo());
			
			ArrayList<AddFile> fList = new WorryService().selectFile(w.getWorryNo());
			
			if(request.getSession().getAttribute("loginUser") != null) {
				userNo = ((Member)request.getSession().getAttribute("loginUser")).getUser_no();
				int result2 = new WorryService().LikeList(w.getWorryNo(), userNo );
				if(result2 > 0) {
					like = "yes";
				}
			}
			
			if(request.getSession().getAttribute("loginUser") != null) {
				userNo = ((Member)request.getSession().getAttribute("loginUser")).getUser_no();
				int result3 = new WorryService().hateList(w.getWorryNo(), userNo );
				if(result3 > 0) {
					hate = "yes";
				}
			}
			
			request.setAttribute("list", list);
			request.setAttribute("w", w);
			request.setAttribute("fList", fList);
			request.setAttribute("like", like);
			request.setAttribute("hate", hate);
			RequestDispatcher view = request.getRequestDispatcher("views/worry/worryRead.jsp");
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
