package cosmetic.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import common.AgeCalculator;
import cosmetic.model.vo.Cosmetic;
import cosmetic.model.vo.CosmeticReviewList;

public class CosmeticDAO {
	Properties prop = new Properties();

	public CosmeticDAO() {
		String fileName = CosmeticDAO.class.getResource("/sql/cosmetic/cosmetic-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Cosmetic> selectCosmeticList(Connection conn, String cos_middle_no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectCosmeticList");
		ArrayList<Cosmetic> cList = new ArrayList<Cosmetic>();
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, cos_middle_no);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				cList.add(new Cosmetic(rset.getInt("COSMETIC_NO"), rset.getString("COSMETIC_NAME"),
						rset.getString("COSMETIC_ABOUT"), rset.getString("VOLUME"), rset.getString("PRICE"),
						rset.getInt("COUNT"), rset.getInt("AVG"), rset.getString("BRAND_NAME"),
						rset.getString("MIDDLE_NO"), rset.getString("COSMETIC_IMG")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return cList;
	}

	public String cosMiddleName(Connection conn, String cos_middle_no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String middleName = null;

		String query = prop.getProperty("cosMiddleName");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, cos_middle_no);
			rset = pstmt.executeQuery();

			if (rset.next()) {
				middleName = rset.getString(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return middleName;
	}

	public Cosmetic selectCosmeticDetail(Connection conn, String cosName) {
		// TODO Auto-generated method stub

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Cosmetic c = null;

		String query = prop.getProperty("selectCosmeticDetail");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, cosName);
			rset = pstmt.executeQuery();

			if (rset.next()) {
				c = new Cosmetic(rset.getInt("COSMETIC_NO"), rset.getString("COSMETIC_NAME"),
						rset.getString("COSMETIC_ABOUT"), rset.getString("VOLUME"), rset.getString("PRICE"),
						rset.getInt("COUNT"), rset.getInt("AVG"), rset.getString("BRAND_NAME"),
						rset.getString("MIDDLE_NO"), rset.getString("COSMETIC_IMG"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return c;
	}

	public String cosmeticBrand(Connection conn, String cosName) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String bImg = null;
		String query = prop.getProperty("cosmeticBrand");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, cosName);
			rset = pstmt.executeQuery();

			if (rset.next()) {
				bImg = rset.getString(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return bImg;
	}

	public String selectCosmeticCategory(Connection conn, String middleCategory) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String result = "";

		String query = prop.getProperty("selectCosmeticCategor");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, middleCategory);
			rset = pstmt.executeQuery();

			if (rset.next()) {
				result = rset.getString(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}

	public ArrayList<Cosmetic> selectCosmeticSearchList(Connection conn, String result, String findInput) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Cosmetic> list = new ArrayList<Cosmetic>();

		String query = prop.getProperty("selectCosmeticSearchList");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, result);
			pstmt.setString(2, findInput);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new Cosmetic(rset.getInt("COSMETIC_NO"), rset.getString("COSMETIC_NAME"),
						rset.getString("COSMETIC_ABOUT"), rset.getString("VOLUME"), rset.getString("PRICE"),
						rset.getInt("COUNT"), rset.getInt("AVG"), rset.getString("BRAND_NAME"),
						rset.getString("MIDDLE_NO"), rset.getString("COSMETIC_IMG")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}

	public ArrayList<CosmeticReviewList> cosmeticReviewList(Connection conn, String cosName) {
//		SELECT USER_NAME, BOARD_TITLE, BOARD_CONTENT, BOARD_DATE, 
//		FROM COSMETIC
//		JOIN COSMETIC_REVIEW USING (COSMETIC_NO)
//		JOIN BOARD ON (BOARD_NO = COS_REVIEW_NO)
//		JOIN MEMBER USING (USER_NO)
//		WHERE COSMETIC_NAME = ?;

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<CosmeticReviewList> rList = new ArrayList<CosmeticReviewList>();
		String query = prop.getProperty("CosmeticReviewList");
		AgeCalculator ac = new AgeCalculator();
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, cosName);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				String profile_image = rset.getString("PROFILE_IMAGE");
				String user_name = rset.getString("USER_NAME");
				String age = rset.getString("AGE");
				age = ac.ageCal(age);
				String skinType = rset.getString("SKINTYPE");
				String gender = rset.getString("GENDER");
				String board_title = rset.getString("BOARD_TITLE");
				String board_content = rset.getString("BOARD_CONTENT");
				Date board_date = rset.getDate("BOARD_DATE");
				rList.add(new CosmeticReviewList(profile_image, user_name, age, skinType, gender, board_title,
						board_content, board_date));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return rList;
	}

	public double[] ReviewCountAvg(Connection conn, String cosName) {
//		SELECT COUNT(*) AS REVIEW_COUNT, ROUND(AVG(REVIEW_HEART),2) AS REVIEW_AVG
//		FROM COSMETIC
//		JOIN COSMETIC_REVIEW USING (COSMETIC_NO)
//		JOIN REVIEW ON (COS_REVIEW_NO = REVIEW_NO)
//		WHERE COSMETIC_NAME = ?;

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("ReviewCountAvg");
		double[] rca = new double[2];

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, cosName);
			rset = pstmt.executeQuery();

			if (rset.next()) {
				String count = rset.getString("REVIEW_COUNT");
				String avg = rset.getString("REVIEW_AVG");
				System.out.println(avg);
				rca[0] = Integer.parseInt(count);
				if (avg == null) {
					rca[1] = 0;
				} else {
					rca[1] = Double.parseDouble(avg);
					System.out.println(rca[1]);
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return rca;
	}
}
