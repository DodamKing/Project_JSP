package pds;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import conn.GetConn;
import conn.TimeDiff;

public class PdsDAO {
	GetConn getConn = GetConn.getinstance();
	private Connection conn = getConn.getConn();
	private PreparedStatement pstmt;
	private ResultSet rs;
	private PdsVO vo;
	private String sql;
	public int setPdsInputOk(PdsVO vo) {
		sql = "insert into psd values(default, ?, ?, ?, ?, ?, ?, ?, ?, default, default, ?, ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getNickName());
			pstmt.setString(3, vo.getfName());
			pstmt.setString(4, vo.getfSName());
			pstmt.setInt(5, vo.getfSize());
			pstmt.setString(6, vo.getTitle());
			pstmt.setString(7, vo.getPart());
			pstmt.setString(8, vo.getPwd());
			pstmt.setString(9, vo.getOpewnSw());
			pstmt.setString(10, vo.getContent());
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			getConn.close();
		}
		return 0;
	}
	
	public int totRecCnt(String part) {
		try {
			sql = "select count(*) from psd ";
			pstmt = conn.prepareStatement(sql);
			if (!part.equals("전체")) {
				sql = "select count(*) from psd where part = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, part);
			}
			rs = pstmt.executeQuery();
			rs.next();
			return rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			getConn.close();
		}
		return 0;
	}

	public List<PdsVO> getPdsList(int startIndexNo, int pageSize, String part) {
		List<PdsVO> vos = new ArrayList<PdsVO>();
			try {
				if (part.equals("전체")) {
					sql = "select * from psd order by idx desc limit ?, ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, startIndexNo);
					pstmt.setInt(2, pageSize);
				}
				else {
					sql = "select * from psd where part = ? order by idx desc limit ?, ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, part);
					pstmt.setInt(2, startIndexNo);
					pstmt.setInt(3, pageSize);
				}
				rs = pstmt.executeQuery();
				while (rs.next()) {
					vo = new PdsVO();
					vo.setIdx(rs.getInt(1));
					vo.setMid(rs.getString(2));
					vo.setNickName(rs.getString(3));
					vo.setfName(rs.getString(4));
					vo.setfSName(rs.getString(5));
					vo.setfSize(rs.getInt(6));
					vo.setTitle(rs.getString(7));
					vo.setPart(rs.getString(8));
					vo.setPwd(rs.getString(9));
					vo.setfDate(rs.getString(10));
					vo.setDownNum(rs.getInt(11));
					vo.setOpewnSw(rs.getString(12));
					vo.setContent(rs.getString(13));
					
					TimeDiff timeDiff = new TimeDiff();
					int res = timeDiff.timeDiff(vo.getfDate());
					vo.setwNdate(res);
					
					vos.add(vo);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				getConn.close();
			}
		return vos;
	}

	public PdsVO getPdsContent(int idx) {
		vo = new PdsVO();
		sql = "select * from psd where idx = ? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			rs.next();
			
			vo.setIdx(rs.getInt(1));
			vo.setMid(rs.getString(2));
			vo.setNickName(rs.getString(3));
			vo.setfName(rs.getString(4));
			vo.setfSName(rs.getString(5));
			vo.setfSize(rs.getInt(6));
			vo.setTitle(rs.getString(7));
			vo.setPart(rs.getString(8));
			vo.setPwd(rs.getString(9));
			vo.setfDate(rs.getString(10));
			vo.setDownNum(rs.getInt(11));
			vo.setOpewnSw(rs.getString(12));
			vo.setContent(rs.getString(13));
			
			TimeDiff timeDiff = new TimeDiff();
			int res = timeDiff.timeDiff(vo.getfDate());
			vo.setwNdate(res);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			getConn.close();
		}
		return vo;
	}

	public void setPdsDownUpdate(int idx) {
		sql = "update psd set downNum = downNum + 1 where idx = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			getConn.close();
		}
	}

	public void pdsDelete(int idx) {
		sql = "delete from psd where idx = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			getConn.close();
		}
	}
	
	
}
