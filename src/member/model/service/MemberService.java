package member.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import hospital.model.vo.Hospital;
import member.model.dao.MemberDAO;
import member.model.vo.Member;

public class MemberService {

	public int insertMember(Member m) {
		Connection conn = getConnection();

		int result = new MemberDAO().insertMember(conn, m);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return result;
	}

	public Member loginCustomer(Member m) {
		Connection conn = getConnection();

		Member loginUser = new MemberDAO().loginCustomer(conn, m);
		close(conn);
		return loginUser;
	}

	public ArrayList<Member> selectCustomer() {
		Connection conn = getConnection();

		ArrayList<Member> list = new MemberDAO().selectCustomer(conn);
		close(conn);
		return list;
	}

	public int deleteMember(int userNo) {
		Connection conn = getConnection();

		int result = new MemberDAO().deleteMember(conn, userNo);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return result;
	}

	public Member memberDetail(int userNo) {
		Connection conn = getConnection();

		Member m = new MemberDAO().memberDetail(conn, userNo);

		close(conn);
		return m;
	}

	public ArrayList<Member> selectHospital() {
		Connection conn = getConnection();

		ArrayList<Member> list = new MemberDAO().selectHospital(conn);
		close(conn);
		return list;
	}

	public ArrayList<Member> selectHospitalJoin() {
		Connection conn = getConnection();

		ArrayList<Member> list = new MemberDAO().selectHospitalJoin(conn);
		close(conn);
		return list;
	}

	public int hospitalAccept(int userNo) {
		Connection conn = getConnection();

		int result = new MemberDAO().hospitalAccept(conn, userNo);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return result;
	}

	public int hospitalReject(int userNo) {
		Connection conn = getConnection();

		int result = new MemberDAO().hospitalReject(conn, userNo);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return result;
	}

	public int pwdCheck(String userId, String userPwd, String newPwd) {
		// TODO Auto-generated method stub
		Connection conn = getConnection();
		MemberDAO member = new MemberDAO();
		int result = member.pwdCheck(conn, userId, userPwd);

		if (result > 0) {
			int update = member.changePwd(conn, userId, userPwd, newPwd);
			if(update > 0) {
				commit(conn);
			} else {
				rollback(conn);
			}
			return update;
		} else {
			return result;
		}

	}
}
