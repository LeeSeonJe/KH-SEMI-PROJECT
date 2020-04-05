package customer.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;

import customer.model.dao.CustomerDAO;
import customer.model.vo.Customer;
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

}
