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
	ResultSet rs;
	Class.forName("oracle.jdbc.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String id = "vote";
	String pw = "1234";
	con = DriverManager.getConnection(url, id, pw);

	String sql = "insert into tbl_vote202005 values (?,?,?,?,?,?)";
	psmt = con.prepareStatement(sql);
	psmt.setString(1, request.getParameter("V_JUMIN"));
	psmt.setString(2, request.getParameter("V_NAME"));
	psmt.setString(3, request.getParameter("M_NO"));
	psmt.setString(4, request.getParameter("V_TIME"));
	psmt.setString(5, request.getParameter("V_AREA"));
	psmt.setString(6, request.getParameter("V_CONFIRM"));
	int result = psmt.executeUpdate();

	if (result == 1) {
	%>
	<script>
		alert('투표하기 정보가 정상적으로 등록되었습니다.');
	</script>
	<%
	response.sendRedirect("main.jsp");
	} else {
	response.sendRedirect("Vote.jsp");
	}
	%>
</body>
</html>