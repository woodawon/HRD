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
String id = "vote";
String pw = "1234";
con = DriverManager.getConnection(url, id, pw);

String sql = "select tbl_member_202005.M_NO as mno, tbl_member_202005.M_NAME as mname, count(*) as c from tbl_vote202005 left join tbl_member_202005 on tbl_vote202005.M_NO = tbl_member_202005.M_NO  group by tbl_member_202005.M_NO, tbl_member_202005.M_NAME order by c desc";
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
		<h1>과정 평가형 정보처리산업기사) 지역구의원투표 프로그램 ver 2020-05</h1>
	</header>
	<nav>
		<a href="PSearch.jsp">후보조회</a>
		<a href="Vote.jsp">투표하기</a>
		<a href="VSearch.jsp">투표검수조회</a>
		<a href="Rank.jsp">후보자등수</a>
		<a href="main.jsp">홈으로</a>
	</nav>
	<section>
		<h3>투표관리 프로그램</h3>
		<table border="1" style="margin: auto;">
			<tr>
				<td>후보번호</td>
				<td>성명</td>
				<td>총투표건수</td>
			</tr>
			<%
			while(rs.next()) {
			%>
			<tr>
				<td><%=rs.getString("mno") %></td>
				<td><%=rs.getString("mname") %></td>
				<td><%=rs.getString("c") %></td>
			</tr>
			<%
			}
			%>
		</table>
	</section>
	<footer>
		<p>Copyright@2020 All right reserved HRD</p>
	</footer>
</body>
</html>