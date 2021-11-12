package conn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class GetConn {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private GetConn() {
		String driver = "com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/javacourse";
		String id = "root";
		String pwd = "1234";
		
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, id, pwd);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
	}
	
	private static GetConn instance = new GetConn();
	
	public static GetConn getinstance() {
		return instance;
	}

	public Connection getConn() {
		return conn;
	}

	public void close() {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
}
