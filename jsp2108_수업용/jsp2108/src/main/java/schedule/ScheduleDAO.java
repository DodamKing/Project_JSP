package schedule;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import conn.GetConn;

public class ScheduleDAO {
	GetConn getConn = GetConn.getinstance();
	private Connection conn = getConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	
	ScheduleVO vo = null;

	public ScheduleVO getscContent(String ymd, String mid) {
		vo = new ScheduleVO();
		sql = "select * from schedule where date(sDate) = ? and mid = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ymd);
			pstmt.setString(2, mid);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				vo.setIdx(rs.getInt(1));
				vo.setMid(rs.getString(2));
				vo.setsDate(rs.getString(3));
				vo.setPart(rs.getString(4));
				vo.setContent(rs.getString(5));
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("getscContent_20 : " + e.getMessage());
		} finally {
			getConn.close();
		}
		return vo;
	}

	public int setScContent(ScheduleVO vo) {
		try {
			if (vo.getIdx() == 0) {
				sql = "insert into schedule values (default, ?, ?, ?, ?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, vo.getMid());
				pstmt.setString(2, vo.getsDate());
				pstmt.setString(3, vo.getPart());
				pstmt.setString(4, vo.getContent());
				pstmt.executeUpdate();
				return 1;
			}
			else {
				sql = "update schedule set part = ?, content = ? where idx = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, vo.getPart());
				pstmt.setString(2, vo.getContent());
				pstmt.setInt(3, vo.getIdx());
				pstmt.executeUpdate();
				return 2;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			getConn.close();
		}
		return 0;
	}

	public int setScDelete(int idx) {
		sql = "delete from schedule where idx = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			getConn.close();
		}
		return 0;
	}
	
}
