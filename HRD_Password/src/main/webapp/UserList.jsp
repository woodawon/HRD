<%@page import="java.util.Arrays"%>
<%@page import="DBPKG.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DBPKG.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	BoardDAO dao = new BoardDAO(application);
	ArrayList<BoardDTO> list = dao.selectUser();
	%>
	<%
	if (request.getAttribute("result") == "1") {
	%>
	<script>
		alert('회원정보수정이 완료되었습니다!');
	</script>
	<%
	}
	%>
	<header>
		<h1>회원목록조회/수정</h1>
	</header>
	<nav>
		<a id="menu" href="UserRegister.jsp">회원등록</a> <a id="menu"
			href="UserList.jsp">회원목록 조회/수정</a> <a id="menu" href="UserSale.jsp">회원매출조회</a>
		<a id="menu" href="main.jsp">홈으로</a>
	</nav>
	<section>
		<h1 id="title">홈쇼핑 회원 등록</h1>
		<table border="1">
			<tr>
				<td id="left">회원번호</td>
				<td id="left">회원성명</td>
				<td id="left">전화번호</td>
				<td id="left">주소</td>
				<td id="left">가입일자</td>
				<td id="left">고객등급</td>
				<td id="left">거주지역</td>
			</tr>
			<%
			for (int i = 0; i < list.size(); i++) {
			%>
			<tr>
				<td id="left"><a
					href="UserRegisterProcess.jsp?custno=<%=list.get(i).getCustno()%>&custname=<%=list.get(i).getCustname()%>&phone=<%=list.get(i).getPhone()%>&address=<%=list.get(i).getAddress()%>&joindate=<%=list.get(i).getJoindate()%>&grade=<%=list.get(i).getGrade()%>&city=<%=list.get(i).getCity()%>"><%=list.get(i).getCustno()%></a></td>
				<td id="left"><%=list.get(i).getCustno()%></td>
				<td id="left"><%=list.get(i).getPhone()%></td>
				<td id="left"><%=list.get(i).getAddress()%></td>
				<td id="left"><%=list.get(i).getJoindate()%></td>
				<td id="left"><%=list.get(i).getGrade()%></td>
				<td id="left"><%=list.get(i).getCity()%></td>
			</tr>
			<%
			}
			%>
		</table>
	</section>
	<footer>
		<p>HRDKOREA Copyright@2016 All rights reserved. Human Resources
			Development Service of Korea.</p>
	</footer>
</body>
</html>