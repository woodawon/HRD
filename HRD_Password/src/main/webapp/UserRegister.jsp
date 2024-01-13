<%@page import="DBPKG.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DBPKG.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	BoardDAO dao = new BoardDAO(application);
	ArrayList<BoardDTO> list = dao.selectUser();
	int custNum = list.get(list.size()-1).getCustno();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="main.css" rel="stylesheet" type="text/css" />
<link href="register.css" rel="stylesheet" type="text/css" />
<title>Insert title here</title>
</head>
<body>
	<%
	if (session.getAttribute("result") != null) {
	%>
	<script>
		alert('등록이 완료되었습니다.');
	</script>
	<%
	session.setAttribute("result", null);
	}
	%>
	<header>
		<h1>쇼핑몰 회원관리 ver1.0</h1>
	</header>
	<nav>
		<a id="menu" href="UserRegister.jsp">회원등록</a> <a id="menu" href="UserList.jsp">회원목록
			조회/수정</a> <a id="menu" href="UserSale.jsp">회원매출조회</a> <a id="menu" href="main.jsp">홈으로</a>
	</nav>
	<section>
		<h1 id="title">홈쇼핑 회원 등록</h1>
		<form action="UserListProcess.jsp">
			<table border="1">
				<tr>
					<td id="left">회원번호(자동발생)</td>
					<td><input type="text" name="custno" value="<%=custNum + 1 %>" required /></td>
				</tr>
				<tr>
					<td id="left">회원성명</td>
					<td><input type="text" name="custname" required /></td>
				</tr>
				<tr>
					<td id="left">회원전화</td>
					<td><input type="text" name="phone" required /></td>
				</tr>
				<tr>
					<td id="left">회원주소</td>
					<td><input type="text" name="address" required /></td>
				</tr>
				<tr>
					<td id="left">가입일자</td>
					<td><input type="text" name="joindate" required /></td>
				</tr>
				<tr>
					<td id="left">고객등급[A1VIP, B2일반, C1직원]</td>
					<td><input type="text" name="grade" required /></td>
				</tr>
				<tr>
					<td id="left">도시코드</td>
					<td colspan="5"><input type="text" name="city" required /></td>
				</tr>
				<tr>
					<td>
						<button type="submit">등록</button>
					</td>
					<td>
						<button onclick="show()">조회</button>
					</td>
				</tr>
			</table>
		</form>
	</section>
	<footer>
		<p>HRDKOREA Copyright@2016 All rights reserved. Human Resources
			Development Service of Korea.</p>
	</footer>
	<script>
		function show() {
			location.replace('UserList.jsp');
		}
	</script>
</body>
</html>