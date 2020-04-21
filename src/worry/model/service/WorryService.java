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
		
		close(conn);
		return list;
	}
	
	public ArrayList<Worry> selectList2(int currentPage, int boardLimit) {
		Connection conn = getConnection();
		
		ArrayList<Worry> list = new WorryDAO().selectList2(currentPage, boardLimit, conn);
		
		close(conn);
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
		close(conn);
		return list;
	}

	public ArrayList<Comments> selectComments(int worryNo) {
		Connection conn = getConnection();
		ArrayList<Comments> list = new WorryDAO().selectComments(worryNo, conn);
		
		close(conn);
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
		close(conn);
		return result;
	}



	public ArrayList<AddFile> selectFile(int worryNo) {
		Connection conn = getConnection();
		ArrayList<AddFile> fList = new WorryDAO().selectFile(conn, worryNo);
		
		close(conn);
		return fList;
	}

	public int likeUp(int worryNo) {
		Connection conn = getConnection();
		
		int result = new WorryDAO().likeUp(conn, worryNo);
		
		if(result > 0) {
			commit(conn);
			
		}else {
			rollback(conn);
		}
		
		
		
		
		close(conn);
		
		
		
		
		return result;
	}

	public int hateUp(int worryNo) {
		Connection conn = getConnection();
		
		int result = new WorryDAO().hateUp(conn, worryNo);
		
		if(result > 0) {
			commit(conn);
			
		}else {
			rollback(conn);
		}
		
		
		
		
		close(conn);
		
		
		
		
		return result;
	}

//	public ArrayList<Worry> selectTopList(int currentPage, int boardLimit) {
//		Connection conn = getConnection();
//		
//		ArrayList<Worry> topList = new WorryDAO().selectTopList(conn, currentPage, boardLimit);
//		
//		close(conn);
//		
//		return topList;
//	}

//	public ArrayList<Worry> selectHitList(int currentPage, int boardLimit) {
//		Connection conn = getConnection();
//		
//		ArrayList<Worry> hitList = new WorryDAO().selectHitList(conn, currentPage, boardLimit);
//		
//		close(conn);
//		return hitList;
//	}

	public ArrayList<Worry> selectLowList(int currentPage, int boardLimit) {
		Connection conn = getConnection();
		
		ArrayList<Worry> lowList = new WorryDAO().selectLowList(conn, currentPage, boardLimit);
		
		close(conn);
		
		return lowList;
	}

	public ArrayList<Worry> selectSearchList(int currentPage, int boardLimit, String text, String select) {
		Connection conn = getConnection();
		
		ArrayList<Worry> searchList = new WorryDAO().selectSearchList(conn, text, select, currentPage, boardLimit);
		
		
		close(conn);
		
		return searchList;
	}

	public int deleteWorry(int worryNo) {
		Connection conn = getConnection();
		
		int result = new WorryDAO().deleteWorry(conn, worryNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		
		
		
		return result;
	}

	public Worry beforeWorryDetail(int worryNo) {
		Connection conn = getConnection();
		
		Worry w = new WorryDAO().beforeWorryDetail(worryNo, conn);
		
		close(conn);
		
		return w;
	}

	public Worry afterWorryDetail(int worryNo) {
		Connection conn = getConnection();
		
		Worry w = new WorryDAO().afterWorryDetail(worryNo, conn);
		
		close(conn);
		
		return w;
	}

	public int lastWorry(int worryNo) {
		Connection conn = getConnection();
		
		int last = new WorryDAO().lastWorry(worryNo, conn);
		
		close(conn);
		return last;
	}

	public int firstWorry(int worryNo) {
		Connection conn = getConnection();
		
		int first = new WorryDAO().firstWorry(worryNo, conn);
		close(conn);
		return first;
	}

	public int updateWorry(String title, String content, int userNo, ArrayList<AddFile> fileList, int worryNo) {
		Connection conn = getConnection();
		
		int result = new WorryDAO().updateWorry(conn, title, content, userNo, fileList, worryNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int deleteFile(int fNo) {
		Connection conn = getConnection();
		
		int result = new WorryDAO().deleteFile(conn, fNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public ArrayList<Worry> selectTop10List(int currentPage, int boardLimit) {
		Connection conn = getConnection();
		
		ArrayList<Worry> top10List = new WorryDAO().selectTop10List(currentPage, boardLimit, conn);
		
		close(conn);
		return top10List;
	}

	public int getSearchCount(String text, String select) {
		Connection conn = getConnection();
		
		int result = new WorryDAO().getSearchCount(conn, text, select);
		
		close(conn);
		
		return result;
		
	}

//	public ArrayList<Worry> selectHit10List(int currentPage, int boardLimit) {
//		Connection conn = getConnection();
//		
//		ArrayList<Worry> hit10List = new WorryDAO().selectHit10List(currentPage, boardLimit, conn);
//		
//		close(conn);
//		return hit10List;
//	}
	
	
}
















