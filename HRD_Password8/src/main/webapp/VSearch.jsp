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

String sql = "select * from tbl_vote202005";
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
				<td>성별</td>
				<td>생년월일</td>
				<td>나이</td>
				<td>성별</td>
				<td>후보번호</td>
				<td>투표시간</td>
				<td>유권자확인</td>
			</tr>
			<%
			while(rs.next()) {
			%>
			<tr>
				<td><%=rs.getString("V_NAME") %></td>
				<td><%="19" + rs.getString("V_JUMIN").substring(0,2) + "년" + rs.getString("V_JUMIN").substring(2,4) + "월" + rs.getString("V_JUMIN").substring(4,6) + "일생" %></td>
				<%
				int num1 = Integer.parseInt("19" + rs.getString("V_JUMIN").substring(0,2));
				int num2 = 2024;
				int resultNum = num2 - num1 - 4;
				%>
				<td><%="만" + resultNum + "세" %></td>
				<%
				String gender = null;
				String[] str = rs.getString("V_JUMIN").split("");
				if(str[6].equals("1") || str[6].equals("3") || str[6].equals("5") || str[6].equals("7") || str[6].equals("9")) {
					gender = "남";
				} else if(str[6].equals("2") || str[6].equals("4") || str[6].equals("6") || str[6].equals("8") || str[6].equals("0")) {
					gender = "여";
				} else {
					gender="?";
				}
				%>
				<td><%=gender %></td>
				<td><%=rs.getString("M_NO") %></td>
				<td><%=rs.getString("V_TIME").substring(0,2) + ":" + rs.getString("V_TIME").substring(2,4) %></td>
				<%
				String check = null;
				if(rs.getString("V_CONFIRM").equals("Y")) {
					check = "확인";
				} else {
					check = "미확인";
				}
				%>
				<td><%=check %></td>
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