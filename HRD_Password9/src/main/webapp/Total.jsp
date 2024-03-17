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

String sql = "select TBL_HOSP_202108.HOSPCODE as HOSPCODE, TBL_HOSP_202108.HOSPNAME as HOSPNAME, count(*) as c from TBL_VACCRESV_202108, TBL_HOSP_202108  where TBL_VACCRESV_202108.HOSPCODE = TBL_HOSP_202108.HOSPCODE group by TBL_HOSP_202108.HOSPCODE, TBL_HOSP_202108.HOSPNAME";
psmt = con.prepareStatement(sql);
rs = psmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="main.css" type="text/css" rel="stylesheet" />
</head>
<body>
	<header>
		<h1>(과정평가형 정보처리산업기사) 백신접종예약 프로그램 ver 2021-08</h1>
	</header>
	<nav>
		<a href="Book.jsp">백신접종예약</a> 
		<a href="Look.jsp">접종예약조회</a> 
		<a href="Total.jsp">접종인원통계</a> 
		<a href="main.jsp">홈으로</a>
	</nav>
	<section>
		<h3>병원별 접종건수 통계</h3>
		<table border="1" style="margin: auto; text-align: center;">
			<tr>
				<td>병원코드</td>
				<td>병원명</td>
				<td>접종건수</td>
			</tr>
			<%
			int sum = 0;
			while(rs.next()) {
			%>
			<tr>
				<td><%=rs.getString("HOSPCODE") %></td>
				<td><%=rs.getString("HOSPNAME") %></td>
				<td><%=rs.getString("c") %></td>
			</tr>
			<%
			sum += Integer.parseInt(rs.getString("c"));
			}
			%>
			<tr>
				<td></td>
				<td>총 누계</td>
				<td><%=sum %></td>
			</tr>
		</table>
	</section>
	<footer>
		<p>HRDKOREA Copyright @ 2021 All rights reserved. Human Resources
			Development Service of Korea</p>
	</footer>
</body>
</html>