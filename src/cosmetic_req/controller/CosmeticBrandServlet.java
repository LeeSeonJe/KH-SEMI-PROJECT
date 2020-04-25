package cosmetic_req.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import brand.model.service.BrandService;
import brand.model.vo.Brand;
import common.CosReqFileRenamePolicy;

/**
 * Servlet implementation class CosmeticBrandServlet
 */
@WebServlet("/brandInsert.br")
public class CosmeticBrandServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CosmeticBrandServlet() {
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
			String savePath = root + "brandReq_uploadFiles/";
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new CosReqFileRenamePolicy());
		
			String saveFile = null;
			Enumeration<String> files = multiRequest.getFileNames();
			while(files.hasMoreElements()) {
				String name = files.nextElement();
				
				if(multiRequest.getFilesystemName(name) != null) {
					saveFile = multiRequest.getFilesystemName(name);
				}
			}
			
			String bname = multiRequest.getParameter("bname");
			
			Brand b = new Brand(bname, saveFile);
			int result = new BrandService().insertBrand(b);
			if(result > 0) {
				response.setContentType("text/html; charset=UTF-8");
				 
				PrintWriter out = response.getWriter();
				 			
				out.println("<script>");
				
				out.println("alert('브랜드 등록이 완료되었습니다.');");			
				out.println("self.close()");
				out.println("</script>");		 
				out.flush();
				out.close();
			} else {
				response.setContentType("text/html; charset=UTF-8");
				 
				PrintWriter out = response.getWriter();
				 			
				out.println("<script>");
				
				out.println("alert('브랜드 등록에 실패하였습니다.');");			
				out.println("self.close()");
				out.println("</script>");		 
				out.flush();
				out.close();
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
