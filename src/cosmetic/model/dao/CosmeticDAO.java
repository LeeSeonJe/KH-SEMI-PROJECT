package cosmetic.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import cosmetic.model.vo.Cosmetic;

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
						rset.getInt("WEEK_RANK"), rset.getInt("LASTWEEK_RANK"), rset.getString("BRAND_NAME"),
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
			
			if(rset.next()) {
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
}
