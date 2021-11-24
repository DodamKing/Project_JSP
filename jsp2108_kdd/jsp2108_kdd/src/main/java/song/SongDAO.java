package song;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import mainController.GetConn;

public class SongDAO {
	GetConn getconn = GetConn.getIstance();
	
	private Connection conn = getconn.getConn();
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private String sql;
	private SongVO vo;
	
	public int getSongIdx(String title, String artist) {
		sql = "select idx from song where title = ? and artist = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, artist);
			rs = pstmt.executeQuery();
			rs.next();
			return rs.getInt(1);
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			getconn.close();
		}
		return 0;
	}

	public ArrayList<SongVO> getSongvos(ArrayList<Integer> intPlayList) {
		ArrayList<SongVO> vos = new ArrayList<SongVO>();
		sql = "select * from song where idx = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			for (int i=0; i<intPlayList.size(); i++) {
				vo = new SongVO();
				pstmt.setInt(1, intPlayList.get(i));
				rs = pstmt.executeQuery();
				rs.next();
				vo.setImg(rs.getString("img"));
				vo.setTitle(rs.getString("title"));
				vo.setArtist(rs.getString("artist"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			getconn.close();
		}
		return vos;
	}
}
