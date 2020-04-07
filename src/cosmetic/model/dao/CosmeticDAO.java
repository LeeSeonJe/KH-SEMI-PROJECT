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

	public ArrayList<Cosmetic> selectCosmeticList(Connection conn, int cos_middle_no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectCosmeticList");
		ArrayList<Cosmetic> cList = new ArrayList<Cosmetic>();
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, cos_middle_no);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				cList.add(new Cosmetic(rset.getInt("COSMETIC_NO"), rset.getString("COSMETIC_NAME"),
						rset.getString("COSMETIC_ABOUT"), rset.getString("VOLUME"), rset.getString("PRICE"),
						rset.getInt("WEEK_RANK"), rset.getInt("LASTWEEK_RANK"), rset.getString("BRAND_NAME"),
						rset.getInt("MIDDLE_NO"), rset.getString("COSMETIC_IMG")));
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

	public String cosMiddleName(Connection conn, int cos_middle_no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String middleName = null;
		
		String query = prop.getProperty("cosMiddleName");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, cos_middle_no);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
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
}
