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

import worry.model.service.WorryService;
import worry.model.vo.AddFile;
import worry.model.vo.Comments;
import worry.model.vo.Worry;

/**
 * Servlet implementation class worryDetailServlet
 */
@WebServlet("/beforeWorryDetail.bo")
public class beforeWorryDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public beforeWorryDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int	worryNo = Integer.parseInt(request.getParameter("worryNo"));	
		int first = new WorryService().firstWorry(worryNo);
		
		Worry w = new Worry(); 
		

		if(worryNo == first) {
			response.setContentType("text/html; charset=UTF-8");
			 
			PrintWriter out = response.getWriter();
			 			
			out.println("<script>");
			
			out.println("alert('이전 게시글이 없습니다.');");
			
			out.println("location.href='worryDetail.bo?worryNo=" + worryNo + "';");
			
			out.println("</script>");		 
			out.flush();
		} else {
			w = new WorryService().beforeWorryDetail(worryNo);
			
			ArrayList<Comments> list = new WorryService().selectComments(w.getWorryNo());
			
			ArrayList<AddFile> fList = new WorryService().selectFile(w.getWorryNo());
			request.setAttribute("list", list);
			request.setAttribute("w", w);
			request.setAttribute("fList", fList);
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
