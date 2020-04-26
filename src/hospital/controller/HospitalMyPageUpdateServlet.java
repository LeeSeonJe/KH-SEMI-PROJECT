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
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import common.CustomerFileRenamePolicy;
import hospital.model.service.HospitalService;
import hospital.model.vo.Hospital;
import member.model.vo.Member;

/**
 * Servlet implementation class HospitalMyPageUpdate
 */
@WebServlet("/hMyPage.up")
public class HospitalMyPageUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HospitalMyPageUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		if(ServletFileUpload.isMultipartContent(request)) {
			HttpSession session = request.getSession();
			Member m = (Member) session.getAttribute("loginUser");
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
			
			String imgs = new HospitalService().getHospitalImages(m.getUser_id());
			Hospital h = new Hospital();
			
			String about = multiRequest.getParameter("about");
			String[] hImgs = imgs.split(",");
			String nImgs = "";
			
			String first = multiRequest.getParameter("first");
			String second = multiRequest.getParameter("second");
			String third = multiRequest.getParameter("third");
			
			if (first.equals("first") && second.equals("") && third.equals("")) {
				hImgs[0] = saveFiles.get(0);
				nImgs = String.join(",", hImgs);
			} else if (first.equals("") && second.equals("second") && third.equals("")) {
				hImgs[1] = saveFiles.get(0);
				nImgs = String.join(",", hImgs);
			} else if (first.equals("") && second.equals("") && third.equals("third")) {
				hImgs[2] = saveFiles.get(0);
				nImgs = String.join(",", hImgs);
			} else if (first.equals("first") && second.equals("second") && third.equals("")) {
				hImgs[1] = saveFiles.get(0);
				hImgs[0] = saveFiles.get(1);
				nImgs = String.join(",", hImgs);
			} else if (first.equals("first") && second.equals("") && third.equals("third")) {
				hImgs[2] = saveFiles.get(0);
				hImgs[0] = saveFiles.get(1);
				nImgs = String.join(",", hImgs);
			} else if (first.equals("") && second.equals("second") && third.equals("third")) {
				hImgs[2] = saveFiles.get(0);
				hImgs[1] = saveFiles.get(1);
				nImgs = String.join(",", hImgs);
			} else if (first.equals("") && second.equals("") && third.equals("")){
				nImgs = String.join(",", hImgs);
			} else if (first.equals("first") && second.equals("second") && third.equals("third")) {
				hImgs[2] = saveFiles.get(0);
				hImgs[1] = saveFiles.get(1);
				hImgs[0] = saveFiles.get(2);
				nImgs = String.join(",", hImgs);
			}
			
			System.out.println(nImgs);
			h = new Hospital(m.getUser_no(), about, nImgs);
			int result = new HospitalService().HMyPageUpdate(h);
			if(result > 0) {
				response.sendRedirect("/COSMEDIC/mypage.hos");
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
