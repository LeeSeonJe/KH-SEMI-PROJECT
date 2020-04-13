package common;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import member.model.service.MemberService;
import member.model.vo.Member;



/**
 * Servlet implementation class NaverLoginServlet
 */
@WebServlet("/naver.me")
public class NaverLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NaverLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
        String token = (String)session.getAttribute("access_token");// 네이버 로그인 접근 토큰;
        String header = "Bearer " + token; // Bearer 다음에 공백 추가
        try {
            String apiURL = "https://openapi.naver.com/v1/nid/me";
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("Authorization", header);
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            StringBuffer res = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
            	res.append(inputLine);
            }
            br.close();
            
            JSONParser parser = new JSONParser();
            JSONObject result = (JSONObject)parser.parse(res.toString());
            
            String id = (String)((JSONObject)result.get("response")).get("id");
            String email = (String)((JSONObject)result.get("response")).get("email");            
            String nickname = (String)((JSONObject)result.get("response")).get("nickname");
            
            Member loginUser = new MemberService().checkMember(id);
            
            if(loginUser != null) {
    			session.setAttribute("loginUser", loginUser);
    			session.setMaxInactiveInterval(600);
    			
    			response.sendRedirect(request.getContextPath());
            } else {
            	request.setAttribute("id", id);
            	request.setAttribute("emailSNS", email);
            	request.setAttribute("nickname", nickname);
            	RequestDispatcher view = request.getRequestDispatcher("views/common/SignUpCustomer3.jsp");
    			view.forward(request, response);
            }
        } catch (Exception e) {
            System.out.println(e);
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
