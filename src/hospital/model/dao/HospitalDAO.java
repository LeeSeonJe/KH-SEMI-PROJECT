package hospital.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import customer.model.dao.CustomerDAO;
import hospital.model.vo.Hospital;

public class HospitalDAO {
	
	private Properties prop = new Properties();
	
	public HospitalDAO() {
		String fileName = CustomerDAO.class.getResource("/sql/hospital/hospital-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int insertMember(Connection conn, Hospital h) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertHospital");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, h.getHospital_about());
			pstmt.setString(2, h.getTel());
			pstmt.setString(3, h.getAddress());
			pstmt.setString(4, h.getRegi());
			pstmt.setString(5, h.getHospital_img());
			pstmt.setString(6, h.getEmail());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
