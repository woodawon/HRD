<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
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
String id = "stking";
String pw = "1234";
con = DriverManager.getConnection(url, id, pw);
String sql = "select r.NO as no, r.Name as name, count(*) as v_total from TBL_REGISTER r, TBL_VOTE v where r.NO = v.choice_no group by r.NO, r.Name order by v_total DESC";
psmt = con.prepareStatement(sql);
rs = psmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="main.css" type="text/css" rel="stylesheet" />
<link href="RegisterPerson.css" type="text/css" rel="stylesheet" />
</head>
<body>
	<header>
		<h1>(과정평가형 정보처리산업기사)학생회장투표 프로그램 ver 2021-10</h1>
	</header>
	<nav>
		<a href="ShowPerson.jsp">후보조회</a> <a href="RegisterPerson.jsp">후보등록</a>
		<a href="Vote.jsp">투표하기</a> <a href="Result.jsp">투표결과조회</a> <a
			href="PersonRank.jsp">후보자순위</a> <a href="main.jsp">홈으로</a>
	</nav>
	<section>
		<h3>후보자등수</h3>
		<table border="1">
			<tr>
				<td>후보번호</td>
				<td>성명</td>
				<td>총득표수</td>
			</tr>
			<%
			while(rs.next()) {
			%>
			<tr>
				<td><%=rs.getString("no") %></td>
				<td><%=rs.getString("name") %></td>
				<td><%=rs.getString("v_total") %></td>
			</tr>
			<%
			}
			if (con != null) {
				con.close();
			}
			if (psmt != null) {
				psmt.close();
			}
			if(rs != null) {
				rs.close();
			}
			%>
		</table>
		<button id="home" onclick="location.href='main.jsp';">홈으로</button>
	</section>
	<footer>
		<p>HRDKOREA Copyright@2021 All rights reserved. Human REsources
			Development Service of Korea</p>
	</footer>
</body>
</html>