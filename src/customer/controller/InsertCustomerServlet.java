package customer.controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import common.CosReqFileRenamePolicy;
import common.CustomerFileRenamePolicy;
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
		request.setCharacterEncoding("UTF-8");

		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024 * 1024 * 10;
			String root = request.getSession().getServletContext().getRealPath("/");
			String savePath = root + "member_images/";
			
			MultipartRequest multiRequest
				= new MultipartRequest(request, savePath, maxSize, "UTF-8", new CustomerFileRenamePolicy());
			String saveFile = null;
			Enumeration<String> files = multiRequest.getFileNames();
			while(files.hasMoreElements()) {
				String name = files.nextElement();
				
				if(multiRequest.getFilesystemName(name) != null) {
					saveFile = multiRequest.getFilesystemName(name);
				}
			}
		
			String userId = multiRequest.getParameter("userId");
			String userName = multiRequest.getParameter("userName");
			String userPwd = multiRequest.getParameter("userPwd");
			String email = multiRequest.getParameter("email");
			String gender = multiRequest.getParameter("gender");
			String userBirth = multiRequest.getParameter("userBirth");
			String skintype = multiRequest.getParameter("skintype");
		
			Member m = new Member(userName, userId, userPwd, "C");
			Customer c = new Customer(0, email, userBirth, skintype, gender, saveFile);
			int result = new CustomerService().insertCustomer(m, c);
			if(result > 0) {
				response.sendRedirect("views/common/SignUpCustomer4.jsp");
				
			} else {
				RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
				request.setAttribute("msg", "회원가입에 실패하였습니다.");
				view.forward(request, response);
			}
		} else {
			String userId = request.getParameter("userId");
			String userName = request.getParameter("userName");
			String userPwd = request.getParameter("userPwd");
			String email = request.getParameter("email");
			String gender = request.getParameter("gender");
			String userBirth = request.getParameter("userBirth");
			String skintype = request.getParameter("skintype");
		
			Member m = new Member(userName, userId, userPwd, "C");
			Customer c = new Customer(0, email, userBirth, skintype, gender, "icon_png");
			int result = new CustomerService().insertCustomer(m, c);
			if(result > 0) {
				response.sendRedirect("views/common/SignUpCustomer4.jsp");
				
			} else {
				RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
				request.setAttribute("msg", "회원가입에 실패하였습니다.");
				view.forward(request, response);
			}
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
