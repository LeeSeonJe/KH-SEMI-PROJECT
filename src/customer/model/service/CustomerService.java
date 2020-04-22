package customer.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import customer.model.dao.CustomerDAO;
import customer.model.vo.Customer;
import customer.model.vo.MyPageCustomer;
import customer.model.vo.MyPageReview;
import member.model.dao.MemberDAO;
import member.model.vo.Member;

public class CustomerService {

	public int insertCustomer(Member m, Customer c) {
		Connection conn = getConnection();
		
		int result1 = new MemberDAO().insertMember(conn, m);
		int result2 = new CustomerDAO().insertMember(conn, c);
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result1;
	}

	public Customer customerDetail(int userNo) {
		Connection conn = getConnection();
		
		Customer c = new CustomerDAO().customerDetail(conn, userNo);
		
		close(conn);
		return c;
	}

	public String selectProfile(int user_no) {
		Connection conn = getConnection();
		
		String profile = new CustomerDAO().selectProfile(conn, user_no);
		
		close(conn);
		return profile;
	}

	public MyPageCustomer selectCustomer(String user_id) {
		Connection conn = getConnection();
		
		MyPageCustomer mpc = new CustomerDAO().selectCustomer(conn, user_id);
		close(conn);
		return mpc;
	}

	public int updateCustomer(MyPageCustomer mpc) {
		Connection conn = getConnection();
		
		int result = new CustomerDAO().updateCustomer(conn, mpc);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int updateBasicCustomer(String userNo, String skinType) {
		Connection conn = getConnection();
		int result = new CustomerDAO().updateBasicCustomer(conn, userNo, skinType);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int updateSkinTypeCustomer(String userNo, String skinType) {
		Connection conn = getConnection();
		
		int result = new CustomerDAO().updateSkinTypeCustomer(conn, userNo, skinType);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public ArrayList<MyPageReview> selectCustomerReview(String user_id, int currentPage, int boardLimit) {
		// TODO Auto-generated method stub
		Connection conn = getConnection();
		ArrayList<MyPageReview> mpr = new CustomerDAO().selectCustomerReview(conn, user_id, currentPage, boardLimit);
		close(conn);
		return mpr;
	}

	public int getReviewCount(String userId) {
		Connection conn = getConnection();
		int result = new CustomerDAO().getReviewCount(conn, userId);
		close(conn);
		return result;
	}

}
