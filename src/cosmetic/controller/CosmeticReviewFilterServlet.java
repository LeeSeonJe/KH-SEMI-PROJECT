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
import cosmetic.model.vo.CosmeticReviewList;

/**
 * Servlet implementation class CosmeticReviewFilterServlet
 */
@WebServlet("/cosReview.ft")
public class CosmeticReviewFilterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CosmeticReviewFilterServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String cosName = request.getParameter("cosName");
		String gender = request.getParameter("gender");
		String[] ageFilter = request.getParameterValues("ageFilter[]");
		String[] skinTypeFilter = request.getParameterValues("skinTypeFilter[]");

		System.out.println(cosName);
		System.out.println(gender);
		for (String a : ageFilter) {
			System.out.print(a + " ");
		}
		System.out.println();
		for (String s : skinTypeFilter) {
			System.out.print(s + " ");
		}

//		select * from reviewall
//		where
//		cosmetic_name = '블랑 엑스퍼트 얼티메이트 화이트닝 뷰티 로션 모이스트' and
//		gender = '남성' and (
//		age between 10 and 19 
//		or age between 20 and 24 
//		or age between 25 and 29
//		or age between 30 and 34 
//		or age between 35 and 39 
//		or age between 40 and 99
//		or skintype ='건성'
//		or skintype ='복합성'
//		or skintype ='지성'
//		or skintype ='민감성'
//		or skintype ='중성');

		
		// 생각을 잘못해서 완전 복잡하게 되었다....ㅈㅅ
		ArrayList<CosmeticReviewList> rList = null;
		String query = "";
		String start = "and (";
		String end = ")";
		int count = 0;
		if (gender.equalsIgnoreCase("ALL") && ageFilter[0].equalsIgnoreCase("ALL")
				&& skinTypeFilter[0].equalsIgnoreCase("all")) {
			query = "select * from reviewall where cosmetic_name = '" + cosName + "'" + "ORDER BY BOARD_DATE DESC";
			rList = new CosmeticService().cosReviewFilter(query);
		} else if (gender.equalsIgnoreCase("ALL") && ageFilter[0].equalsIgnoreCase("ALL")) {
			for (int i = 0; i < skinTypeFilter.length; i++) {
				if (skinTypeFilter.length == 1) {
					start += "skintype = '" + skinTypeFilter[i] + "'" + end;
				} else if (i == 0) {
					start += "skintype = '" + skinTypeFilter[i] + "'";
				} else {
					if (skinTypeFilter.length - 1 == i) {
						start += "or skintype ='" + skinTypeFilter[i] + "'" + end;
					} else {
						start += "or skintype ='" + skinTypeFilter[i] + "'";
					}
				}
			}
			System.out.println(start);
			query = "select * from reviewall where cosmetic_name = '" + cosName + "'" + start + "ORDER BY BOARD_DATE DESC";
			System.out.println(query);
			rList = new CosmeticService().cosReviewFilter(query);
		} else if (gender.equalsIgnoreCase("ALL") && skinTypeFilter[0].equalsIgnoreCase("ALL")) {
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
					start += "age between '" + range[j] + "' and '" + range[j + 1] + "'" + end;
				} else if (j == 0) {
					start += "age between '" + range[j] + "' and '" + range[j + 1] + "'";
				} else {
					if (range.length - 2 == j) {
						start += "or age between '" + range[j] + "' and '" + range[j + 1] + "'" + end;
					} else {
						start += "or age between '" + range[j] + "' and '" + range[j + 1] + "'";
					}
				}
			}
			query = "select * from reviewall where cosmetic_name = '" + cosName + "'" + start + "ORDER BY BOARD_DATE DESC";
			System.out.println(query);
			rList = new CosmeticService().cosReviewFilter(query);
		} else if (gender.equalsIgnoreCase("ALL")) {
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
					start += "age between '" + range[j] + "' and '" + range[j + 1] + "'" + end;
				} else if (j == 0) {
					start += "age between '" + range[j] + "' and '" + range[j + 1] + "'";
				} else {
					if (range.length - 2 == j) {
						start += " or age between '" + range[j] + "' and '" + range[j + 1] + "'" + end;
					} else {
						start += " or age between '" + range[j] + "' and '" + range[j + 1] + "'";
					}
				}
			}
			for (int i = 0; i < skinTypeFilter.length; i++) {
				if (skinTypeFilter.length == 1) {
					start += " and (skintype = '" + skinTypeFilter[i] + "'" + end;
				} else if (i == 0) {
					start += " and (skintype = '" + skinTypeFilter[i] + "'";
				} else {
					if (skinTypeFilter.length - 1 == i) {
						start += " or skintype ='" + skinTypeFilter[i] + "'" + end;
					} else {
						start += " or skintype ='" + skinTypeFilter[i] + "'";
					}
				}
			}
			query = "select * from reviewall where cosmetic_name = '" + cosName + "'" + start + "ORDER BY BOARD_DATE DESC";
			System.out.println(query);
			rList = new CosmeticService().cosReviewFilter(query);
		} else {
			if (gender.equalsIgnoreCase("여성") && skinTypeFilter[0].equalsIgnoreCase("ALL")
					&& ageFilter[0].equalsIgnoreCase("ALL")) {
				query = "select * from reviewall where cosmetic_name = '" + cosName + "' and gender='여성'";
				System.out.println(query);
				rList = new CosmeticService().cosReviewFilter(query);
			} else if (gender.equalsIgnoreCase("여성") && skinTypeFilter[0].equalsIgnoreCase("ALL")) {
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
						start += "age between '" + range[j] + "' and '" + range[j + 1] + "'" + end;
					} else if (j == 0) {
						start += "age between '" + range[j] + "' and '" + range[j + 1] + "'";
					} else {
						if (range.length - 2 == j) {
							start += "or age between '" + range[j] + "' and '" + range[j + 1] + "'" + end;
						} else {
							start += "or age between '" + range[j] + "' and '" + range[j + 1] + "'";
						}
					}
				}
				query = "select * from reviewall where cosmetic_name = '" + cosName + "' and gender='여성'" + start + "ORDER BY BOARD_DATE DESC";
				System.out.println(query);
				rList = new CosmeticService().cosReviewFilter(query);
			} else if (gender.equalsIgnoreCase("여성") && ageFilter[0].equalsIgnoreCase("ALL")) {
				for (int i = 0; i < skinTypeFilter.length; i++) {
					if (skinTypeFilter.length == 1) {
						start += "skintype = '" + skinTypeFilter[i] + "'" + end;
					} else if (i == 0) {
						start += "skintype = '" + skinTypeFilter[i] + "'";
					} else {
						if (skinTypeFilter.length - 1 == i) {
							start += "or skintype ='" + skinTypeFilter[i] + "'" + end;
						} else {
							start += "or skintype ='" + skinTypeFilter[i] + "'";
						}
					}
				}
				query = "select * from reviewall where cosmetic_name = '" + cosName + "' and gender='여성'" + start + "ORDER BY BOARD_DATE DESC";
				System.out.println(query);
				rList = new CosmeticService().cosReviewFilter(query);
			} else if (gender.equalsIgnoreCase("남성") && ageFilter[0].equalsIgnoreCase("ALL")
					&& skinTypeFilter[0].equalsIgnoreCase("ALL")) {
				query = "select * from reviewall where cosmetic_name = '" + cosName + "' and gender='남성'";
				System.out.println(query);
				rList = new CosmeticService().cosReviewFilter(query);
			} else if (gender.equalsIgnoreCase("남성") && skinTypeFilter[0].equalsIgnoreCase("ALL")) {
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
						start += "age between '" + range[j] + "' and '" + range[j + 1] + "'" + end;
					} else if (j == 0) {
						start += "age between '" + range[j] + "' and '" + range[j + 1] + "'";
					} else {
						if (range.length - 2 == j) {
							start += "or age between '" + range[j] + "' and '" + range[j + 1] + "'" + end;
						} else {
							start += "or age between '" + range[j] + "' and '" + range[j + 1] + "'";
						}
					}
				}
				query = "select * from reviewall where cosmetic_name = '" + cosName + "' and gender='남성'" + start + "ORDER BY BOARD_DATE DESC";
				System.out.println(query);
				rList = new CosmeticService().cosReviewFilter(query);
			} else if (gender.equalsIgnoreCase("남성") && ageFilter[0].equalsIgnoreCase("ALL")) {
				for (int i = 0; i < skinTypeFilter.length; i++) {
					if (skinTypeFilter.length == 1) {
						start += "skintype = '" + skinTypeFilter[i] + "'" + end;
					} else if (i == 0) {
						start += "skintype = '" + skinTypeFilter[i] + "'";
					} else {
						if (skinTypeFilter.length - 1 == i) {
							start += "or skintype ='" + skinTypeFilter[i] + "'" + end;
						} else {
							start += "or skintype ='" + skinTypeFilter[i] + "'";
						}
					}
				}
				query = "select * from reviewall where cosmetic_name = '" + cosName + "' and gender='남성'" + start + "ORDER BY BOARD_DATE DESC";
				System.out.println(query);
				rList = new CosmeticService().cosReviewFilter(query);
			} else if (gender.equalsIgnoreCase("여성")) {
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
						start += "age between '" + range[j] + "' and '" + range[j + 1] + "'" + end;
					} else if (j == 0) {
						start += "age between '" + range[j] + "' and '" + range[j + 1] + "'";
					} else {
						if (range.length - 2 == j) {
							start += " or age between '" + range[j] + "' and '" + range[j + 1] + "'" + end;
						} else {
							start += " or age between '" + range[j] + "' and '" + range[j + 1] + "'";
						}
					}
				}
				for (int i = 0; i < skinTypeFilter.length; i++) {
					if (skinTypeFilter.length == 1) {
						start += " and (skintype = '" + skinTypeFilter[i] + "'" + end;
					} else if (i == 0) {
						start += " and (skintype = '" + skinTypeFilter[i] + "'";
					} else {
						if (skinTypeFilter.length - 1 == i) {
							start += " or skintype ='" + skinTypeFilter[i] + "'" + end;
						} else {
							start += " or skintype ='" + skinTypeFilter[i] + "'";
						}
					}
				}
				query = "select * from reviewall where cosmetic_name = '" + cosName + "' and gender='여성'" + start + "ORDER BY BOARD_DATE DESC";
				System.out.println(query);
				rList = new CosmeticService().cosReviewFilter(query);
			} else if (gender.equalsIgnoreCase("남성")) {
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
						start += "age between '" + range[j] + "' and '" + range[j + 1] + "'" + end;
					} else if (j == 0) {
						start += "age between '" + range[j] + "' and '" + range[j + 1] + "'";
					} else {
						if (range.length - 2 == j) {
							start += " or age between '" + range[j] + "' and '" + range[j + 1] + "'" + end;
						} else {
							start += " or age between '" + range[j] + "' and '" + range[j + 1] + "'";
						}
					}
				}
				for (int i = 0; i < skinTypeFilter.length; i++) {
					if (skinTypeFilter.length == 1) {
						start += " and (skintype = '" + skinTypeFilter[i] + "'" + end;
					} else if (i == 0) {
						start += " and (skintype = '" + skinTypeFilter[i] + "'";
					} else {
						if (skinTypeFilter.length - 1 == i) {
							start += " or skintype ='" + skinTypeFilter[i] + "'" + end;
						} else {
							start += " or skintype ='" + skinTypeFilter[i] + "'";
						}
					}
				}
				query = "select * from reviewall where cosmetic_name = '" + cosName + "' and gender='남성' " + start + "ORDER BY BOARD_DATE DESC";
				System.out.println(query);
				rList = new CosmeticService().cosReviewFilter(query);
			}
		}

		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(rList, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
