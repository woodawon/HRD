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
String id = "cafe";
String pw = "1234";
con = DriverManager.getConnection(url, id, pw);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="main.css" type="text/css" rel="stylesheet" />
<link href="sell.css" type="text/css" rel="stylesheet" />
</head>
<body>
	<header>
		<h1>카페 프렌차이즈 관리 ver1.0</h1>
	</header>
	<nav>
		<a href="SellAdd.jsp">매출등록</a>
		<a href="Menu.jsp">메뉴등록/수정</a>
		<a href="SellCon.jsp">매출현황</a>
		<a href="main.jsp">홈으로</a>
	</nav>
	<section>
		<h3>매출현황</h3>
		<table border="1">
			<tr>
				<td>판매일자</td>
				<td>판매번호</td>
				<td>점포명</td>
				<td>판매메뉴</td>
				<td>사이즈</td>
				<td>판매수량</td>
				<td>판매금액</td>
				<td>수취구분</td>
				<td>판매구분</td>
			</tr>
			<%
				String sql = "select sale_tbl_003.sale_ymd as one, sale_tbl_003.sale_no as two, store_tbl_007.store_nm as three, menu_tbl_007.menu_nm as four, size_tbl_007.size_nm as five, sale_tbl_003.sale_cnt as six, sale_tbl_003.pay_type as seven, sale_tbl_003.sale_fg as eight, menu_tbl_007.price as nine, size_tbl_007.plus_price as ten  from sale_tbl_003 left join store_tbl_007 on sale_tbl_003.store_cd = store_tbl_007.store_cd left join menu_tbl_007  on menu_tbl_007.menu_cd = sale_tbl_003.menu_cd left join size_tbl_007 on size_tbl_007.size_cd = sale_tbl_003.size_cd order by sale_no desc";
				psmt = con.prepareStatement(sql);
				rs = psmt.executeQuery();
				while(rs.next()) {
			%>
			<tr>
				<td><%=rs.getString("one") %></td>
				<td><a onclick="alert('해당매출을 취소하시겠습니까?');" href="SellConProcess.jsp?sale_no=<%=rs.getString("two")%>"><%=rs.getString("two") %></a></td>
				<td><%=rs.getString("three") %></td>
				<td><%=rs.getString("four") %></td>
				<td><%=rs.getString("five") %></td>
				<td><%=rs.getInt("six") %></td>
				<td><%=((rs.getInt("nine") * rs.getInt("six")) + rs.getInt("ten")) / 100 + ",000원" %></td>
				<%
				if(rs.getString("seven").equals("01")) {
				%>
				<td>현금</td>
				<%
				} else {
				%>
				<td>카드</td>
				<%
				}
				%>
				<%
				if(rs.getString("eight").equals("1")) {
				%>
				<td>판매</td>
				<%
				} else {
				%>
				<td>취소</td>
				<%
				}
				%>
			</tr>
			<%
				}
			%>
		</table>
	</section>
	<footer>
		<p>HRDKOREA Copyright@sangilmedia All rights reserved. Human right Development Kang</p>
	</footer>
</body>
</html>