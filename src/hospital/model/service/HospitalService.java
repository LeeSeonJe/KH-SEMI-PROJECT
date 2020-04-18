package hospital.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

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

	public Hospital detailHospital(String hosName) {
		Connection conn = getConnection();
		Hospital h = new HospitalDAO().detailHospital(conn, hosName);
		close(conn);
		return h;
	}

	public String selectProfile(int user_no) {
		Connection conn = getConnection();
		
		String profile = new HospitalDAO().selectProfile(conn, user_no);
		close(conn);
		return profile;
	}

	public int selectHosNo(String hos_name) {
		Connection conn = getConnection();
		
		int user_no = new HospitalDAO().selectHosNo(conn, hos_name);
		close(conn);
		return user_no;
	}

}
