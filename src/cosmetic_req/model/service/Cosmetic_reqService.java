package cosmetic_req.model.service;

import static common.JDBCTemplate.*;
import java.sql.Connection;

import cosmetic.model.vo.Cosmetic;
import cosmetic_req.model.dao.Cosmetic_reqDAO;

public class Cosmetic_reqService {

	public int insertCos(Cosmetic c) {
		Connection conn = getConnection();
		
		int result = new Cosmetic_reqDAO().insertCos(conn, c);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

}
