package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import mainController.GetConn;

public class UserDAO {
	GetConn getconn = GetConn.getIstance();
	
	private Connection conn = getconn.getConn();
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private String sql;
	private UserVO vo;
	
	public boolean login(String userId, String pwd) {
		sql = "select * from user_jsp where userId = ? and pwd = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			getconn.close();
		}
		return false;
	}

	public int checkUserId(String userId) {
		sql = "select * from user_jsp where userId = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return 0;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 1;
	}
}
