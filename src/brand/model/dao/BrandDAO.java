package brand.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import brand.model.vo.Brand;
import cosmetic.model.vo.Cosmetic;

public class BrandDAO {
	private Properties prop = new Properties();

	public BrandDAO() {
		String fileName = BrandDAO.class.getResource("/sql/brand/brand-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public ArrayList<Brand> selectBrandList(Connection conn, String brandFilter, String count) {
		String last = null;
		if (brandFilter != null) {
			switch (brandFilter) {
			case "가": last = "나"; break;
			case "나": last = "다"; break;
			case "다": last = "라"; break;
			case "라": last = "마"; break;
			case "마": last = "바"; break;
			case "바": last = "사"; break;
			case "사": last = "아"; break;
			case "아": last = "자"; break;
			case "자": last = "차"; break;
			case "차": last = "카"; break;
			case "카": last = "타"; break;
			case "타": last = "파"; break;
			case "파": last = "하"; break;
			}
		}
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Brand> list = new ArrayList<Brand>();
		try {
			if (brandFilter == null || brandFilter.equals("all")) {
				String query = prop.getProperty("selectBrandList");
				pstmt = conn.prepareStatement(query);
//				stmt = conn.createStatement();
				pstmt.setString(1, count);
				rset = pstmt.executeQuery();

				while (rset.next()) {
					list.add(new Brand(rset.getString("BRAND_NAME"), rset.getString("BRAND_IMG")));
				}
			} else if (brandFilter.equals("etc")) {
				String query = prop.getProperty("selectEtcList");
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, "하");
				pstmt.setString(2, count);
				rset = pstmt.executeQuery();
				while (rset.next()) {
					list.add(new Brand(rset.getString("BRAND_NAME"), rset.getString("BRAND_IMG")));
				}
			} else if (brandFilter.equals("하")) {
				String query = prop.getProperty("selectEndList");
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, brandFilter);
				pstmt.setString(2, count);
				rset = pstmt.executeQuery();

				while (rset.next()) {
					list.add(new Brand(rset.getString("BRAND_NAME"), rset.getString("BRAND_IMG")));
				}
			} else {
				String query = prop.getProperty("selectFilterList");
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, brandFilter);
				pstmt.setString(2, last);
				pstmt.setString(3, count);
				rset = pstmt.executeQuery();

				while (rset.next()) {
					list.add(new Brand(rset.getString("BRAND_NAME"), rset.getString("BRAND_IMG")));
				}
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

	public ArrayList<Cosmetic> brandDetailList(Connection conn, String bname) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Cosmetic> cList = new ArrayList<Cosmetic>();

		String query = prop.getProperty("selectBrandDetailList");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, bname);
			rset = pstmt.executeQuery();
			
			while (rset.next()) {
				cList.add(new Cosmetic(rset.getInt("COSMETIC_NO"), rset.getString("COSMETIC_NAME"),
						rset.getString("COSMETIC_ABOUT"), rset.getString("VOLUME"), rset.getString("PRICE"),
						rset.getInt("WEEK_RANK"), rset.getInt("LASTWEEK_RANK"), rset.getString("BRAND_NAME"),
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
}
