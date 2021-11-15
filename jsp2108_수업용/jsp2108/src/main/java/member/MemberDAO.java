package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import conn.GetConn;

public class MemberDAO {
	GetConn getconn = GetConn.getinstance();
	
	private Connection conn = getconn.getConn();
	private PreparedStatement pstmt;
	private ResultSet rs;
	private String sql;
	MemberVo vo;
	
	
	public String idCheck(String mid) {
		String name = "";
		sql = "select * from member where mid = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				name = rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			getconn.close();
		}
		return name;
	}
	
	public long getHashTableSearch (int pwdKey) {
		long pwdValue = 0;
		sql = "select * from hashTable where  pwdKey = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pwdKey);
			rs= pstmt.executeQuery();
			rs.next();
			pwdValue = rs.getLong("pwdValue");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			getconn.close();
		}
		return pwdValue;
	}

	public int setMemberJoinOk(MemberVo vo) {
		sql = "insert into member values (default, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, default, ?, ?, default, default, default, default, default, default, default)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getPwd());
			pstmt.setInt(3, vo.getPwdKey());
			pstmt.setString(4, vo.getNickName());
			pstmt.setString(5, vo.getName());
			pstmt.setString(6, vo.getGender());
			pstmt.setString(7, vo.getBirthday());
			pstmt.setString(8, vo.getTel());
			pstmt.setString(9, vo.getAddress());
			pstmt.setString(10, vo.getEmail());
			pstmt.setString(11, vo.getHomePage());
			pstmt.setString(12, vo.getJob());
			pstmt.setString(13, vo.getHobby());
			pstmt.setString(14, vo.getContent());
			pstmt.setString(15, vo.getUserInfor());
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			getconn.close();
		}
		return -1;
	}

	public MemberVo loginCheck(String mid) {
		vo = new MemberVo();
		sql = "select * from member where mid = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				vo.setMid(mid);
				vo.setPwd(rs.getString("pwd"));
				vo.setPwdKey(rs.getInt("pwdKey"));
				vo.setNickName(rs.getString("nickName"));
				vo.setLevel(rs.getInt("level"));
				vo.setLastDate(rs.getString("lastDate"));
				vo.setPoint(rs.getInt("point"));
			}
			else {
				vo = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			getconn.close();
		}
		return vo;
	}

	public void setLastDateUpdate(String mid) {
		sql = "update member set lastDate = now(), point = point + 10, visitCnt = visitCnt + 1 where mid = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
