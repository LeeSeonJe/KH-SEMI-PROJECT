package cosmetic.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import cosmetic.model.dao.CosmeticDAO;
import cosmetic.model.vo.Cosmetic;

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

}
