package cosmetic_req.controller;

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
import cosmetic.model.vo.Cosmetic;
import cosmetic_req.model.service.Cosmetic_reqService;

/**
 * Servlet implementation class CosmeticInsertServlet
 */
@WebServlet("/insert.cos")
public class CosmeticInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CosmeticInsertServlet() {
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
			String savePath = root + "cosReq_uploadFiles/";
			
			MultipartRequest multiRequest
				= new MultipartRequest(request, savePath, maxSize, "UTF-8", new CosReqFileRenamePolicy());
			
			String saveFile = null;
			Enumeration<String> files = multiRequest.getFileNames();
			while(files.hasMoreElements()) {
				String name = files.nextElement();
				
				if(multiRequest.getFilesystemName(name) != null) {
					saveFile = multiRequest.getFilesystemName(name);
				}
			}
			
			String brandName = multiRequest.getParameter("brandName");
			String middleCg = multiRequest.getParameter("middleCg");
			String name = multiRequest.getParameter("name");
			String content = multiRequest.getParameter("content");
			String volume = multiRequest.getParameter("volume");
			String price = multiRequest.getParameter("price");
			Cosmetic c = new Cosmetic();
			c.setBrand_name(brandName);
			c.setMiddle_no(middleCg);
			c.setCosmetic_name(name);
			c.setCosmetic_about(content);
			c.setVolume(volume);
			c.setPrice(price);
			c.setCosmetic_img(saveFile);
			
			int result = new Cosmetic_reqService().insertCos(c);
			
			String page = null;
			if(result > 0) {
				page = "views/admin/cosmeticReqPopup.jsp";
				request.setAttribute("result", result);
			} else {
				page = "views/common/errorPage.jsp";
				request.setAttribute("msg", "화장품 등록에 실패하였습니다.");
			}
			
			RequestDispatcher view = request.getRequestDispatcher(page);
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
