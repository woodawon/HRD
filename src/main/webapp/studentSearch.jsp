<%@page import="DBPKG.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DBPKG.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	BoardDAO dao = new BoardDAO(application);
	ArrayList<BoardDTO> list = dao.selectStudent();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="main.css" rel="stylesheet" type="text/css" />
<link href="stdentSearch.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<header>
		<h1>학생 성적 조회 프로그램 ver 1.0</h1>
	</header>
	<nav>
		<a href="studentSearch.jsp">학생조회</a> 
		<a href="studentInfoAdd.jsp">학생성적등록</a>
		 <a href="studentGradeSearch.jsp">학생성적조회</a> 
		 <a href="main.jsp">홈으로</a>
	</nav>
	<section>
		<h1 id="tableTitle">학생 조회</h1>
		<table border="1">
			<tr>
				<td>학번</td>
				<td>이름</td>
				<td>학년</td>
				<td>반</td>
				<td>번호</td>
				<td>성별</td>
			</tr>
			<%
			for(int i = 0;i < list.size();i++) {
			%>
			<tr>
				<td><%=list.get(i).getId() %></td>
				<td><%=list.get(i).getName() %></td>
				<td><%=list.get(i).getGrade() %></td>
				<td><%=list.get(i).getClasses() %></td>
				<td><%=list.get(i).getNum() %></td>
				<td><%=list.get(i).getGender() %></td>
			</tr>
			<%
			}
			%>
		</table>
	</section>
	<footer>
		<p>Copyright @ 2018 All right reserved SangilMedia High School</p>
	</footer>
</body>
</html>