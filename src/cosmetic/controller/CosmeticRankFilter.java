package cosmetic.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import cosmetic.model.service.CosmeticService;
import cosmetic.model.vo.Cosmetic;
import cosmetic.model.vo.CosmeticReviewList;

/**
 * Servlet implementation class CosmeticRankFilter
 */
@WebServlet("/cosRank.ft")
public class CosmeticRankFilter extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CosmeticRankFilter() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String middleCategory = request.getParameter("middleCategory");
		String gender = request.getParameter("gender");
		String[] ageFilter = request.getParameterValues("ageFilter[]");
		String[] skinTypeFilter = request.getParameterValues("skinTypeFilter[]");
		
		String middle_no = new CosmeticService().getCos_Middle_no(middleCategory);
		
		
//		SELECT COSMETIC_NO, COSMETIC_NAME, COSMETIC_ABOUT, VOLUME, PRICE, COUNT(REVIEW_NO) AS COUNT, ROUND(AVG(REVIEW_HEART),2) AS AVG, BRAND_NAME, MIDDLE_NO, COSMETIC_IMG,
//		(COUNT(REVIEW_NO) / 
//		(SELECT COUNT(REVIEW_NO) AS REVIEW_COUNT
//		FROM COSMETIC
//		LEFT OUTER JOIN COSMETIC_REVIEW USING (COSMETIC_NO)
//		LEFT OUTER JOIN REVIEW ON (COS_REVIEW_NO = REVIEW_NO)
//		WHERE COSMETIC_NAME IN (SELECT COSMETIC_NAME
//		FROM COSMETIC) AND MIDDLE_NO = 1) * 
//		ROUND(AVG(REVIEW_HEART),2)) AS RANK
//		    FROM COSMETIC
//		    LEFT OUTER JOIN COSMETIC_REVIEW USING (COSMETIC_NO)
//		    LEFT OUTER JOIN REVIEW ON (COS_REVIEW_NO = REVIEW_NO)
//		    LEFT OUTER JOIN BOARD ON (BOARD_NO = COS_REVIEW_NO)
//		    LEFT OUTER JOIN MEMBER USING (USER_NO)
//		    LEFT OUTER JOIN CUSTOMER ON (CUSTOMER_NO = USER_NO)
//		WHERE COSMETIC_NAME IN (SELECT COSMETIC_NAME
//		                        FROM COSMETIC
//		                        WHERE  MIDDLE_NO = 1)
//		AND REVIEW_DEL_YN = 'N'
//		AND GENDER = '남성'
//		and (((EXTRACT(YEAR FROM SYSDATE) - case when SUBSTR(age,0,2)>SUBSTR(SYSDATE,0,2) 
//		        then concat('19', SUBSTR(age,0,2))
//		        else concat('20', SUBSTR(age,0,2))
//		        end)+1) between '20' and '24' or 
//		        ((EXTRACT(YEAR FROM SYSDATE) - case when SUBSTR(age,0,2)>SUBSTR(SYSDATE,0,2) 
//		        then concat('19', SUBSTR(age,0,2))
//		        else concat('20', SUBSTR(age,0,2))
//		        end)+1) between '25' and '29') 
//		and (skintype = '건성' or skintype ='민감성')
//
//		GROUP BY COSMETIC_NO, COSMETIC_NAME, COSMETIC_ABOUT, VOLUME, PRICE, BRAND_NAME, MIDDLE_NO, COSMETIC_IMG
//		ORDER BY RANK DESC;
		
		ArrayList<Cosmetic> rList = null;
		String calAge = "((EXTRACT(YEAR FROM SYSDATE) - case when SUBSTR(age,0,2)>SUBSTR(SYSDATE,0,2) then concat('19', SUBSTR(age,0,2)) else concat('20', SUBSTR(age,0,2)) end)+1)";
		
		String start1 = "and (";
		String start2 = "and (";
		String end1 = ")";
		String end2 = ")";
		
		String query = "SELECT COSMETIC_NO, COSMETIC_NAME, COSMETIC_ABOUT, VOLUME, PRICE, COUNT(REVIEW_NO) AS COUNT, ROUND(AVG(REVIEW_HEART),2) AS AVG, BRAND_NAME, MIDDLE_NO, COSMETIC_IMG, (COUNT(REVIEW_NO) /  (SELECT COUNT(REVIEW_NO) AS REVIEW_COUNT FROM COSMETIC LEFT OUTER JOIN COSMETIC_REVIEW USING (COSMETIC_NO) LEFT OUTER JOIN REVIEW ON (COS_REVIEW_NO = REVIEW_NO) WHERE COSMETIC_NAME IN (SELECT COSMETIC_NAME FROM COSMETIC) AND MIDDLE_NO = " + middle_no + ") *  ROUND(AVG(REVIEW_HEART),2)) AS RANK FROM COSMETIC LEFT OUTER JOIN COSMETIC_REVIEW USING (COSMETIC_NO) LEFT OUTER JOIN REVIEW ON (COS_REVIEW_NO = REVIEW_NO) LEFT OUTER JOIN BOARD ON (BOARD_NO = COS_REVIEW_NO) LEFT OUTER JOIN MEMBER USING (USER_NO) LEFT OUTER JOIN CUSTOMER ON (CUSTOMER_NO = USER_NO) WHERE COSMETIC_NAME IN (SELECT COSMETIC_NAME FROM COSMETIC WHERE  MIDDLE_NO = " + middle_no + ") AND REVIEW_DEL_YN = 'N'";
		String query2 = "GROUP BY COSMETIC_NO, COSMETIC_NAME, COSMETIC_ABOUT, VOLUME, PRICE, BRAND_NAME, MIDDLE_NO, COSMETIC_IMG ORDER BY RANK DESC";
		String last = "";
		for (int i = 0; i < skinTypeFilter.length; i++) {
			if (skinTypeFilter.length == 1) {
				start1 += "skintype = '" + skinTypeFilter[i] + "'" + end1;
			} else if (i == 0) {
				start1 += "skintype = '" + skinTypeFilter[i] + "'";
			} else {
				if (skinTypeFilter.length - 1 == i) {
					start1 += "or skintype ='" + skinTypeFilter[i] + "'" + end1;
				} else {
					start1 += "or skintype ='" + skinTypeFilter[i] + "'";
				}
			}
		}
		
		int count = 0;
		String[] range = new String[ageFilter.length * 2];
		for (int i = 0; i < ageFilter.length; i++) {
			if (ageFilter[i].equalsIgnoreCase("10대")) {
				range[count] = "10";
				count++;
				range[count] = "19";
				count++;
			} else if (ageFilter[i].equalsIgnoreCase("20대 초반")) {
				range[count] = "20";
				count++;
				range[count] = "24";
				count++;
			} else if (ageFilter[i].equalsIgnoreCase("20대 후반")) {
				range[count] = "25";
				count++;
				range[count] = "29";
				count++;
			} else if (ageFilter[i].equalsIgnoreCase("30대 초반")) {
				range[count] = "30";
				count++;
				range[count] = "34";
				count++;
			} else if (ageFilter[i].equalsIgnoreCase("30대 후반")) {
				range[count] = "35";
				count++;
				range[count] = "39";
				count++;
			} else {
				range[count] = "40";
				count++;
				range[count] = "99";
				count++;
			}
		}
		for (int j = 0; j < range.length; j = j + 2) {
			if (range.length == 2) {
				start2 += calAge + " between '" + range[j] + "' and '" + range[j + 1] + "'" + end2;
			} else if (j == 0) {
				start2 += calAge + " between '" + range[j] + "' and '" + range[j + 1] + "'";
			} else {
				if (range.length - 2 == j) {
					start2 += "or " + calAge + " between '" + range[j] + "' and '" + range[j + 1] + "'" + end2;
				} else {
					start2 += "or " + calAge + " between '" + range[j] + "' and '" + range[j + 1] + "'";
				}
			}
		}
		
