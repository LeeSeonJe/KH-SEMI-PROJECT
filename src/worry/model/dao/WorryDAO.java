package worry.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import worry.model.vo.AddFile;
import worry.model.vo.Comments;
import worry.model.vo.Worry;

public class WorryDAO {
	private Properties prop = new Properties();
	
	
	public WorryDAO() {
		String fileName = WorryDAO.class.getResource("/sql/worry/worry-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	
	
	
	public int getListCount(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("getListCount");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}

		return result;
	}






	public ArrayList selectList(int currentPage, int boardLimit, Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Worry> list = new ArrayList<Worry>();
		
		int startRow = (currentPage -1) * boardLimit +1;
		int endRow = startRow + boardLimit -1;
		
		String query = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Worry w = new Worry(rset.getInt("worry_no"),
									rset.getInt("WORRY_THUMBS_UP"),
									rset.getInt("WORRY_HITS"),
									rset.getString("BOARD_TITLE"),
									rset.getString("BOARD_CONTENT"),
									rset.getDate("BOARD_DATE"),
									rset.getString("BOARD_CATEGORY"),
									rset.getString("USER_NAME"),
									rset.getInt("USER_NO"),
									rset.getInt("WORRY_THUMBS_DOWN")
						);
				list.add(w);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}
	
	public ArrayList selectList2(int currentPage, int boardLimit, Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Worry> list = new ArrayList<Worry>();
		
		int startRow = (currentPage -1) * boardLimit +1;
		int endRow = startRow + boardLimit -1;
		
		String query = prop.getProperty("selectList2");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Worry w = new Worry(rset.getInt("worry_no"),
									rset.getInt("WORRY_THUMBS_UP"),
									rset.getInt("WORRY_HITS"),
									rset.getString("BOARD_TITLE"),
									rset.getString("BOARD_CONTENT"),
									rset.getDate("BOARD_DATE"),
									rset.getString("BOARD_CATEGORY"),
									rset.getString("USER_NAME"),
									rset.getInt("USER_NO"),
									rset.getInt("WORRY_THUMBS_DOWN")
						);
				list.add(w);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}

//	public ArrayList<Worry> selectTopList(Connection conn, int currentPage, int boardLimit) {
//		Statement stmt = null;
//		ResultSet rset = null;
//		int result = 0;
//		Worry w = new Worry();
//		ArrayList<Worry> topList = new ArrayList<Worry>();
//
//		
//		
//		String query = prop.getProperty("selectTopList");
//		
//		try {
//			stmt = conn.createStatement();
//			rset = stmt.executeQuery(query);
//			
//			while(rset.next()) {
//				w = new Worry(rset.getInt("WORRY_NO"),
//								 rset.getInt("WORRY_THUMBS_UP"),
//								 rset.getInt("WORRY_HITS"),	
//								 rset.getString("BOARD_TITLE"),	
//								 rset.getString("BOARD_CONTENT"),	
//								 rset.getDate("BOARD_DATE"),	
//								 rset.getString("BOARD_CATEGORY"),	
//								 rset.getString("USER_NAME"),	
//								 rset.getInt("USER_NO"),	
//								 rset.getInt("WORRY_THUMBS_DOWN"));
//				
//				topList.add(w);
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}finally {
//			close(rset);
//			close(stmt);
//		}
//
//		return topList;
//	}


	public ArrayList<Worry> selectTop10List(int boardLimit, int currentPage, Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		int result = 0;
		Worry w = new Worry();
		ArrayList<Worry> top10List = new ArrayList<Worry>();

		
		
		String query = prop.getProperty("selectTop10List");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				w = new Worry(rset.getInt("WORRY_NO"),
								 rset.getInt("WORRY_THUMBS_UP"),
								 rset.getInt("WORRY_HITS"),	
								 rset.getString("BOARD_TITLE"),	
								 rset.getString("BOARD_CONTENT"),	
								 rset.getDate("BOARD_DATE"),	
								 rset.getString("BOARD_CATEGORY"),	
								 rset.getString("USER_NAME"),	
								 rset.getInt("USER_NO"),	
								 rset.getInt("WORRY_THUMBS_DOWN"));
				
				top10List.add(w);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}

		return top10List;
	}	



//	public ArrayList<Worry> selectHit10List(int boardLimit, int currentPage, Connection conn) {
//		Statement stmt = null;
//		ResultSet rset = null;
//		int result = 0;
//		Worry w = new Worry();
//		ArrayList<Worry> hit10List = new ArrayList<Worry>();
//
//		
//		
//		String query = prop.getProperty("selectHit10List");
//		
//		try {
//			stmt = conn.createStatement();
//			rset = stmt.executeQuery(query);
//			
//			while(rset.next()) {
//				w = new Worry(rset.getInt("WORRY_NO"),
//								 rset.getInt("WORRY_THUMBS_UP"),
//								 rset.getInt("WORRY_HITS"),	
//								 rset.getString("BOARD_TITLE"),	
//								 rset.getString("BOARD_CONTENT"),	
//								 rset.getDate("BOARD_DATE"),	
//								 rset.getString("BOARD_CATEGORY"),	
//								 rset.getString("USER_NAME"),	
//								 rset.getInt("USER_NO"),	
//								 rset.getInt("WORRY_THUMBS_DOWN"));
//				
//				hit10List.add(w);
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}finally {
//			close(rset);
//			close(stmt);
//		}
//
//		return hit10List;
//	}

//	public ArrayList<Worry> selectHitList(Connection conn, int currentPage, int boardLimit) {
//		PreparedStatement pstmt = null;
//		ResultSet rset = null;
//		int result = 0;
//		Worry w = new Worry();
//		ArrayList<Worry> hitList = new ArrayList<Worry>();
//		
//		int startRow = (currentPage -1) * boardLimit +1;
//		int endRow = startRow + boardLimit -1;
//		
//		
//		String query = prop.getProperty("selectHitList");
//		
//		try {
//			pstmt = conn.prepareStatement(query);
//			pstmt.setInt(1, startRow);
//			pstmt.setInt(2, endRow);
//			
//			rset = pstmt.executeQuery();
//			while(rset.next()) {
//				w = new Worry(rset.getInt("WORRY_NO"),
//								 rset.getInt("WORRY_THUMBS_UP"),
//								 rset.getInt("WORRY_HITS"),	
//								 rset.getString("BOARD_TITLE"),	
//								 rset.getString("BOARD_CONTENT"),	
//								 rset.getDate("BOARD_DATE"),	
//								 rset.getString("BOARD_CATEGORY"),	
//								 rset.getString("USER_NAME"),	
//								 rset.getInt("USER_NO"),	
//								 rset.getInt("WORRY_THUMBS_DOWN"));
//				
//				hitList.add(w);
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}finally {
//			close(rset);
//			close(pstmt);
//		}
//
//		return hitList;
//	}
	
	



	public ArrayList<Worry> selectLowList(Connection conn, int currentPage, int boardLimit) {
		Statement stmt = null;
		ResultSet rset = null;
		int result = 0;
		Worry w = new Worry();
		ArrayList<Worry> lowList = new ArrayList<Worry>();
		

		
		String query = prop.getProperty("selectLowList");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				w = new Worry(rset.getInt("WORRY_NO"),
								 rset.getInt("WORRY_THUMBS_UP"),
								 rset.getInt("WORRY_HITS"),	
								 rset.getString("BOARD_TITLE"),	
								 rset.getString("BOARD_CONTENT"),	
								 rset.getDate("BOARD_DATE"),	
								 rset.getString("BOARD_CATEGORY"),	
								 rset.getString("USER_NAME"),	
								 rset.getInt("USER_NO"),	
								 rset.getInt("WORRY_THUMBS_DOWN"));
				
				lowList.add(w);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}

		return lowList;
	}





	public ArrayList<Worry> selectSearchList(Connection conn, String text, String select, int currentPage, int boardLimit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Worry w = new Worry();
		ArrayList<Worry> searchList = new ArrayList<Worry>();
		String query = null;
		
		int startRow = (currentPage -1) * boardLimit +1;
		int endRow = startRow + boardLimit -1;
		
		if(select.equals("total")) {
			query = prop.getProperty("selectSearchList3");
				
			try {
				
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, "%" + text + "%");
				pstmt.setString(2, "%" + text + "%");
				pstmt.setInt(3, startRow);
				pstmt.setInt(4, endRow);
				
				rset = pstmt.executeQuery();
				while(rset.next()) {
					w = new Worry(rset.getInt("WORRY_NO"),
									 rset.getInt("WORRY_THUMBS_UP"),
									 rset.getInt("WORRY_HITS"),	
									 rset.getString("BOARD_TITLE"),	
									 rset.getString("BOARD_CONTENT"),	
									 rset.getDate("BOARD_DATE"),	
									 rset.getString("BOARD_CATEGORY"),	
									 rset.getString("USER_NAME"),	
									 rset.getInt("USER_NO"),	
									 rset.getInt("WORRY_THUMBS_DOWN"));
					
					searchList.add(w);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(rset);
				close(pstmt);
			}	

		} else if (select.equals("content")){
				query = prop.getProperty("selectSearchList2");
			
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, "%" + text + "%");
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					w = new Worry(rset.getInt("WORRY_NO"),
									 rset.getInt("WORRY_THUMBS_UP"),
									 rset.getInt("WORRY_HITS"),	
									 rset.getString("BOARD_TITLE"),	
									 rset.getString("BOARD_CONTENT"),	
									 rset.getDate("BOARD_DATE"),	
									 rset.getString("BOARD_CATEGORY"),	
									 rset.getString("USER_NAME"),	
									 rset.getInt("USER_NO"),	
									 rset.getInt("WORRY_THUMBS_DOWN"));
					
					searchList.add(w);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(rset);
				close(pstmt);
			}
		} else {	
			query = prop.getProperty("selectSearchList1");
			
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, "%" + text + "%");
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					w = new Worry(rset.getInt("WORRY_NO"),
									 rset.getInt("WORRY_THUMBS_UP"),
									 rset.getInt("WORRY_HITS"),	
									 rset.getString("BOARD_TITLE"),	
									 rset.getString("BOARD_CONTENT"),	
									 rset.getDate("BOARD_DATE"),	
									 rset.getString("BOARD_CATEGORY"),	
									 rset.getString("USER_NAME"),	
									 rset.getInt("USER_NO"),	
									 rset.getInt("WORRY_THUMBS_DOWN"));
					
					searchList.add(w);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(rset);
				close(pstmt);
			}
		}
		
		

		return searchList;
	}


	public int getSearchCount(Connection conn, String text, String select) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = null;
		
		if(select.equals("name")) {
			query = prop.getProperty("getSearchCount1");
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, "%" + text + "%");
				
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					result = rset.getInt(1);
					}
				result = rset.getInt(1);
				
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
			}

		} else if(select.equals("content")) {
			query = prop.getProperty("getSearchCount2");
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, "%" + text + "%");
				
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					result = rset.getInt(1);
					}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
			}

		}else {
			query = prop.getProperty("getSearchCount3");
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, "%" + text + "%");
				pstmt.setString(2, "%" + text + "%");
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
				result = rset.getInt(1);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
			}

		}

		return result;
	}
	
	
	
	
	
	public Worry worryDetail(int worryNo, Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Worry w = null;
		
		String query = prop.getProperty("worryDetail");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, worryNo);
			pstmt.setInt(2, worryNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				w = new Worry(rset.getInt("worry_no"),
						rset.getInt("WORRY_THUMBS_UP"),
						rset.getInt("WORRY_HITS"),
						rset.getString("BOARD_TITLE"),
						rset.getString("BOARD_CONTENT"),
						rset.getDate("BOARD_DATE"),
						rset.getString("USER_CATEGORY"),
						rset.getString("USER_NAME"),
						rset.getInt("USER_NO"),
						rset.getInt("WORRY_THUMBS_DOWN"),
						rset.getString("WORRY_STATUS"),
						rset.getString("PROFILE_IMAGE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		PreparedStatement pstmt2 = null;
		int result = 0;
		
		String query2 = prop.getProperty("hitPlus");
		
		
		
		try {
			pstmt2 = conn.prepareStatement(query2);
			pstmt2.setInt(1, worryNo);
			
			result = pstmt2.executeUpdate();
			
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(pstmt2);
		}

		return w;
	}
		




	public int insertComments(Comments c, Connection conn) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertComments");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, c.getWorryNo());
			pstmt.setInt(2, c.getUserNo());
			pstmt.setString(3, c.getCommentsText());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}





	public ArrayList selectComments(int worryNo, Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Comments> list = new ArrayList<Comments>();
		Comments c = null;
		
		String query = prop.getProperty("selectComments");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, worryNo);
			pstmt.setInt(2, worryNo);
			pstmt.setInt(3, worryNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				c = new Comments(rset.getInt("COMMENT_NO"),
								 rset.getInt("WORRY_NO"),
								 rset.getInt("USER_NO"),
								 rset.getString("COMMENT_TEXT"),
								 rset.getDate("COMMENT_DATE"),
								 rset.getString("USER_NAME"),
								 rset.getString("PROFILE_IMAGE"),
								 rset.getString("USER_CATEGORY")
						);
				list.add(c);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}





	public int insertWorry(Connection conn, String title, String content, int userNo, ArrayList<AddFile> fileList) {
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		Statement stmt = null;
		int result = 0;
		int result2 = 0;
		int result3 = 0;

		String query = prop.getProperty("insertBoard");
		try {
			pstmt= conn.prepareStatement(query);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setInt(3, userNo);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		String query2 = prop.getProperty("insertWorry");
		
		try {
			stmt = conn.createStatement();
			
			result2 = stmt.executeUpdate(query2);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(pstmt);
		}
		
		if(fileList != null) {
			String query3 = prop.getProperty("insertFile");
			try {
				
				for(int i =0 ; i < fileList.size(); i++) {
					AddFile af = fileList.get(i);
					pstmt2 = conn.prepareStatement(query3);
					pstmt2.setString(1, af.getOriginName());
					pstmt2.setString(2, af.getChangeName());
					pstmt2.setString(3, af.getFilePath());
					
					result3 += pstmt2.executeUpdate();
				}

			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		
		if(fileList != null) {
			if(result >0 && result2 >0) {
				return result;
			}
		} else {
			if(result > 0 && result2 > 0 && result3 > 0) {
				return result;
			}
		}
		
		return 0;
	}











	public ArrayList<AddFile> selectFile(Connection conn, int worryNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<AddFile> fList = new ArrayList<AddFile>();
		AddFile af = null;
		
		String query = prop.getProperty("selectFile");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, worryNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				af = new AddFile(rset.getInt("FILE_NO"),
								 rset.getString("ORIGIN_NAME"),
								 rset.getString("CHANGE_NAME"),
								 rset.getString("FILE_PATH"),
								 rset.getDate("UPLOAD_DATE"),
								 0,
								 rset.getString("STATUS"),
								 rset.getInt("BOARD_NO")
						);
				fList.add(af);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return fList;
	}





	public int likeUp(Connection conn, int worryNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("likeUp");

		
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, worryNo);
			result = pstmt.executeUpdate();
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}

		
		
		
		
		
		
		
		return result;
	}





	public int hateUp(Connection conn, int worryNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("hateUp");

		
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, worryNo);
			result = pstmt.executeUpdate();
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}











	public int deleteWorry(Connection conn, int worryNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteWorry");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, worryNo);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}





	public Worry beforeWorryDetail(int worryNo, Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Worry w = null;
		
		String query = prop.getProperty("beforeWorryDetail");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, worryNo);
			pstmt.setInt(2, worryNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				w = new Worry(rset.getInt("worry_no"),
						rset.getInt("WORRY_THUMBS_UP"),
						rset.getInt("WORRY_HITS"),
						rset.getString("BOARD_TITLE"),
						rset.getString("BOARD_CONTENT"),
						rset.getDate("BOARD_DATE"),
						rset.getString("USER_CATEGORY"),
						rset.getString("USER_NAME"),
						rset.getInt("USER_NO"),
						rset.getInt("WORRY_THUMBS_DOWN"),
						rset.getString("WORRY_STATUS"),
						rset.getString("PROFILE_IMAGE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		PreparedStatement pstmt2 = null;
		int result = 0;
		
		String query2 = prop.getProperty("hitPlus");
		
		
		
		try {
			pstmt2 = conn.prepareStatement(query2);
			pstmt2.setInt(1, worryNo);
			
			result = pstmt2.executeUpdate();
			
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(pstmt2);
		}

		return w;
	}





	public Worry afterWorryDetail(int worryNo, Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Worry w = null;
		
		String query = prop.getProperty("afterWorryDetail");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, worryNo);
			pstmt.setInt(2, worryNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				w = new Worry(rset.getInt("worry_no"),
						rset.getInt("WORRY_THUMBS_UP"),
						rset.getInt("WORRY_HITS"),
						rset.getString("BOARD_TITLE"),
						rset.getString("BOARD_CONTENT"),
						rset.getDate("BOARD_DATE"),
						rset.getString("USER_CATEGORY"),
						rset.getString("USER_NAME"),
						rset.getInt("USER_NO"),
						rset.getInt("WORRY_THUMBS_DOWN"),
						rset.getString("WORRY_STATUS"),
						rset.getString("PROFILE_IMAGE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		PreparedStatement pstmt2 = null;
		int result = 0;
		
		String query2 = prop.getProperty("hitPlus");
		
		
		
		try {
			pstmt2 = conn.prepareStatement(query2);
			pstmt2.setInt(1, worryNo);
			
			result = pstmt2.executeUpdate();
			
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(pstmt2);
		}

		return w;
	}





	public int lastWorry(int worryNo, Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		int last = 0;
		
		
		String query = prop.getProperty("lastWorry");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			System.out.println(rset.next());

				last = rset.getInt(1);
				
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}

		return last;
	}





	public int firstWorry(int worryNo, Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		int first = 0;
		
		
		String query = prop.getProperty("firstWorry");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			System.out.println(rset.next());

				first = rset.getInt(1);
				
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		return first;
	}





	public int updateWorry(Connection conn, String title, String content, int userNo, ArrayList<AddFile> fileList,
			int worryNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		System.out.println(fileList);
		String query = prop.getProperty("updateBoard");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setInt(3, worryNo);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		PreparedStatement pstmt2 = null;

		int result2 = 0;
		AddFile af = null;
		if(fileList != null) {
			String query2 =prop.getProperty("updateAddFile");
			try {
				
				for(int i =0 ; i < fileList.size(); i++) {
					af = fileList.get(i);
					pstmt2 = conn.prepareStatement(query2);
					pstmt2.setString(1, af.getOriginName());
					pstmt2.setString(2, af.getChangeName());
					pstmt2.setInt(3, worryNo);
					pstmt2.setString(4, af.getFilePath());
					
					result2 += pstmt2.executeUpdate();
					
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt2);
			}
		}

		return result;

	}





	public int deleteFile(Connection conn, int fNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteFile");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, fNo);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}





	public int WorryLikey(Connection conn, int worryNo, int userNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("likey");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, worryNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}





	public int LikeList(Connection conn, int worryNo, int userNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("checkLike");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, worryNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
			result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		

		return result;
	}









	public int hater(Connection conn, int worryNo, int userNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("hater");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, worryNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}





	public int hateList(Connection conn, int worryNo, int userNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("checkHate");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, worryNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
			result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		

		return result;
	}
	}
	

		


















