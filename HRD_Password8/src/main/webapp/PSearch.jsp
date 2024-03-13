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

String sql = "select tbl_member_202005.M_NO as mno, tbl_member_202005.M_NAME as mname, tbl_party_202005.P_NAME as pname, tbl_member_202005.P_SCHOOL as pschool, tbl_member_202005.M_JUMIN as mjumin, tbl_member_202005.M_CITY as mcity, tbl_party_202005.P_TEL1 as tel1, tbl_party_202005.P_TEL2 as tel2, tbl_party_202005.P_TEL3 as tel3  from tbl_member_202005 left join tbl_party_202005 on tbl_member_202005.P_CODE = tbl_party_202005.P_CODE";
psmt = con.prepareStatement(sql);
rs = psmt.executeQuery();

String school = null;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="main.css" type="text/css" rel="stylesheet" />
<link href="psearch.css" type="text/css" rel="stylesheet" />
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
		<h3>후보조회</h3>
		<table border="1">
			<tr>
				<td>후보번호</td>
				<td>성명</td>
				<td>소속정당</td>
				<td>학력</td>
				<td>주민번호</td>
				<td>지역구</td>
				<td>대표전화</td>
			</tr>
			<%
			while(rs.next()) {
			%>
			<tr>
				<td><%=rs.getString("mno") %></td>
				<td><%=rs.getString("mname") %></td>
				<td><%=rs.getString("pname") %></td>
				<%
				if(rs.getString("pschool").equals("1")) {
					school = "고졸";
				} else if(rs.getString("pschool").equals("2")) {
					school = "학사";
				} else if(rs.getString("pschool").equals("3")) {
					school = "석사";
				} else if(rs.getString("pschool").equals("4")) {
					school = "박사";
				}
				%>
				<td><%=school %></td>
				<%
				%>
				<td><%=rs.getString("mjumin").substring(0,6) + "-" + rs.getString("mjumin").substring(6,13) %></td>
				<td><%=rs.getString("mcity") %></td>
				<td><%=rs.getString("tel1") + "-" + rs.getString("tel2") + "-" + rs.getString("tel3") %></td>
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