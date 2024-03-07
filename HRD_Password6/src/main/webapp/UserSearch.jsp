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

String sql = "select TBL_CLASS_202201.REGISTER_MONTH as registerMonth, TBL_MEMBER_202201.C_NO as userNumber, TBL_MEMBER_202201.C_NAME as userName, TBL_TEACHER_202201.CLASS_NAME as className, TBL_CLASS_202201.CLASS_AREA as classArea, TBL_TEACHER_202201.CLASS_PRICE as classPrice, TBL_MEMBER_202201.GRADE as Grade from TBL_CLASS_202201 left join TBL_MEMBER_202201 on TBL_CLASS_202201.C_NO = TBL_MEMBER_202201.C_NO left join TBL_TEACHER_202201 on TBL_CLASS_202201.TEACHER_CODE = TBL_TEACHER_202201.TEACHER_CODE";
psmt = con.prepareStatement(sql);
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
		<h3>회원정보조회</h3>
		<table border="1">
			<tr>
				<td>수강일</td>
				<td>회원번호</td>
				<td>회원명</td>
				<td>강의명</td>
				<td>강의장소</td>
				<td>수강료</td>
				<td>등록</td>
			</tr>
			<%while(rs.next()) { %>
			<tr>
				<td><%=rs.getString("registerMonth") %></td>
				<td><%=rs.getString("userNumber") %></td>
				<td><%=rs.getString("userName") %></td>
				<td><%=rs.getString("className") %></td>
				<td><%=rs.getString("classArea") %></td>
				<td><%=rs.getInt("classPrice") %></td>
				<td><%=rs.getString("Grade") %></td>
			</tr>
			<%} %>
		</table>
	</section>
	<footer>
		<p>HRDKOREA Copyright@2015 All rights reserved. Human Resources Development Service of Korea</p>
	</footer>
</body>
</html>