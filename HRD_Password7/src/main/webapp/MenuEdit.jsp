<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
session.setAttribute("or_menu_cd", request.getParameter("menu_cd"));
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
		<a href="SellAdd.jsp">매출등록</a> <a href="Menu.jsp">메뉴등록/수정</a> <a
			href="SellCon.jsp">매출현황</a> <a href="main.jsp">홈으로</a>
	</nav>
	<section>
		<h3>메뉴수정</h3>
		<form action="MenuEditProcess.jsp">
			<table border="1">
				<tr>
					<td>메뉴코드(수정불가)</td>
					<td><input name="menu_cd" type="text"
						value="<%=request.getParameter("menu_cd")%>" readonly /></td>
				</tr>
				<tr>
					<td>메뉴명</td>
					<td><input name="menu_nm" type="text"
						value="<%=request.getParameter("menu_nm")%>" /></td>
				</tr>
				<tr>
					<td>메뉴가격</td>
					<td><input name="price" type="text"
						value="<%=request.getParameter("price")%>" /></td>
				</tr>
				<tr>
					<td>메뉴구분</td>
					<td><select name="menu_fg">
							<option>선택</option>
							<option value="0">커피</option>
							<option value="1">티</option>
					</select></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;">
						<button>등록</button>
						<button>조회</button>
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