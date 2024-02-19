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
String sql = "select TBL_REGISTER.NO as NO, TBL_REGISTER.Name as Name, TBL_PARTNER.P_CLASS as P_CLASS, TBL_PARTNER.P_PARTNER as P_PARTNER, TBL_REGISTER.School as School, TBL_REGISTER.Jumin as Jumin, TBL_REGISTER.Major as Major, TBL_PARTNER.P_TEL1 as TEL1, TBL_PARTNER.P_TEL2 as TEL2, TBL_PARTNER.P_TEL3 as TEL3 from TBL_REGISTER left join TBL_PARTNER on TBL_REGISTER.Code = TBL_PARTNER.P_CODE";
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
		<h3>후보조회</h3>
		<table border="1">
			<tr>
				<td>후보번호</td>
				<td>성명</td>
				<td>반</td>
				<td>파트너</td>
				<td>학력</td>
				<td>주민번호</td>
				<td>전공학년반</td>
				<td>전화번호</td>
			</tr>
			<%
			while (rs.next()) {
			%>
				<tr>
					<td><%=rs.getString("NO") %></td>
					<td><%=rs.getString("Name") %></td>
					<td><%=rs.getString("P_CLASS") %></td>
					<td><%=rs.getString("P_PARTNER") %></td>
					<%
					if(Integer.parseInt(rs.getString("School")) == 1) {
					%>
					<td>중졸</td>
					<%
					} else if(Integer.parseInt(rs.getString("School")) == 3) {
					%>
					<td>전문대졸</td>
					<%
					} else if(Integer.parseInt(rs.getString("School")) == 2) {
					%>
					<td>고졸</td>
					<%
					} else if(Integer.parseInt(rs.getString("School")) == 4) {
					%>
					<td>대졸</td>
					<%
					}
					%>
					<td><%=rs.getString("Jumin") %></td>
					<td><%=rs.getString("Major") %></td>
					<td><%=rs.getString("TEL1") + "-" + rs.getString("TEL2") + "-" + rs.getString("TEL3") %></td>
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