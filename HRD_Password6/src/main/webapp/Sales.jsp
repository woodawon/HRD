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
String id = "golf";
String pw = "1234";
String url = "jdbc:oracle:thin:@localhost:1521:xe";
con = DriverManager.getConnection(url, id, pw);

String sql = "select sum(TUITION) as TUITION from TBL_CLASS_202201, TBL_TEACHER_202201  where TBL_TEACHER_202201.TEACHER_CODE = TBL_CLASS_202201.TEACHER_CODE group by TBL_CLASS_202201.TEACHER_CODE, TBL_CLASS_202201.TUITION";
psmt = con.prepareStatement(sql);
rs = psmt.executeQuery();
int[] sum = new int[4];
int i = 0;
int j = 0;
while(rs.next()) {
	sum[i] = rs.getInt("TUITION");
	i++;
}
String sql2 = "select TEACHER_CODE as tcode, CLASS_NAME as cname, TEACHER_NAME as tname from TBL_TEACHER_202201";
psmt = con.prepareStatement(sql2);
rs = psmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="main.css" type="text/css" rel="stylesheet" />
<link href="teacherSearch.css" type="text/css" rel="stylesheet" />
</head>
<body>
	<header>
		<h1>골프연습장 회원관리 프로그램 ver1.0</h1>
	</header>
	<nav>
		<a href="TeacherSearch.jsp">강사조회</a>
		<a href="Apply.jsp">수강신청</a>
		<a href="UserSearch.jsp">회원정보조회</a>
		<a href="Sales.jsp">강사매출현황</a>
		<a href="main.jsp">홈으로</a>
	</nav>
	<section>
		<h3>강사매출현황</h3>
		<table border="1">
			<tr>
				<td>강사코드</td>
				<td>강의명</td>
				<td>강사명</td>
				<td>총매출</td>
			</tr>
			<%while(rs.next()) { %>
			<tr>
				<td><%=rs.getString("tcode") %></td>	
				<td><%=rs.getString("cname") %></td>	
				<td><%=rs.getString("tname") %></td>
				<td><%=sum[j] %></td>
				<%j++; %>
			</tr>
			<%} %>
		</table>
	</section>
	<footer>
		<p>HRDKOREA Copyright@2015 All rights reserved. Human Resources Development Service of Korea</p>
	</footer>
</body>
</html>