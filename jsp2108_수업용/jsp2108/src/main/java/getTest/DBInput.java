package getTest;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import conn.GetConn;

public class DBInput {
	public static void main(String[] args) {
		GetConn getConn = GetConn.getinstance();
		Connection conn = getConn.getConn();
		for (int i=0; i<30; i++) {
			String sql = "insert into board values (default, '이기자', '테스트글" + i + "', 'ljk1234@email.com', 'ljk1234@homepage', '페이징 처리를 위한 글입니다. " + i + "', default, default, '218.236.203.156', default, 'lkj1234')";
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				getConn.close();
			}
		}
	}
}
