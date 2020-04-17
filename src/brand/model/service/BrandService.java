package brand.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import brand.model.dao.BrandDAO;
import brand.model.vo.Brand;
import cosmetic.model.vo.Cosmetic;

public class BrandService {
	
	public ArrayList<Brand> selectBrnadList(String brandFilter, String count) {
		Connection conn = getConnection();
		ArrayList<Brand> list = new BrandDAO().selectBrandList(conn, brandFilter, count);
		close(conn);
		return list;
	}

	public ArrayList<Cosmetic> brandDetailList(String bname) {
		Connection conn = getConnection();
		ArrayList<Cosmetic> rList = new BrandDAO().rSelectBrandDetailList(conn, bname);
		ArrayList<Cosmetic> nrList = new BrandDAO().nrSelectBrandDetailList(conn, bname);
		ArrayList<Cosmetic> list = new ArrayList<Cosmetic>();
		list.addAll(rList);
		list.addAll(nrList);
		close(conn);
		return list;
	}
}
