package worry.controller;

import java.io.File;
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

import common.MyFileRenamePolicy;
import member.model.vo.Member;
import worry.model.service.WorryService;
import worry.model.vo.AddFile;
import worry.model.vo.Worry;

/**
 * Servlet implementation class updateWorryServlet
 */
@WebServlet("/worryUpdate.bo")
public class updateWorryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateWorryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("서블릿");
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024 * 1024 * 10; 
			String root = request.getSession().getServletContext().getRealPath("/");
			String savePath = root + "AddFile/";
			
			MultipartRequest multiRequest
			= new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
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
			
			String title = multiRequest.getParameter("title");
			String content = multiRequest.getParameter("content");
			int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUser_no();
			int worryNo = Integer.parseInt(multiRequest.getParameter("worryNo"));
			
			
			ArrayList<AddFile> fileList = new ArrayList<AddFile>();
			for(int i =originFiles.size() -1 ; i>= 0; i--) {
				AddFile af = new AddFile();
				af.setFilePath(savePath);
				af.setOriginName(originFiles.get(i));
				af.setChangeName(saveFiles.get(i));
				fileList.add(af);
			}

			int result = new WorryService().updateWorry(title, content, userNo, fileList, worryNo);
			
			if(result > 0) {
				System.out.println("성공");
				response.sendRedirect("worryDetail.bo?worryNo=" + worryNo);
			} else {
				System.out.println("실패");
				for(int i = 0 ; i < saveFiles.size(); i++) {
					File failedFile = new File(savePath + saveFiles.get(i));
					System.out.println(savePath);
					failedFile.delete();
				}
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
