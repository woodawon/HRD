package DBPKG;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletContext;

public class JDBConnect {
	
	public Connection con;
	public PreparedStatement psmt; 
	public ResultSet rs;

	public JDBConnect(ServletContext application) {
		try {
			String driver = application.getInitParameter("OracleDriver");
			Class.forName(driver);

			String url = application.getInitParameter("OracleURL");
			String id = application.getInitParameter("OracleId");
			String pwd = application.getInitParameter("OraclePwd");
			con = DriverManager.getConnection(url, id, pwd);

			System.out.println("DB 연결됨");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void close() { 
		try {
			if (rs != null)
				rs.close();
			if (psmt != null)
				psmt.close();
			if (con != null)
				con.close();

			System.out.println("자원 해제");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}