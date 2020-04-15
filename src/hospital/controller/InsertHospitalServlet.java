package hospital.controller;

import java.io.IOException;
import java.util.ArrayList;
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
import hospital.model.service.HospitalService;
import hospital.model.vo.Hospital;
import member.model.vo.Member;

/**
 * Servlet implementation class InsertHospitalServlet
 */
@WebServlet("/insertH.me")
public class InsertHospitalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertHospitalServlet() {
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
			String savePath = root + "hospital_images/";
			
			MultipartRequest multiRequest
				= new MultipartRequest(request, savePath, maxSize, "UTF-8", new CustomerFileRenamePolicy());
			
			ArrayList<String> saveFiles = new ArrayList<String>();
			ArrayList<String> originFiles = new ArrayList<String>();
			
			Enumeration<String> files = multiRequest.getFileNames();
			while(files.hasMoreElements()) {
				String name = files.nextElement();
				
				if(multiRequest.getFilesystemName(name) != null) {
					saveFiles.add(multiRequest.getFilesystemName(name));
					originFiles.add(multiRequest.getOriginalFileName(name));
				}
			}
		
			String id = multiRequest.getParameter("id");
			String name = multiRequest.getParameter("name");
			String pwd = multiRequest.getParameter("pwd");
			String email = multiRequest.getParameter("email");
			String tel1 = multiRequest.getParameter("tel1");
			String tel2 = multiRequest.getParameter("tel2");
			String tel3 = multiRequest.getParameter("tel3");
			String addressBasic = multiRequest.getParameter("addressBasic");
			String addressDetail = multiRequest.getParameter("addressDetail");
			String about = multiRequest.getParameter("about");
			String tel = tel1 + "-" + tel2 + "-" + tel3;
			String address = addressBasic + addressDetail;
			
			String images = "";
			
			Member m = new Member(name, id, pwd, "H");
			Hospital h = new Hospital(0, about, tel, address, null, 0, email);
			
			for(int i=originFiles.size()-1; i>=0; i--) {
				if(i==originFiles.size()-1) {
					h.setRegi(saveFiles.get(i));
				} else if (i==originFiles.size()-2){
					images += saveFiles.get(i);
				} else {
					images += "," + saveFiles.get(i);
				}
			}
			
			h.setHospital_img(images);
			
			int result = new HospitalService().insertHospital(m, h);
			if(result > 0) {
				response.sendRedirect("views/common/SignUpHospital4.jsp");
				
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
