package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import conn.GetConn;
import conn.TimeDiff;

public class BoardDAO {
	GetConn getConn = GetConn.getinstance();
	private Connection conn = getConn.getConn();
	private PreparedStatement pstmt;
	private ResultSet rs;
	private BoardVO vo;
	private String sql;
	
	
	public List<BoardVO> getBoardList(int startIndexNo, int pageSize) {
		List<BoardVO> vos = new ArrayList<BoardVO>();
		sql = "select * from board order by idx desc limit ?, ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startIndexNo);
			pstmt.setInt(2, pageSize);
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
				vo.setGood(rs.getInt(10));
				vo.setMid(rs.getString(11));
				
				vo.setwCDate(rs.getString(7));
				
				TimeDiff timeDiff = new TimeDiff();
				int res = timeDiff.timeDiff(vo.getwCDate());
				vo.setwNdate(res);
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			getConn.close();
		}
		return vos;
	}


	public int setBoInput(BoardVO vo) {
		sql = "insert into board values (default, ?, ?, ?, ?, ?, default, default, ?, default, ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getNickName());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getEmail());
			pstmt.setString(4, vo.getHomePage());
			pstmt.setString(5, vo.getContent());
			pstmt.setString(6, vo.getHostIp());
			pstmt.setString(7, vo.getMid());
			
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			getConn.close();
		}
		return 0;
	}


	public int totRecCnt() {
		sql = "select count(*) from board";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			return rs.getInt(1);
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			getConn.close();
		}
		return 0;
	}


	public BoardVO getBoardContent(int idx) {
		vo = new BoardVO();
		sql = "select * from board where idx = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				vo.setIdx(rs.getInt(1));
				vo.setNickName(rs.getString(2));
				vo.setTitle(rs.getString(3));
				vo.setEmail(rs.getString(4));
				vo.setHomePage(rs.getString(5));
				vo.setContent(rs.getString(6));
				vo.setwDate(rs.getString(7));
				vo.setReadNum(rs.getInt(8));
				vo.setHostIp(rs.getString(9));
				vo.setGood(rs.getInt(10));
				vo.setMid(rs.getString(11));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			getConn.close();
		}
		return vo;
	}


	public void setReadNum(int idx) {
		sql = "update board set readNum = readNum + 1 where idx = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			getConn.close();
		}
	}


	public int setBoardDelete(int idx) {
		sql = "delete from board where idx = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			getConn.close();
		}
		return 0;
	}


	public void setGoodUpdate(int idx) {
		sql = "update board set good = good + 1 where idx = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}  finally {
			getConn.close();
		}
	}


	public List<BoardVO> getLatelyBoardList(int startIndexNo, int pageSize, int lately) {
		List<BoardVO> vos = new ArrayList<BoardVO>();
		sql = "select * from board where wDate > date_sub(now(), interval ? day) order by idx desc limit ?, ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, lately);
			pstmt.setInt(2, startIndexNo);
			pstmt.setInt(3, pageSize);
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
				vo.setGood(rs.getInt(10));
				vo.setMid(rs.getString(11));
				
				vo.setwCDate(rs.getString(7));
				
				TimeDiff timeDiff = new TimeDiff();
				int res = timeDiff.timeDiff(vo.getwCDate());
				vo.setwNdate(res);
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}  finally {
			getConn.close();
		}
		return vos;
	}


	public int totRecCnt(int lately) {
		sql = "select count(*) from board where wDate > date_sub(now(), interval ? day)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, lately);
			rs = pstmt.executeQuery();
			rs.next();
			return rs.getInt(1);
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			getConn.close();
		}
		return 0;
	}


	public int setBoUpdate(BoardVO vo) {
		sql = "update board set title = ?, email = ?, homePage = ?, content = ?, hostIp = ? where idx = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getEmail());
			pstmt.setString(3, vo.getHomePage());
			pstmt.setString(4, vo.getContent());
			pstmt.setString(5, vo.getHostIp());
			pstmt.setInt(6, vo.getIdx());
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			getConn.close();
		}
		return 0;
	}


	public BoardVO getotherBoardContent(String str, int idx) {
		vo = new BoardVO();
		if (str.equals("prev")) {
			sql = "select * from board where idx > ? limit 1";
		}
		else {
			sql = "select * from board where idx < ? order by idx desc limit 1";
		}
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				vo.setIdx(rs.getInt(1));
				vo.setNickName(rs.getString(2));
				vo.setTitle(rs.getString(3));
				vo.setEmail(rs.getString(4));
				vo.setHomePage(rs.getString(5));
				vo.setContent(rs.getString(6));
				vo.setwDate(rs.getString(7));
				vo.setReadNum(rs.getInt(8));
				vo.setHostIp(rs.getString(9));
				vo.setGood(rs.getInt(10));
				vo.setMid(rs.getString(11));
				return vo;
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			getConn.close();
		}
		return null;
	}


	public int totRecCnt(String srch, String srchString) {
		sql = "select count(*) from board where " + srch + " like ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt. setString(1, "%" + srchString + "%");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);
			};
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			getConn.close();
		}
		return 0;
	}


	public List<BoardVO> getBoardSrchList(String srch, String srchString, int startIndexNo, int pageSize) {
		List<BoardVO> vos = new ArrayList<BoardVO>();
		sql = "select * from board where " + srch + " like ? order by idx desc limit ?, ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + srchString + "%");
			pstmt.setInt(2, startIndexNo);
			pstmt.setInt(3, pageSize);
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
				vo.setGood(rs.getInt(10));
				vo.setMid(rs.getString(11));
				
				vo.setwCDate(rs.getString(7));
				
				TimeDiff timeDiff = new TimeDiff();
				int res = timeDiff.timeDiff(vo.getwCDate());
				vo.setwNdate(res);
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}  finally {
			getConn.close();
		}
		return vos;
	}
	
}
