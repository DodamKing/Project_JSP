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
		} finally {
			getconn.close();
		}
		return 1;
	}

	public int insertUser(UserVO vo) {
		sql = "insert into user_jsp values (default, ?, ?, ?, ?, ?, ?, ?, ?, default)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getUserId());
			pstmt.setInt(2, vo.getPwdKeyNo());
			pstmt.setString(3, vo.getPwd());
			pstmt.setString(4, vo.getEmail());
			pstmt.setString(5, vo.getTelecom());
			pstmt.setString(6, vo.getPhoneNb());
			pstmt.setString(7, vo.getUserNm());
			pstmt.setString(8, vo.getNickNm());
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			getconn.close();
		}
		return -1;
	}

	public int getKey(int pwdKeyNo) {
		sql = "select pwdValue from hashtable_jsp where pwdKey = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pwdKeyNo);
			rs = pstmt.executeQuery();
			rs.next();
			return rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			getconn.close();
		}
		return 0;
	}

	public int getKeyNo(String userId) {
		sql = "select pwdKeyNo from user_jsp where userId = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			rs.next();
			return rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			getconn.close();
		}
		return 0;
	}

	public UserVO getUserVO(String userId) {
		vo = new UserVO();
		sql = "select * from user_jsp where userId = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				vo.setIdx(rs.getInt(1));
				vo.setUserId(rs.getString(2));
				vo.setPwdKeyNo(rs.getInt(3));
				vo.setPwd(rs.getString(4));
				vo.setEmail(rs.getString(5));
				vo.setTelecom(rs.getString(6));
				vo.setPhoneNb(rs.getString(7));
				vo.setUserNm(rs.getString(8));
				vo.setNickNm(rs.getString(9));
				vo.setVisible(rs.getInt(10));
			}
			return vo;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			getconn.close();
		}
		return null;
	}
}
