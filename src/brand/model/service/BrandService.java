package brand.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import brand.model.dao.BrandDAO;
import brand.model.vo.Brand;
import cosmetic.model.vo.Cosmetic;

public class BrandService {
	
	public ArrayList<Brand> selectBrnadList(String brandFilter) {
		Connection conn = getConnection();
		ArrayList<Brand> list = new BrandDAO().selectBrandList(conn, brandFilter);
		close(conn);
		return list;
	}

	public ArrayList<Cosmetic> brandDetailList(String bname) {
		Connection conn = getConnection();
		ArrayList<Cosmetic> cList = new BrandDAO().brandDetailList(conn, bname);
		close(conn);
		return cList;
	}
}
