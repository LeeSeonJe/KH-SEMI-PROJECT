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

import common.CustomerFileRenamePolicy;
import customer.model.service.CustomerService;
import customer.model.vo.MyPageCustomer;

/**
 * Servlet implementation class MyPageUpdateServlet
 */
@WebServlet("/update.me")
public class MyPageUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int result = 0;
		if(ServletFileUpload.isMultipartContent(request)) {
			System.out.println("1");
			int maxSize = 1024 * 1024 * 10;
			String root = request.getSession().getServletContext().getRealPath("/");
			String savePath = root + "member_images/";
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new CustomerFileRenamePolicy());
			String stand = multiRequest.getParameter("stand");
			if(stand.equals("up")) {
				String saveFile = null;
				Enumeration<String> files = multiRequest.getFileNames();
				while(files.hasMoreElements()) {
					String name = files.nextElement();
					
					if(multiRequest.getFilesystemName(name) != null) {
						saveFile = multiRequest.getFilesystemName(name);
					}
				}
				String userNo = multiRequest.getParameter("userNo");
				String skinType = multiRequest.getParameter("skinType");
				System.out.println(skinType);
				MyPageCustomer mpc = new MyPageCustomer(userNo, skinType, saveFile);
				
				result = new CustomerService().updateCustomer(mpc);
				
			} else if(stand.equals("basic")) {
				System.out.println("2");
				String userNo = multiRequest.getParameter("userNo");
				String skinType = multiRequest.getParameter("skinType");
				result = new CustomerService().updateBasicCustomer(userNo, skinType);
				
			} else {				
				System.out.println("3");
				String userNo = multiRequest.getParameter("userNo");
				String skinType = multiRequest.getParameter("skinType");
				result = new CustomerService().updateSkinTypeCustomer(userNo, skinType);
			}
		}
		
		if(result > 0) {
			response.sendRedirect("/COSMEDIC/mypage.me");
		} else {
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			request.setAttribute("msg", "회원가입에 실패하였습니다.");
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
