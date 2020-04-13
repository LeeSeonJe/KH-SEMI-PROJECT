package worry.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import worry.model.dao.WorryDAO;
import worry.model.vo.AddFile;
import worry.model.vo.Comments;
import worry.model.vo.Worry;

import static common.JDBCTemplate.*;

public class WorryService {

	
	
	
	public int getListCount() {
		Connection conn = getConnection();
		
		int result = new WorryDAO().getListCount(conn);
		
		close(conn);
		
		return result;
		
	}

	public ArrayList<Worry> selectList(int currentPage, int boardLimit) {
		Connection conn = getConnection();
		
		ArrayList<Worry> list = new WorryDAO().selectList(currentPage, boardLimit, conn);
		
		return list;
	}

	public Worry worryDetail(int worryNo) {
		Connection conn = getConnection();
		
		Worry w = new WorryDAO().worryDetail(worryNo, conn);
		
		close(conn);
		
		return w;
	}

	public ArrayList<Comments> insertCommnets(Comments c) {
		Connection conn = getConnection();
		WorryDAO wDAO = new WorryDAO();
		int result = wDAO.insertComments(c,conn);
		ArrayList<Comments> list = new ArrayList<Comments>();
		
		if(result > 0) {
			commit(conn);
			list = wDAO.selectComments(c.getWorryNo(), conn);
			
		} else {
			rollback(conn);
		}
		return list;
	}

	public ArrayList<Comments> selectComments(int worryNo) {
		Connection conn = getConnection();
		ArrayList<Comments> list = new WorryDAO().selectComments(worryNo, conn);
		
		return list;
	}

	public int insertWorry(String title, String content, int userNo, ArrayList<AddFile> fileList) {
		Connection conn = getConnection();
		
		int result = new WorryDAO().insertWorry(conn, title, content, userNo, fileList);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}

	public int updateWorry(Worry w) {
		Connection conn = getConnection();
		
		int result = new WorryDAO().updateWorry(conn, w);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		
		
		
		return result;
	}

	public ArrayList<AddFile> selectFile(int worryNo) {
		Connection conn = getConnection();
		ArrayList<AddFile> fList = new WorryDAO().selectFile(conn, worryNo);
		
		close(conn);
		return fList;
	}


}
















