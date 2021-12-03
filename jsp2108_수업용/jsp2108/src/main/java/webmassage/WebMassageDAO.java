package webmassage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import conn.GetConn;

public class WebMassageDAO {
	GetConn getconn = GetConn.getinstance();
	private Connection conn = getconn.getConn();
	private PreparedStatement pstmt;
	private ResultSet rs;
	private WebMassageVO vo;
	private String sql;
	
	
	public List<WebMassageVO> getWebMessageList(String mid, int mSw) {
		List<WebMassageVO> vos = new ArrayList<WebMassageVO>();
		
		
		try {
			if (mSw == 0) {
				return vos;
			}
			
			else if (mSw == 2) {
				sql = "select * from webMassage where receiveId = ? and receiveSw = 'n'";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, mid);
			}
			
			else if (mSw == 3) {
				sql = "select * from webMassage where sendId = ? and sendSw = 's' order by idx desc";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, mid);
			}
			
			else if (mSw == 5) {
				sql = "select * from webMassage where (receiveId = ? and receiveSw = 'g') or (sendId = ? and sendSw = 'g') order by idx desc";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, mid);
				pstmt.setString(2, mid);
			}
			
			else {
				sql = "select * from webMassage where receiveId = ? and (receiveSw = 'n' or receiveSw = 'r') order by idx desc";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, mid);
			}
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				vo = new WebMassageVO();
				vo.setIdx(rs.getInt(1));
				vo.setTitle(rs.getString(2));
				vo.setContent(rs.getString(3));
				vo.setSendId(rs.getString(4));
				vo.setSendSw(rs.getString(5));
				vo.setSendDate(rs.getString(6));
				vo.setReceiveId(rs.getString(7));
				vo.setReceiveSw(rs.getString(8));
				vo.setReceiveDate(rs.getString(9));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("WebMassageDAO-getWebMessageList : " + e.getMessage());
		} finally {
			getconn.close();
		}
		return vos;
	}


	public int setWmInputOk(WebMassageVO vo) {
		sql = "select * from member where mid = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getSendId());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				getconn.close();
				sql = "insert into webMassage values (default, ?, ?, ?, 's', default, ?, 'n', default)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, vo.getTitle());
				pstmt.setString(2, vo.getContent());
				pstmt.setString(3, vo.getSendId());
				pstmt.setString(4, vo.getReceiveId());
				return pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			System.out.println("WebMassageDAO-setWmInputOk : " + e.getMessage());
		} finally {
			getconn.close();
		}
		return 0;
	}


	public WebMassageVO getWebMessageContent(int idx, String mid) {
		vo = new WebMassageVO();
		try {
			sql = "update webMassage set receiveSw='r', receiveDate = now() where idx = ? and receiveId = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.setString(2, mid);
			pstmt.executeUpdate();
			getconn.close();
			
			sql = "select * from webMassage where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				vo.setIdx(rs.getInt(1));
				vo.setTitle(rs.getString(2));
				vo.setContent(rs.getString(3));
				vo.setSendId(rs.getString(4));
				vo.setSendSw(rs.getString(5));
				vo.setSendDate(rs.getString(6));
				vo.setReceiveId(rs.getString(7));
				vo.setReceiveSw(rs.getString(8));
				vo.setReceiveDate(rs.getString(9));
			}
		} catch (SQLException e) {
			System.out.println("WebMassageDAO-getWebMessageContent : " + e.getMessage());
		} finally {
			getconn.close();
		}
		return vo;
	}


	public void wmDeleteCheck(int idx, String send) {
		
		if (send.equals("3")) {
			sql = "update webMassage set sendSw = 'g' where idx = ?";
		}
		
		else {
			sql = "update webMassage set receiveSw = 'g' where idx = ?";
		}
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("WebMassageDAO-wmDeleteCheck : " + e.getMessage());
		} finally {
			getconn.close();
		}
	}


	public void wmDeleteAll(String mid) {
		sql = "update webMassage set receiveSw = 'x' where receiveId = ? and receiveSw = 'g'";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("WebMassageDAO-wmDeleteAll : " + e.getMessage());
		} finally {
			getconn.close();
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
