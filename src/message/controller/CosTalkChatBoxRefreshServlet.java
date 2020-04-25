package message.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import member.model.vo.Member;
import message.model.service.CosTalkService;

/**
 * Servlet implementation class CosTalkChatBoxRefreshServlet
 */
@WebServlet("/CosTalkChatBoxRefreshServlet")
public class CosTalkChatBoxRefreshServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CosTalkChatBoxRefreshServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		Member m = (Member)session.getAttribute("loginUser");
		
		if(m == null) {
			
		}else {
			int sUserNo = m.getUser_no();
			
			
			ArrayList<message.model.vo.CosTalk> list = new CosTalkService().refreshHistory(sUserNo);
			
			ArrayList<Integer> arr = new ArrayList<>();
			for(int i=0; i<list.size(); i++) {
				if(list.get(i).getReception_no() != m.getUser_no()) {
					arr.add(list.get(i).getReception_no());
				}
			}
			
			
			
			ArrayList<message.model.vo.CosTalk> list2 = new CosTalkService().refreshChatBox(arr, sUserNo);
			
			response.setContentType("application/json; charset=UTF-8");
			new Gson().toJson(list2, response.getWriter());
		}
		
		//sUserNo를 받아오지 못해서 생기는 오류
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
