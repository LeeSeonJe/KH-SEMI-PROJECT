package review.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import member.model.vo.Member;
import review.model.vo.Review;
import review.model.service.ReviewService;
import review.model.vo.AddFile;

/**
 * Servlet implementation class ReqInsertServlet
 */
@WebServlet("/insert.req")
public class ReqInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReqInsertServlet() {
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
			String savePath = root + "AddFile/";
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
			
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
			
			String content = multiRequest.getParameter("content");
			HttpSession session = request.getSession();
			Member loginUser = (Member)session.getAttribute("loginUser");
			int user_no = ((Member)request.getSession().getAttribute("loginUser")).getUser_no();
			
//			======================================================================
//			db로 보낼 data
			Review r = new Review();
			r.setContent(content);
			r.setUser_no(user_no);
			
			ArrayList<AddFile> fileList = new ArrayList<AddFile>();
			for(int i = originFiles.size() -1; i >=0; i--) {
				AddFile af = new AddFile();
				af.setFile_path(savePath);
				af.setOrigin_name(originFiles.get(i));
				af.setChange_name(saveFiles.get(i));

				fileList.add(af);
			}
			
			int result = new ReviewService().insertReq(r, fileList);
			
//			AddFile af = new AddFile();
//			af.setOrigin_name(multiRequest.getOriginalFileName("req_img"));
//			af.setChange_name(multiRequest.getFilesystemName("req_img"));
//			af.setFile_path(savePath);
		//	System.out.println("ReqInsertServlet af : " + af);
			

			
//			if(result > 0) {
//				response.sendRedirect("");
//			}

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
