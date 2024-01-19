package DBPKG;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletContext;

public class JDBConnect {
	Connection con;
	PreparedStatement psmt;
	ResultSet rs;
	public JDBConnect(ServletContext application) {
		try {
			String driver = application.getInitParameter("OracleDriver");
			Class.forName(driver);
			
			String url = application.getInitParameter("OracleURL");
			String id = application.getInitParameter("OracleId");
			String pw = application.getInitParameter("OraclePwd");
			
			con = DriverManager.getConnection(url, id, pw);
			System.out.println("DB 연결");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void close() {
		try {
			if(con != null)
				con.close();
			if(psmt != null)
				psmt.close();
			if(rs != null)
				rs.close();
			System.out.println("자원 해제");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
