package cosmetic.model.service;

import static common.JDBCTemplate.*;
import java.sql.Connection;
import java.util.ArrayList;

import cosmetic.model.dao.CosmeticDAO;
import cosmetic.model.vo.Cosmetic;

public class CosmeticService {

	public ArrayList<Cosmetic> selectCosmeticList(int cos_middle_no) {
		Connection conn = getConnection();
		ArrayList<Cosmetic> list = new CosmeticDAO().selectCosmeticList(conn, cos_middle_no);
		
		close(conn);
		return list;
	}

	public String cosMiddleName(int cos_middle_no) {
		// TODO Auto-generated method stub
		Connection conn = getConnection();
		String middleName = new CosmeticDAO().cosMiddleName(conn, cos_middle_no);
		close(conn);
		return middleName;
	}

}
