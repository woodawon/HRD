<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Connection con;
PreparedStatement psmt;
ResultSet rs;
Class.forName("oracle.jdbc.OracleDriver");
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String id = "cafe";
String pw = "1234";
con = DriverManager.getConnection(url, id, pw);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="main.css" type="text/css" rel="stylesheet" />
<link href="sell.css" type="text/css" rel="stylesheet" />
</head>
<body>
	<header>
		<h1>카페 프렌차이즈 관리 ver1.0</h1>
	</header>
	<nav>
		<a href="SellAdd.jsp">매출등록</a>
		<a href="Menu.jsp">메뉴등록/수정</a>
		<a href="SellCon.jsp">매출현황</a>
		<a href="main.jsp">홈으로</a>
	</nav>
	<section>
		<h3>메뉴등록/수정</h3>
		<table border="1">
			<tr>
				<td>메뉴코드</td>
				<td>메뉴명</td>
				<td>메뉴가격</td>
				<td>메뉴구분</td>
			</tr>
			<%
			String sql = "select * from menu_tbl_007 order by menu_cd asc";
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
			%>
			<tr>
				<td><a href="MenuEdit.jsp?menu_cd=<%=rs.getString("menu_cd") %>&menu_nm=<%=rs.getString("menu_nm") %>&price=<%=rs.getInt("price") %>"><%=rs.getString("menu_cd") %></a></td>
				<td name="menu_nm"><%=rs.getString("menu_nm") %></td>
				<%
				String[] num = (rs.getInt("price") + "").split("");
				%>
				<td name="price"><%=num[0] + "," + num[1] + num[2] + num[3] + "원" %></td>
				<%
				if(rs.getString("menu_fg").equals("0")) {
				%>
				<td name="menu_fg">커피</td>
				<%
				} else {
				%>
				<td name="menu_fg">티</td>
				<%
				}
				%>
			</tr>
			<%
			}
			%>
			<tr>
				<td colspan="4" style="text-align: center;">
					<button onclick ="location.href='MenuAdd.jsp'">등록</button>
				</td>
			</tr>
		</table>
	</section>
	<footer>
		<p>HRDKOREA Copyright@sangilmedia All rights reserved. Human right Development Kang</p>
	</footer>
</body>
</html>