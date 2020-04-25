package hospital.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.LinkedHashSet;

import hospital.model.dao.HospitalDAO;
import hospital.model.vo.Hospital;
import hospital.model.vo.HospitalReviewList;
import member.model.dao.MemberDAO;
import member.model.vo.Member;

public class HospitalService {

	public int insertHospital(Member m, Hospital h) {
		Connection conn = getConnection();

		int result1 = new MemberDAO().insertMember(conn, m);
		int result2 = new HospitalDAO().insertMember(conn, h);

		if (result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return result1;
	}

	public ArrayList<Hospital> selectHospitalList(String hospitalFilter) {
		Connection conn = getConnection();
		ArrayList<Hospital> list = new ArrayList<Hospital>();
		if(hospitalFilter != null && hospitalFilter.equals("답변 많은 순")) {
			ArrayList<Hospital> rlist = new HospitalDAO().selectHospitalList(conn, hospitalFilter);
			close(conn);
			return rlist;
		} else if (hospitalFilter != null && hospitalFilter.equals("답변 적은 순")) {
			ArrayList<Hospital> rlist = new HospitalDAO().selectHospitalList(conn, hospitalFilter);
			close(conn);
			return rlist;
		} else {			
			ArrayList<Hospital> rlist = new HospitalDAO().selectHospitalList(conn, hospitalFilter);
			ArrayList<Hospital> nrlist = new HospitalDAO().nrSelectHospitalList(conn, hospitalFilter);
			list.addAll(rlist);
			list.addAll(nrlist);
			LinkedHashSet<Hospital> hs = new LinkedHashSet<Hospital>();
			hs.addAll(list);
			list.clear(); // 기존 ArrayList를 비운다.
			list.addAll(hs); // HashSet을 ArrayList에 다시 담는다.
			close(conn);
			return list;
		}
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

	public Hospital selectHospital(Member m) {
		Connection conn = getConnection();

		Hospital h = new HospitalDAO().selectHospital(conn, m);
		close(conn);
		return h;
	}

	public Hospital hospitalDetail(int userNo) {
		Connection conn = getConnection();

		Hospital h = new HospitalDAO().hospitalDetail(conn, userNo);
		close(conn);

		return h;
	}

	public ArrayList<HospitalReviewList> HospitalReviewList(int hospitalNo) {
		Connection conn = getConnection();
		ArrayList<HospitalReviewList> hrlList = new HospitalDAO().HospitalReviewList(conn, hospitalNo);
		close(conn);
		return hrlList;
	}

	public ArrayList<hospital.model.vo.HospitalReviewList> insertHospitalReview(String title, String content,
			int user_no, int hospitalNo, String heart) {
		Connection conn = getConnection();
		HospitalDAO hd = new HospitalDAO();
		int result = 0;
		int result1 = hd.insertHospitalReview1(conn, title, content, user_no);
		int result2 = hd.insertHospitalReview2(conn, heart);
		int result3 = hd.insertHospitalReview3(conn, hospitalNo);
		int result4 = hd.updateHospitalReview(conn, hospitalNo);
		result = result1 + result2 + result3 + result4;
		ArrayList<HospitalReviewList> hrlList = null;
		if (result == 4) {
			commit(conn);
			hrlList = new HospitalDAO().HospitalReviewList(conn, hospitalNo);
		} else {
			rollback(conn);
		}
		close(conn);
		return hrlList;
	}

	public ArrayList<HospitalReviewList> hospitalList() {
		Connection conn = getConnection();
		ArrayList<HospitalReviewList> hList = new HospitalDAO().hospitalList(conn);
		close(conn);
		return hList;
	}

	public String getHospitalImages(String user_id) {
		Connection conn = getConnection();
		String imgs = new HospitalDAO().getHospitalImages(conn, user_id);
		close(conn);
		return imgs;
	}

	public int HMyPageUpdate(Hospital h) {
		Connection conn = getConnection();
		int result = new HospitalDAO().HMyPageUpdate(conn, h);
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}

}
