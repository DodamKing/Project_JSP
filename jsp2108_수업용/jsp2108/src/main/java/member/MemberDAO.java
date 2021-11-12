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
}
