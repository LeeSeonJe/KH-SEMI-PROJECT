package message.model.dao;

import static common.JDBCTemplate.*;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import member.model.vo.Member;
import message.model.vo.CosTalk;

public class CosTalkDAO {

	private Properties prop = new Properties();

	public CosTalkDAO() {
		String fileName = CosTalkDAO.class.getResource("/sql/message/message-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public ArrayList<CosTalk> searchMember(Connection conn, String rName) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<CosTalk> rMember = new ArrayList<CosTalk>();

		String query = prop.getProperty("searchMember");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, rName);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				rMember.add(
						new CosTalk(rset.getInt("user_no"), rset.getString("user_id"), rset.getString("user_name")));

			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return rMember;

	}

	public int sendMessage(Connection conn, CosTalk cosTalk) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("sendMessage");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, cosTalk.getMessage());
			pstmt.setInt(2, cosTalk.getDispatch_no());
			pstmt.setInt(3, cosTalk.getReception_no());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public ArrayList<CosTalk> sendAfterSelect(Connection conn, int sUserNo, int rMNum) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<CosTalk> list = new ArrayList<>();
		CosTalk c = null;

		String query = prop.getProperty("sendAfterSelect");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, sUserNo);
			pstmt.setInt(2, rMNum);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				c = new CosTalk(rset.getInt("message_no"), rset.getString("message"), rset.getDate("message_date"),
						rset.getString("message_read"), rset.getInt("dispatch_no"), rset.getInt("reception_no"));

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

	public ArrayList<CosTalk> refreshChat(Connection conn, int sUserNo, int rMNum) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<CosTalk> list = new ArrayList<>();
		CosTalk c = null;

		String query = prop.getProperty("cosTalkRefresh");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, sUserNo);
			pstmt.setInt(2, rMNum);
			pstmt.setInt(3, sUserNo);
			pstmt.setInt(4, rMNum);
			
			rset = pstmt.executeQuery();
			
			while (rset.next()) {
				c = new CosTalk(rset.getInt("message_no"), rset.getString("message"), rset.getDate("message_date"),
						rset.getString("message_read"), rset.getInt("dispatch_no"), rset.getInt("reception_no"));

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
	/*
	public ArrayList<CosTalk> refreshChat2(Connection conn, int rMNum, int sUserNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<CosTalk> list = new ArrayList<>();
		CosTalk c = null;

		String query = prop.getProperty("cosTalkRefresh");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, rMNum);
			pstmt.setInt(2, sUserNo);
			
			rset = pstmt.executeQuery();
			
			while (rset.next()) {
				c = new CosTalk(rset.getInt("message_no"), rset.getString("message"), rset.getDate("message_date"),
						rset.getString("message_read"), rset.getInt("dispatch_no"), rset.getInt("reception_no"));

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

	*/

}
