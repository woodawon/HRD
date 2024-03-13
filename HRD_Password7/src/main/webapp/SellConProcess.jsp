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
String id = "cafe";
String pw = "1234";
con = DriverManager.getConnection(url, id, pw);

String sql = "delete from sale_tbl_003 where sale_no=?";
psmt = con.prepareStatement(sql);
psmt.setString(1, request.getParameter("sale_no"));
int result = psmt.executeUpdate();
if(result == 1) {
	response.sendRedirect("main.jsp");
} else {
	response.sendRedirect("SellCon.jsp");
}
%>
</body>
</html>