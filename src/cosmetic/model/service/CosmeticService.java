package cosmetic.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import cosmetic.model.dao.CosmeticDAO;
import cosmetic.model.vo.Cosmetic;
import cosmetic.model.vo.CosmeticReviewList;

public class CosmeticService {

	public ArrayList<Cosmetic> selectCosmeticList(String cos_middle_no) {
		Connection conn = getConnection();
		ArrayList<Cosmetic> list = new CosmeticDAO().selectCosmeticList(conn, cos_middle_no);

		close(conn);
		return list;
	}

	public String cosMiddleName(String cos_middle_no) {
		// TODO Auto-generated method stub
		Connection conn = getConnection();
		String middleName = new CosmeticDAO().cosMiddleName(conn, cos_middle_no);
		close(conn);
		return middleName;
	}

	public Cosmetic selectCosmeticDetail(String cosName) {
		// TODO Auto-generated method stub
		Connection conn = getConnection();
		Cosmetic c = new CosmeticDAO().selectCosmeticDetail(conn, cosName);
		close(conn);
		return c;
	}

	public String cosmeticBrand(String cosName) {
		Connection conn = getConnection();
		String bImg = new CosmeticDAO().cosmeticBrand(conn, cosName);
		close(conn);
		return bImg;
	}

	public ArrayList<Cosmetic> selectCosmeticCategory(String middleCategory, String findInput) {
		Connection conn = getConnection();
		CosmeticDAO c = new CosmeticDAO();
		String result = c.selectCosmeticCategory(conn, middleCategory);
		ArrayList<Cosmetic> list = null;
		if (!result.equals("0") && findInput.equals("all")) {
			list = c.selectCosmeticList(conn, result);
		} else {
			list = c.selectCosmeticSearchList(conn, result, findInput);
		}
		close(conn);
		return list;
	}

	public ArrayList<CosmeticReviewList> cosmeticReviewList(String cosName) {
		// TODO Auto-generated method stub
		Connection conn = getConnection();
		ArrayList<CosmeticReviewList> rList = new CosmeticDAO().cosmeticReviewList(conn, cosName);
		close(conn);
		return rList;
	}

	public double[] ReviewCountAvg(String cosName) {
		// TODO Auto-generated method stub
		Connection conn = getConnection();
		double[] rca = new CosmeticDAO().ReviewCountAvg(conn, cosName);
		close(conn);
		return rca;
	}

}