//		System.out.println(query);
//		System.out.println(start1);
//		System.out.println(start2);
		
		if (gender.equalsIgnoreCase("ALL") && ageFilter[0].equalsIgnoreCase("ALL")
				&& skinTypeFilter[0].equalsIgnoreCase("all")) {
			last = query + query2;
			System.out.println(last);
		}else if (gender.equalsIgnoreCase("ALL") && ageFilter[0].equalsIgnoreCase("ALL")) {
			last = query + start1 + query2;
			System.out.println(last);
		}
		else if (gender.equalsIgnoreCase("ALL") && skinTypeFilter[0].equalsIgnoreCase("ALL")) {
			last = query + start2 + query2;
			System.out.println(last);
			
		} else if (gender.equalsIgnoreCase("ALL")) {
			last = query + start1 + start2 + query2;
			System.out.println(last);
		} else {
			if (gender.equalsIgnoreCase("여성") && skinTypeFilter[0].equalsIgnoreCase("ALL")
					&& ageFilter[0].equalsIgnoreCase("ALL")) {
				last = query + " and gender='여성' " + query2;
				System.out.println(last);
			} else if (gender.equalsIgnoreCase("여성") && skinTypeFilter[0].equalsIgnoreCase("ALL")) {
				last = query + " and gender='여성' " + start2 + query2;
				System.out.println(last);
			} else if (gender.equalsIgnoreCase("여성") && ageFilter[0].equalsIgnoreCase("ALL")) {
				last = query + " and gender='여성' " + start1 + query2;
				System.out.println(last);
			} else if (gender.equalsIgnoreCase("남성") && ageFilter[0].equalsIgnoreCase("ALL")
					&& skinTypeFilter[0].equalsIgnoreCase("ALL")) {
				last = query + " and gender='남성' " + query2;
				System.out.println(last);
			} else if (gender.equalsIgnoreCase("남성") && skinTypeFilter[0].equalsIgnoreCase("ALL")) {
				last = query + " and gender='남성' " + start2 + query2;
				System.out.println(last);
				
			} else if (gender.equalsIgnoreCase("남성") && ageFilter[0].equalsIgnoreCase("ALL")) {
				last = query + " and gender='남성' " + start1 + query2;
				System.out.println(last);
			} else if (gender.equalsIgnoreCase("여성")) {
				last = query + " and gender='여성' " + start1 + start2 + query2;
				System.out.println(last);
			} else if (gender.equalsIgnoreCase("남성")) {
				last = query + " and gender='남성' " + start1 + start2 + query2;
				System.out.println(last);
			}
		}
		rList = new CosmeticService().cosRankFilter(last);
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(rList, response.getWriter());
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
