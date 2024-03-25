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
	String id = "system";
	String pw = "1234";
	
	con = DriverManager.getConnection(url, id, pw);
	String sql = "select * from board_tbl";
	psmt = con.prepareStatement(sql);
	rs = psmt.executeQuery();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="main.css" type="text/css" rel="stylesheet" />
<link href="Board.css" type="text/css" rel="stylesheet" />
</head>
<body>
	<header>
		<h1>커뮤니티 제작 프로그램</h1>
	</header>
	<nav>
		<a href="Board.jsp">게시판목록/조회</a>
		<a href="main.jsp">홈으로</a>
	</nav>
	<section>
		<form action="BoardWrite.jsp">
			<h3>게시판 목록/조회</h3>
			<table border="1">
				<tr>
					<td>번호</td>
					<td>작성자</td>
					<td>제목</td>
					<td>내용</td>
					<td>작성일</td>
				</tr>
				<%
				while(rs.next()) {
				%>
				<tr>
					<td><a href="BoardContentSearch.jsp?idx=<%=rs.getInt("idx")%>&writer=<%= rs.getString("writer") %>&subject=<%= rs.getString("subject") %>&content=<%= rs.getString("content") %>&date1=<%= rs.getString("date1") %>&crystal_date=<%= rs.getString("crystal_date") %>"><%= rs.getInt("idx")%></a></td>
					<td><%= rs.getString("writer") %></td>
					<td><%= rs.getString("subject") %></td>
					<td><%= rs.getString("content") %></td>
					<td><%= rs.getString("date1") %></td>
				</tr>
				<%
				}
				%>
			</table>
			<button type="submit" id="btn">작성하기</button>
		</form>
	</section>
	<footer>
		<p>Copyright @ 2020 All right reserved HRD</p>
	</footer>
</body>
</html>