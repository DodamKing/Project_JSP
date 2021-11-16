package guest;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class GuestDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	String sql = "";
	GuestVO vo = null;
	
	private String url = "jdbc:mysql://localhost:3306/javacourse";
	private String id = "root";
	private String password = "1234";
	
	public GuestDAO() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
//			System.out.println("검색성공");
			conn = DriverManager.getConnection(url, id, password);
//			System.out.println("연결성공");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
//			System.out.println("검색실패");
		} catch (SQLException e) {
			e.printStackTrace();
//			System.out.println("연결실패");
		}
	}
	
	public void close() {
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public List<GuestVO> gList(int startIndexNo, int pageSize) {
		List<GuestVO> vos = new ArrayList<GuestVO>();
		sql = "select * from guest order by idx desc limit ?,?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startIndexNo);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				vo = new GuestVO();
				vo.setIdx(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setEmail(rs.getString(3));
				vo.setHomepage(rs.getString(4));
				vo.setvDate(rs.getString(5));
				vo.setHostIp(rs.getString(6));
				vo.setContent(rs.getString(7));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return vos;
	}
	
	public int gInputOk(GuestVO vo) {
		sql = "insert into guest values (default, ?, ?, ?, default, ?, ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getEmail());
			pstmt.setString(3, vo.getHomepage());
			pstmt.setString(4, vo.getHostIp());
			pstmt.setString(5, vo.getContent());
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return -1;
	}
	
	public int gDelete(int idx) {
		sql = "delete from guest where idx = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return -1;
	}
	
	public int totRecCnt() {
		int totRecCnt = 0;
		sql = "select count(*) from guest";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				totRecCnt = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return totRecCnt;
	}

	public int getWriteCnt(String mid, String nick, String name) {
		int guestCnt = 0;
		sql = "select count(*) from guest where name like ? or name like ? or name like ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + mid + "%");
			pstmt.setString(2, "%" + nick + "%");
			pstmt.setString(3, "%" + name + "%");
			rs = pstmt.executeQuery();
			rs.next();
			guestCnt = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return guestCnt;
	}
}
