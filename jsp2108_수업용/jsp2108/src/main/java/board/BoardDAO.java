package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import conn.GetConn;

public class BoardDAO {
	GetConn getConn = GetConn.getinstance();
	private Connection conn = getConn.getConn();
	private PreparedStatement pstmt;
	private ResultSet rs;
	private BoardVO vo;
	private String sql;
	
	
	public List<BoardVO> getList() {
		List<BoardVO> vos = new ArrayList<BoardVO>();
		sql = "select * from board order by idx desc";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				vo = new BoardVO();
				vo.setIdx(rs.getInt(1));
				vo.setNickName(rs.getString(2));
				vo.setTitle(rs.getString(3));
				vo.setEmail(rs.getString(4));
				vo.setHomePage(rs.getString(5));
				vo.setContent(rs.getString(6));
				vo.setwDate(rs.getString(7));
				vo.setReadNum(rs.getInt(8));
				vo.setHostIp(rs.getString(9));
				vo.setGoods(rs.getInt(10));
				vo.setMid(rs.getString(11));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			getConn.close();
		}
		return vos;
	}
	
}
