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
			if (rs.next()) return rs.getInt(1);
		} catch (SQLException e) {
			System.out.println(e.getMessage() + " getSongIdx");
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
				vo.setLikeList(rs.getString("likeList"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			getconn.close();
		}
		return vos;
	}

	public SongVO getSongvo(int idx) {
		vo = new SongVO();
		sql = "select * from song where idx = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			rs.next();
			vo.setIdx(idx);
			vo.setImg(rs.getString(2));
			vo.setTitle(rs.getString(3));
			vo.setArtist(rs.getString(4));
			vo.setAlbum(rs.getString(5));
			vo.setReleaseDate(rs.getString(6));
			vo.setGenre(rs.getString(7));
			vo.setMusic(rs.getString(8));
			vo.setWords(rs.getString(9));
			vo.setArranger(rs.getString(10));
			vo.setLyrics(rs.getString(11));
			vo.setLikeCnt(rs.getInt(12));
			vo.setLikeList(rs.getString(13));
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			getconn.close();
		}
		return vo;
	}

	public String getLyrics(String title, String artist) {
		sql = "select lyrics from song where title = ? and artist = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, artist);
			rs = pstmt.executeQuery();
			rs.next();
			return rs.getString(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			getconn.close();
		}
		return null;
	}

	public void setLikeCnt(int idx) {
		sql = "update song set likeCnt = likeCnt + 1 where idx = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			getconn.close();
		}
	}

	public String getLikeList(int idx) {
		sql = "select likeList from song where idx = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			rs.next();
			return rs.getString(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			getconn.close();
		}
		return "";
	}

	public void setLikeList(int idx, String likeList) {
		sql ="update song set likeList = ? where idx = ? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, likeList);
			pstmt.setInt(2, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			getconn.close();
		}
	}

	public void setUnLikeCnt(int idx) {
		sql = "update song set likeCnt = likeCnt - 1 where idx = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			getconn.close();
		}
	}

}
