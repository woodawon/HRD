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

String sql = "select sysdate from dual";
psmt = con.prepareStatement(sql);
rs = psmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="main.css" type="text/css" rel="stylesheet" />
<link href="sell.css" type="text/css" rel="stylesheet" />
</head>
<script type="text/javascript">
function check() {
	const sale_cnt = document.querySelector("#sale_cnt");
	if(sale_cnt == '') {
		alert('판매수량을 입력하지 않았습니다.');
		return false;
	}else {
		alert(sale_cnt);
		alert('매출이 정상적으로 저장되었습니다.');
	}
}
</script>
<body>
	<header>
		<h1>카페 프렌차이즈 관리 ver1.0</h1>
	</header>
	<nav>
		<a href="SellAdd.jsp">매출등록</a> <a href="Menu.jsp">메뉴등록/수정</a> <a
			href="SellCon.jsp">매출현황</a> <a href="main.jsp">홈으로</a>
	</nav>
	<section>
		<h3>매출 등록</h3>
		<form action="SellAddProcess.jsp">
			<table border="1">
				<tr>
					<td>판매일자(자동발생)</td>
					<%
					if(rs.next()) {
						String[] str = rs.getString(1).split("");
						String date = str[0] + str[1] + str[2] + str[3] + str[5] + str[6] + str[8] + str[9];
					%>
					<td><input name="sale_ymd" type="text" value="<%=date%>" readonly /></td>
					<%
					}
					rs.close();
					%>
				</tr>
				<%
				String sql1 = "select seq_sale_tbl_003_sale_no.NEXTVAL FROM DUAL";
				psmt = con.prepareStatement(sql1);
				rs = psmt.executeQuery();
				%>
				<tr>
					<td>판매번호(자동입력)</td>
					<%
					if(rs.next()) {
					%>
					<td><input name="sale_no" type="text" value="<%=rs.getString(1)%>" readonly /></td>
					<%
					}
					rs.close();
					%>
				</tr>
				<tr>
					<td>판매점포</td>
					<td><select name="store_nm">
							<option>선택</option>
							<%
							String sql2 = "select store_cd ,store_nm from store_tbl_007";
							psmt = con.prepareStatement(sql2);
							rs = psmt.executeQuery();
							while(rs.next()) {
							%>
							<option value="<%=rs.getString("store_cd")%>"><%=rs.getString("store_nm") %></option>
							<%
							}
							rs.close();
							%>
					</select></td>
				</tr>
				<tr>
					<td>메뉴코드</td>
					<td><select name="menu_nm">
							<option>선택</option>
							<%
							String sql3 = "select menu_cd, menu_nm from menu_tbl_007";
							psmt = con.prepareStatement(sql3);
							rs = psmt.executeQuery();
							while(rs.next()) {
							%>
							<option value="<%=rs.getString("menu_cd")%>"><%=rs.getString("menu_nm") %></option>
							<%
							}
							rs.close();
							%>
					</select></td>
				</tr>
				<tr>
					<td>사이즈</td>
					<td><select name="size_nm">
							<option>선택</option>
							 <%
							String sql4 = "select size_cd, size_nm from size_tbl_007";
							psmt = con.prepareStatement(sql4);
							rs = psmt.executeQuery();
							while(rs.next()) {
							%>
							<option value="<%=rs.getString("size_cd")%>"><%=rs.getString("size_nm") %></option>
							<%
							}
							rs.close();
							%>
					</select></td>
				</tr>
				<tr>
					<td>판매수량</td>
					<td><input name="sale_cnt" id="sale_cnt" type="text" /></td>
				</tr>
				<tr>
					<td>수취구분</td>
					<td><select name="pay_type">
							<option>선택</option>
							<option value="01">현금</option>
							<option value="02">카드</option>
					</select></td>
				</tr>
				<tr>
					<td>판매구분</td>
					<td>
						<select name="sale_fg">
							<option>1</option>
							<option>2</option>
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;">
						<button type="submit" onclick="check();">등록</button>
						<button type="button" onclick="location.href='SellCon.jsp';">조회</button>
					</td>
				</tr>
			</table>
		</form>
	</section>
	<footer>
		<p>HRDKOREA Copyright@sangilmedia All rights reserved. Human right
			Development Kang</p>
	</footer>
</body>
</html>