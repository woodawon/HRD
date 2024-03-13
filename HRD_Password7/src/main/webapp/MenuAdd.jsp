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
String sql = "SELECT menu_seq.NEXTVAL FROM DUAL";
psmt = con.prepareStatement(sql);
rs = psmt.executeQuery();
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
		<a href="SellAdd.jsp">매출등록</a> <a href="Menu.jsp">메뉴등록/수정</a> <a
			href="SellCon.jsp">매출현황</a> <a href="main.jsp">홈으로</a>
	</nav>
	<section>
		<h3>메뉴등록</h3>
		<form action="MenuAddProcess.jsp">
			<table border="1">
				<tr>
					<td>메뉴코드(자동생성)</td>
					<%
					if (rs.next()) {
					%>
					<td><input name="menu_cd" type="text" value="<%=rs.getString(1)%>" /></td>
					<%
					}
					%>
				</tr>
				<tr>
					<td>메뉴명</td>
					<td><input name="menu_nm" type="text" /></td>
				</tr>
				<tr>
					<td>메뉴가격</td>
					<td><input name="price" type="text" /></td>
				</tr>
				<tr>
					<td>메뉴구분</td>
					<td><select name="menu_fg">
							<option>선택</option>
							<option value="0">커피</option>
							<option value="1">티</option>
					</select></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;">
						<button type="submit">등록</button>
						<button type="button" onclick="location.href='Menu.jsp'">조회</button>
					</td>
				</tr>
			</table>
		</form>
	</section>
	<footer>
		<p>HRDKOREA Copyright@sangilmedia All rights reserved. Human right
			Development Kang</p>
	</footer>
</body>
</html>