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
		ArrayList<Cosmetic> rlist = new CosmeticDAO().rSelectCosmeticList(conn, cos_middle_no);
		ArrayList<Cosmetic> nrlist = new CosmeticDAO().nrSelectCosmeticList(conn, cos_middle_no);
		ArrayList<Cosmetic> list = new ArrayList<Cosmetic>();
		list.addAll(rlist);
		list.addAll(nrlist);
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

	public ArrayList<CosmeticReviewList> cosReviewFilter(String query) {
		Connection conn = getConnection();
		ArrayList<CosmeticReviewList> rList = new CosmeticDAO().cosReviewFilter(conn, query);
		close(conn);
		return rList;
	}

	public ArrayList<Cosmetic> ajaxSelectCosmeticList(String middleName) {
		Connection conn = getConnection();
		String cos_middle_no = new CosmeticDAO().getCos_middle_no(conn, middleName);
		ArrayList<Cosmetic> rlist = new CosmeticDAO().rSelectCosmeticList(conn, cos_middle_no);
		ArrayList<Cosmetic> nrlist = new CosmeticDAO().nrSelectCosmeticList(conn, cos_middle_no);
		ArrayList<Cosmetic> list = new ArrayList<Cosmetic>();
		list.addAll(rlist);
		list.addAll(nrlist);
		close(conn);
		return list;
	}

	public String getCos_Middle_no(String middleCategory) {
		Connection conn = getConnection();
		String middle_no = new CosmeticDAO().getCos_middle_no(conn, middleCategory);
		close(conn);
		return middle_no;
	}

	public ArrayList<Cosmetic> cosRankFilter(String last) {
		Connection conn = getConnection();
		ArrayList<Cosmetic> rList = new CosmeticDAO().cosRankFilter(conn, last);
		close(conn);
		return rList;
	}

}
