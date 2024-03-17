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

String sql = "select TBL_VACCRESV_202108.RESVNO as RESVNO, TBL_JUMIN_201808.PNAME as PNAME, TBL_VACCRESV_202108.JUMIN as JUMIN,TBL_JUMIN_201808.TEL as TEL, TBL_VACCRESV_202108.RESVDATE as RESVDATE, TBL_VACCRESV_202108.RESVTIME as RESVTIME, TBL_HOSP_202108.HOSPNAME as HOSPNAME, TBL_HOSP_202108.HOSPTEL as HOSPTEL, TBL_HOSP_202108.HOSPADDR as HOSPADDR, TBL_VACCRESV_202108.VCODE as VCODE  from TBL_VACCRESV_202108 left join TBL_HOSP_202108 on TBL_HOSP_202108.HOSPCODE = TBL_VACCRESV_202108.HOSPCODE left join TBL_JUMIN_201808 on TBL_JUMIN_201808.JUMIN = TBL_VACCRESV_202108.JUMIN";
psmt = con.prepareStatement(sql);
rs = psmt.executeQuery();
int num = 0;
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
	<section style="text-align: center;">
			<%
			while(rs.next()) {
				if(rs.getString("RESVNO").equals(request.getParameter("RESVNO"))) {
			%>
		<h3>예약번호 : <%=request.getParameter("RESVNO") %> 의 접종예약조회</h3>
		<table border="1" style="margin: auto;">
			<tr>
				<td>이름</td>
				<td>주민번호</td>
				<td>성별</td>
				<td>전화번호</td>
				<td>예약일자</td>
				<td>예약시간</td>
				<td>병원명</td>
				<td>대표전화</td>
				<td>병원주소</td>
				<td>백신종류</td>
			</tr>
			<tr>
				<td><%=rs.getString("PNAME") %></td>
				<td><%=rs.getString("JUMIN") %></td>
				<%
				String gender = null;
				if(rs.getString("JUMIN").substring(7,8).equals("1")) {
					gender = "남";
				} else if(rs.getString("JUMIN").substring(7,8).equals("2")) {
					gender = "여";
				}
				String vname = null;
				if(rs.getString("VCODE").equals("V001")) {
					vname = "A백신";
				} else if(rs.getString("VCODE").equals("V002")) {
					vname = "B백신";
				} else if(rs.getString("VCODE").equals("V003")) {
					vname = "C백신";
				}
				%>
				<td><%=gender %></td>
				<td><%=rs.getString("TEL") %></td>
				<td><%=rs.getString("RESVDATE").substring(0,4) + "년" + rs.getString("RESVDATE").substring(4,6) + "월" + rs.getString("RESVDATE").substring(6,8) + "일" %></td>
				<td><%=rs.getString("RESVTIME").substring(0,2) + ":" + rs.getString("RESVTIME").substring(2,4) %></td>
				<td><%=rs.getString("HOSPNAME") %></td>
				<td><%=rs.getString("HOSPTEL") %></td>
				<td><%=rs.getString("HOSPADDR") %></td>
				<td><%=vname %></td>
			</tr>
		</table>
			<%
					num += 1;
				}
			}
			if(num == 0) {
			%>
			<h1>접종예약정보가 존재하지 않습니다!</h1>
			<%
			}
			%>		
		<button onclick="location.href='Look.jsp';">돌아가기</button>		
	</section>
	<footer>
		<p>HRDKOREA Copyright @ 2021 All rights reserved. Human Resources
			Development Service of Korea</p>
	</footer>
</body>
</html>