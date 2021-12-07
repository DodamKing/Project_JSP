package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import mainController.GetConn;

public class UserDAO {
	GetConn getconn = GetConn.getIstance();
	
	private Connection conn = getconn.getConn();
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private String sql;
	private UserVO vo;
	
	public boolean login(String userId, String pwd) {
		sql = "select * from user_jsp where userId = ? and pwd = ? and visible = 1";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			getconn.close();
		}
		return false;
	}

	public int checkUserId(String userId) {
		sql = "select * from user_jsp where userId = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return 0;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			getconn.close();
		}
		return 1;
	}

	public int insertUser(UserVO vo) {
		sql = "insert into user_jsp values (default, ?, ?, ?, ?, ?, ?, ?, ?, default, default, default, default, default)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getUserId());
			pstmt.setInt(2, vo.getPwdKeyNo());
			pstmt.setString(3, vo.getPwd());
			pstmt.setString(4, vo.getEmail());
			pstmt.setString(5, vo.getTelecom());
			pstmt.setString(6, vo.getPhoneNb());
			pstmt.setString(7, vo.getUserNm());
			pstmt.setString(8, vo.getNickNm());
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			getconn.close();
		}
		return -1;
	}

	public int getKey(int pwdKeyNo) {
		sql = "select pwdValue from hashtable_jsp where pwdKey = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pwdKeyNo);
			rs = pstmt.executeQuery();
			rs.next();
			return rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			getconn.close();
		}
		return 0;
	}

	public int getKeyNo(String userId) {
		sql = "select pwdKeyNo from user_jsp where userId = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			getconn.close();
		}
		return 0;
	}

	public UserVO getUserVO(String userId) {
		vo = new UserVO();
		sql = "select * from user_jsp where userId = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				vo.setIdx(rs.getInt(1));
				vo.setUserId(rs.getString(2));
				vo.setPwdKeyNo(rs.getInt(3));
				vo.setPwd(rs.getString(4));
				vo.setEmail(rs.getString(5));
				vo.setTelecom(rs.getString(6));
				vo.setPhoneNb(rs.getString(7));
				vo.setUserNm(rs.getString(8));
				vo.setNickNm(rs.getString(9));
				vo.setMembership(rs.getInt(10));
				vo.setMembershipDate(rs.getString(11));
				vo.setMembershipCnt(rs.getInt(12));
				vo.setPlayList(rs.getString(13));
				vo.setVisible(rs.getInt(14));
			}
			return vo;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			getconn.close();
		}
		return null;
	}

	public void setUserUpdate(UserVO vo) {
		sql = "update user_jsp set email = ?, telecom = ?, phoneNb = ?, userNm = ?, nickNm = ? where userId = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getEmail());
			pstmt.setString(2, vo.getTelecom());
			pstmt.setString(3, vo.getPhoneNb());
			pstmt.setString(4, vo.getUserNm());
			pstmt.setString(5, vo.getNickNm());
			pstmt.setString(6, vo.getUserId());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			getconn.close();
		}
	}

	public int signOut(String userId) {
		sql = "update user_jsp set visible = 0 where userId = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			getconn.close();
		}
		return 0;
	}

	public UserVO getMemberShip(String mid) {
		vo = new UserVO();
		sql = "select *, date_add(membershipDate, interval 29 day) from user_jsp where userId = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			rs.next();
			vo.setNickNm(rs.getString("nickNm"));
			vo.setMembership(rs.getInt("membership"));
			vo.setMembershipDate(rs.getString("membershipDate"));
			vo.setNextMembershipDate(rs.getString("date_add(membershipDate, interval 29 day)"));
			vo.setMembershipCnt(rs.getInt("membershipCnt"));
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			getconn.close();
		}
		return vo;
	}

	public void setMemberShip(String mid) {
		sql = "update user_jsp set membership = 1, membershipDate = now(), membershipCnt = membershipCnt + 1 where userId = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}  finally {
			getconn.close();
		}
	}

	public String getPlayList(String mid) {
		sql = "select playList from user_jsp where userId = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			rs.next();
			return rs.getString(1);
		} catch (SQLException e) {
			System.out.println("getPlayList" + e.getMessage());
		}  finally {
			getconn.close();
		}
		return null;
	}

	public void setPlayList(String mid, String playList) {
		sql = "update user_jsp set playList = ? where userId = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, playList);
			pstmt.setString(2, mid);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("setPlayList" + e.getMessage());
		}  finally {
			getconn.close();
		}

	}

	public void setPwdUpdate(String mid, String pwd, int pwdKeyNo) {
		sql ="update user_jsp set pwd = ?, pwdKeyNo = ? where userId = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pwd);
			pstmt.setInt(2, pwdKeyNo);
			pstmt.setString(3, mid);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("setPwdUpdate" + e.getMessage());
		}  finally {
			getconn.close();
		}
	}

	public String getuserId(String userNm, String phoneNb, String email) {
		sql = "select userId from user_jsp where userNm = ? and phoneNb = ? and email =?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userNm);
			pstmt.setString(2, phoneNb);
			pstmt.setString(3, email);
			rs = pstmt.executeQuery();
			if (rs.next()) return rs.getString(1);
		} catch (SQLException e) {
			System.out.println("setPwdUpdate" + e.getMessage());
		}  finally {
			getconn.close();
		}
		return null;
	}

}
