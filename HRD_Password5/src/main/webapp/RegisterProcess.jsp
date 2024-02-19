<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	Connection con;
	PreparedStatement psmt;

	Class.forName("oracle.jdbc.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String id = "stking";
	String pw = "1234";
	con = DriverManager.getConnection(url, id, pw);

	String sql = "insert into TBL_REGISTER (NO, Name, Code, School, Jumin, Major) values (?,?,?,?,?,?)";
	psmt = con.prepareStatement(sql);
	String[] str = request.getParameter("Code").split("");
	psmt.setString(1, request.getParameter("NO"));
	psmt.setString(2, request.getParameter("Name"));
	psmt.setString(3, "P" + str[0]);
	if (request.getParameter("School").equals("중졸")) {
		psmt.setString(4, "1");
	} else if(request.getParameter("School").equals("고졸")) {
		psmt.setString(4, "2");
	} else if(request.getParameter("School").equals("전문대졸")) {
		psmt.setString(4, "3");
	} else if(request.getParameter("School").equals("대졸")) {
		psmt.setString(4, "4");
	} else if(request.getParameter("School").equals("석사수료")) {
		psmt.setString(4, "5");
	} else if(request.getParameter("School").equals("석사취득")) {
		psmt.setString(4, "6");
	} else if(request.getParameter("School").equals("박사수료")) {
		psmt.setString(4, "7");
	} else if(request.getParameter("School").equals("박사취득")) {
		psmt.setString(4, "8");
	}
	psmt.setString(5, request.getParameter("Jumin1") + request.getParameter("Jumin2"));
	psmt.setString(6, request.getParameter("Major"));
	int result = psmt.executeUpdate();
	if (con != null) {
		con.close();
	}
	if (psmt != null) {
		psmt.close();
	}
	if (result == 1) {
		response.sendRedirect("main.jsp");
	} else {
		response.sendRedirect("RegisterPerson.jsp");
	}
	%>
</body>
</html>