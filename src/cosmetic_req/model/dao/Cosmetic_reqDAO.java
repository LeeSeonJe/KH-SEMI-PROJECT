package cosmetic_req.model.dao;

import static common.JDBCTemplate.*;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import cosmetic.model.vo.Cosmetic;

public class Cosmetic_reqDAO {

	private Properties prop = new Properties();

	public Cosmetic_reqDAO() {
		String fileName = Cosmetic_reqDAO.class.getResource("/sql/cosmetic/cosmetic-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int insertCos(Connection conn, Cosmetic c) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertCos");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, c.getCosmetic_name());
			pstmt.setString(2, c.getCosmetic_about());
			pstmt.setString(3, c.getVolume());
			pstmt.setString(4, c.getPrice());
			pstmt.setString(5, c.getBrand_name());
			pstmt.setString(6, c.getMiddle_no());
			pstmt.setString(7, c.getCosmetic_img());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
