package admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import conn.GetConn;
import member.MemberVo;

public class AdminDAO {
	GetConn getconn = GetConn.getinstance();
	
	private Connection conn = getconn.getConn();
	private PreparedStatement pstmt;
	private ResultSet rs;
	private String sql;
	MemberVo memberVO;
	
	public void setMemberLevelChange(int idx, int level) {
		sql = "update member set level = ? where idx = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, level);
			pstmt.setInt(2, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			getconn.close();
		}
	}
}
