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

	String sql = "insert into sale_tbl_003(sale_ymd, sale_no, store_cd, menu_cd, size_cd, sale_cnt, pay_type, sale_fg) values (?,?,?,?,?,?,?,?)";
	psmt = con.prepareStatement(sql);
	psmt.setString(1, request.getParameter("sale_ymd"));
	psmt.setString(2, request.getParameter("sale_no"));
	psmt.setString(3, request.getParameter("store_nm"));
	psmt.setString(4, request.getParameter("menu_nm"));
	psmt.setString(5, request.getParameter("size_nm"));
	psmt.setString(6, request.getParameter("sale_cnt"));
	psmt.setString(7, request.getParameter("pay_type"));
	psmt.setString(8, request.getParameter("sale_fg"));
	int result = psmt.executeUpdate();

	if (result == 1) {
	%>
	<script>
		alert('매출이 정상적으로 저장되었습니다.');
	</script>
	<%
	response.sendRedirect("SellCon.jsp");
	} else {
	response.sendRedirect("SellAdd.jsp");
	}
	%>
</body>
</html>