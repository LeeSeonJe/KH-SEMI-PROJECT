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




	public Worry worryDetail(int worryNo, Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Worry w = null;
		
		String query = prop.getProperty("worryDetail");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, worryNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				w = new Worry(rset.getInt("worry_no"),
						rset.getInt("WORRY_THUMBS_UP"),
						rset.getInt("WORRY_HITS"),
						rset.getString("BOARD_TITLE"),
						rset.getString("BOARD_CONTENT"),
						rset.getDate("BOARD_DATE"),
						rset.getString("BOARD_CATEGORY"),
						rset.getString("USER_NAME"),
						rset.getInt("USER_NO"),
						rset.getInt("WORRY_THUMBS_DOWN"));
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
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				c = new Comments(rset.getInt("COMMENT_NO"),
								 rset.getInt("WORRY_NO"),
								 rset.getInt("USER_NO"),
								 rset.getString("COMMENT_TEXT"),
								 rset.getDate("COMMENT_DATE"),
								 rset.getString("USER_NAME")
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





	public int updateWorry(Connection conn, Worry w) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateBoard");
		
		
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, w.getTitle());
			pstmt.setString(2, w.getContent());
			pstmt.setInt(3, w.getWorryNo());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
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
			// TODO Auto-generated catch block
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





	public ArrayList<Worry> selectTopList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		int result = 0;
		Worry w = new Worry();
		ArrayList<Worry> topList = new ArrayList<Worry>();
		
		
		String query = prop.getProperty("selectTopList");
		
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
				
				topList.add(w);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}

		return topList;
	}





	public ArrayList<Worry> selectHitList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		int result = 0;
		Worry w = new Worry();
		ArrayList<Worry> hitList = new ArrayList<Worry>();
		
		
		String query = prop.getProperty("selectHitList");
		
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
				
				hitList.add(w);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}

		return hitList;
	}





	public ArrayList<Worry> selectLowList(Connection conn) {
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





	public ArrayList<Worry> selectSearchList(Connection conn, String text, String select) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Worry w = new Worry();
		ArrayList<Worry> searchList = new ArrayList<Worry>();
		String query = null;
		
		if(select.equals("total")) {
			query = prop.getProperty("selectSearchList3");
				
			try {
				
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, "%" + text + "%");
				pstmt.setString(2, "%" + text + "%");
				
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
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				w = new Worry(rset.getInt("worry_no"),
						rset.getInt("WORRY_THUMBS_UP"),
						rset.getInt("WORRY_HITS"),
						rset.getString("BOARD_TITLE"),
						rset.getString("BOARD_CONTENT"),
						rset.getDate("BOARD_DATE"),
						rset.getString("BOARD_CATEGORY"),
						rset.getString("USER_NAME"),
						rset.getInt("USER_NO"),
						rset.getInt("WORRY_THUMBS_DOWN"));
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
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				w = new Worry(rset.getInt("worry_no"),
						rset.getInt("WORRY_THUMBS_UP"),
						rset.getInt("WORRY_HITS"),
						rset.getString("BOARD_TITLE"),
						rset.getString("BOARD_CONTENT"),
						rset.getDate("BOARD_DATE"),
						rset.getString("BOARD_CATEGORY"),
						rset.getString("USER_NAME"),
						rset.getInt("USER_NO"),
						rset.getInt("WORRY_THUMBS_DOWN"));
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
}
		


















