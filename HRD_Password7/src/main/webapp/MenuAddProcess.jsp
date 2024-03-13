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

String sql = "insert into menu_tbl_007(menu_cd, menu_nm, price, menu_fg) values (?,?,?,?)";
psmt = con.prepareStatement(sql);
psmt.setString(1, request.getParameter("menu_cd"));
psmt.setString(2, request.getParameter("menu_nm"));
psmt.setString(3, request.getParameter("price"));
psmt.setString(4, request.getParameter("menu_fg"));
int result = psmt.executeUpdate();
if(result == 1) {
	response.sendRedirect("Menu.jsp");
} else {
	response.sendRedirect("MenuAdd.jsp");
}


%>
</body>
</html>