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

	String sql = "insert into TBL_VOTE (v_jumin, v_name, choice_no, v_time, v_area, v_confirm) values (?,?,?,?,?,?)";
	psmt = con.prepareStatement(sql);
	psmt.setString(1, request.getParameter("v_jumin"));
	psmt.setString(2, request.getParameter("v_name"));
	psmt.setString(3, request.getParameter("choice_no"));
	psmt.setString(4, request.getParameter("v_time"));
	psmt.setString(5, request.getParameter("v_area"));
	psmt.setString(6, request.getParameter("v_confirm"));
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
		response.sendRedirect("Vote.jsp");
	}
	%>
</body>
</html>