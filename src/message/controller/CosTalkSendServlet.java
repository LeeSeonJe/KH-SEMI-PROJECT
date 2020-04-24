package message.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import member.model.vo.Member;
import message.model.service.CosTalkService;
import message.model.vo.CosTalk;

/**ㄹㄹ
 * Servlet implementation class CosTalkSendServlet
 */
@WebServlet("/CosTalkSendServlet")
public class CosTalkSendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CosTalkSendServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		//채팅 추가하기
	

		
		//서버로 데이터 보내기
		HttpSession session = request.getSession();
		Member m = (Member) session.getAttribute("loginUser");
		int sUserNo = m.getUser_no();
		String sMessage = request.getParameter("sMessage");
		String rMNum = request.getParameter("rMNum");
		
		new CosTalkService().getUserNo(rMNum);
		
		
		
		CosTalk cosTalk = new CosTalk(0, sMessage, null, null, sUserNo, Integer.parseInt(rMNum));
		int result = new CosTalkService().sendMessage(cosTalk);
		if(result > 0) {
			ArrayList<CosTalk> list = new CosTalkService().sendAfterSelect(sUserNo, Integer.parseInt(rMNum));
			if(list !=null) {
				response.setContentType("application/json; charset=UTF-8");
				new Gson().toJson(list, response.getWriter());
			}
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
