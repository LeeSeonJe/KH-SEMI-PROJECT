package hospital.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import static common.JDBCTemplate.*;
import customer.model.dao.CustomerDAO;
import hospital.model.dao.HospitalDAO;
import hospital.model.vo.Hospital;
import member.model.dao.MemberDAO;
import member.model.vo.Member;

public class HospitalService {

	public int insertHospital(Member m, Hospital h) {
		Connection conn = getConnection();
		
		int result1 = new MemberDAO().insertMember(conn, m);
		int result2 = new HospitalDAO().insertMember(conn, h);
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result1;
	}

	public ArrayList<Hospital> selectHospitalList(String hospitalFilter) {
		Connection conn = getConnection();
		ArrayList<Hospital> list = new HospitalDAO().selectHospitalList(conn, hospitalFilter);
		close(conn);
		return list;
	}

	public ArrayList<Hospital> searchAddress(String sidoCd, String sggu, String dong) {
		Connection conn = getConnection();
		ArrayList<Hospital> list = new HospitalDAO().searchAddress(conn, sidoCd, sggu, dong);
		close(conn);
		return list;
	}

}
