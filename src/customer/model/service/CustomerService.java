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
import customer.model.vo.MyPageQnA;
import customer.model.vo.MyPageReview;
import customer.model.vo.MyPageWorry;
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

	public int getReviewCount(String userId) {
		Connection conn = getConnection();
		int result = new CustomerDAO().getReviewCount(conn, userId);
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
	
	public int getWorryCount(String user_id) {
		Connection conn = getConnection();
		int result = new CustomerDAO().getWorryCount(conn, user_id);
		close(conn);
		return result;
	}
	
	public ArrayList<MyPageWorry> selectCustomerWorry(String user_id, int currentPage, int boardLimit) {
		Connection conn = getConnection();
		ArrayList<MyPageWorry> mpw = new CustomerDAO().selectCustomerWorry(conn, user_id, currentPage, boardLimit);
		close(conn);
		return mpw;
	}

	public MyPageReview ReviewDetail(String reviewNo) {
		Connection conn = getConnection();
		MyPageReview mpr = new CustomerDAO().ReviewDetail(conn, reviewNo);
		close(conn);
		return mpr;
	}

	public int reviewUpdate(MyPageReview mpr) {
		// TODO Auto-generated method stub
		Connection conn = getConnection();
		int result = 0;
		int result1 = new CustomerDAO().reviewUpdate1(conn, mpr);
		int result2 = new CustomerDAO().reviewUpdate2(conn, mpr);
		result = result1 + result2;
//		System.out.println(result);
		if(result == 2) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int reviewDelete(String board_no) {
		Connection conn = getConnection();
		int result = new CustomerDAO().reviewDelete(conn, board_no);
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int sendQnA(MyPageQnA mpq) {
		Connection conn = getConnection();
		int result = 0;
		int result1 = new CustomerDAO().sendQnA1(conn, mpq);
		int result2 = new CustomerDAO().sendQnA2(conn, mpq);
		
		result = result1 + result2;
		
		if(result == 2) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}

	public ArrayList<MyPageQnA> selectCustomerQnA(String user_id, int currentPage, int boardLimit) {
		Connection conn = getConnection();
		ArrayList<MyPageQnA> mpw = new CustomerDAO().selectCustomerQnA(conn, user_id, currentPage, boardLimit);
		close(conn);
		return mpw;
	}

	public int getQnACount(String user_id) {
		Connection conn = getConnection();
		int result = new CustomerDAO().getQnACount(conn, user_id);
		close(conn);
		return result;
	}

}
