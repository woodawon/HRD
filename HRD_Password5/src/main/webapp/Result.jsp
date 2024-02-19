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

String sql = "select * from TBL_VOTE";
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
		<h3>투표결과조회</h3>
		<table border="1">
			<tr>
				<td>이름</td>
				<td>생년월일</td>
				<td>성별</td>
				<td>후보번호</td>
				<td>투표시간</td>
				<td>유권자확인</td>
			</tr>
			<%
			while (rs.next()) {
			%>
				<tr>
					<td><%=rs.getString("v_name") %></td>
					<%
					String[] jumin = rs.getString("v_jumin").split("");
					String gender = null;
					String check = null;
					String[] dates = rs.getString("v_time").split("");
					if(jumin[6].equals("3")) {
						gender = "남";
					} else {
						gender = "여";
					}
					if(rs.getString("v_confirm").equals("N")) {
						check = "미확인";
					} else {
						check = "확인";
					}
					%>
					<td><%="20" + jumin[0] + jumin[1] + "년" + jumin[2] + jumin[3] + "월" + jumin[4] + jumin[5] + "일생" %></td>
					<td><%=gender %></td>
					<td><%=rs.getString("choice_no") %></td>
					<td><%=dates[0] + dates[1] + ":" + dates[2] + dates[3] %></td>
					<td><%=check %></td>
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