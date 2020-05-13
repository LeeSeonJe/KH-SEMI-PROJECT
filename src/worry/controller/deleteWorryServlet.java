package worry.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import worry.model.service.WorryService;

/**
 * Servlet implementation class updateWorryServlet
 */
@WebServlet("/worryDelete.bo")
public class deleteWorryServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteWorryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      int worryNo = Integer.parseInt(request.getParameter("worryNo"));
      int result = new WorryService().deleteWorry(worryNo);
      
      response.setContentType("text/html; charset=UTF-8");
       
      PrintWriter out = response.getWriter();
                
      out.println("<script>");
      
      out.println("alert('게시글이 삭제 되었습니다..');");
      
      out.println("location.href='worryList.bo'");
      
      out.println("</script>");   
      
      
//      
//      response.sendRedirect("worryList.bo");
      
      
      
      
      
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }

}