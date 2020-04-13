package customer.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import customer.model.service.CustomerService;
import customer.model.vo.Customer;
import member.model.vo.Member;

/**
 * Servlet implementation class InsertCustomerServlet
 */
@WebServlet("/insertC.me")
public class InsertCustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertCustomerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		request.setCharacterEncoding("UTF-8");
//		
//		String category = request.getParameter("category");
//		String userId = request.getParameter("userId");
//		String userName = request.getParameter("userName");
//		String userPwd = request.getParameter("userPwd");
//		String email = request.getParameter("email");
//		String gender = request.getParameter("gender");
//		String age = request.getParameter("age");
//		String skintype = request.getParameter("skintype");
//		
//		Member m = new Member(userName, userId, userPwd, category);
//		Customer c = new Customer(0, email, age, skintype, gender);
//		int result = new CustomerService().insertCustomer(m, c);
//		
//		if(result > 0) {
//			response.sendRedirect("views/common/loginedMain.jsp");
//			
//		} else {
//			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
//			request.setAttribute("msg", "ȸ�����Կ� �����߽��ϴ�.");
//			view.forward(request, response);
//		}
		
//		===================================================================================위에는 
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024 * 1024 * 10; // 10MByte로 전송파일 용량 제한
			String root = request.getSession().getServletContext().getRealPath("/"); //웹 서버 컨테이너 경로 추출
			String savePath = root + "resources/images/member_profile";
			
//			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, new my)
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
