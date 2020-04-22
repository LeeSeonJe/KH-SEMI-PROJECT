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

/**
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
		String rName = request.getParameter("rName");
		ArrayList<CosTalk> rMember = new CosTalkService().searchMember(rName);
	//	for(CosTalk CT : rMember) {
			/*
			System.out.println("-------------------------------------");
			System.out.println("수신자 일련번호 : " + CT.getrMember_no());
			System.out.println("수신자 아이디 : " + CT.getrMember_id());
			System.out.println("수신자 이름 : " + CT.getrMember_name());
			System.out.println("-------------------------------------");
			*/
			
	//	}
		
		
		//서버로 데이터 보내기
		HttpSession session = request.getSession();
		Member m = (Member) session.getAttribute("loginUser");
		String sUserId = m.getUser_id();
		String sUserName = m.getUser_name();
		int sUserNo = m.getUser_no();
		String sMessage = request.getParameter("sMessage");
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy년 MM월dd일 HH시mm분ss초");
		String sTime = format1.format(System.currentTimeMillis());
	
		String rMNum = request.getParameter("rMNum");
		
		if(sMessage == null) {
			
		}else {
			System.out.println("-------------------------------------");
			System.out.println("수신자 일련번호 : " + rMNum);
			System.out.println("-------------------------------------");
			System.out.println("발신자 일련번호 : " + sUserNo);
			System.out.println("발신자 아이디 : " + sUserId);
			System.out.println("발신자 이름 : " + sUserName);
			System.out.println("발신 시각 : " + sTime);
			System.out.println("발신 내용 : " + sMessage);
			System.out.println("-------------------------------------");
			System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
		
		}
		
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
