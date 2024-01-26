<%@page import="DBPKG.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DBPKG.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
BoardDAO dao = new BoardDAO(application);
ArrayList<BoardDTO> list = dao.searchPatient();
dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="Main.css" type="text/css" rel="stylesheet" />
<link href="Patient_Lookup.css" type="text/css" rel="stylesheet" />
</head>
<body>
	<header>
		<h1>(과정평가형산업기사)검사프로그램</h1>
	</header>
	<menu>
		<a href="Patient_Lookup.jsp">환자조회</a>
		<a href="Enter_test_results.jsp">검사결과입력</a>
		<a href="Get_test_results.jsp">검사결과조회</a>
		<a href="Number_of_tests_by_region.jsp">지역별검사건수</a>
		<a href="Main.jsp">홈으로</a>
	</menu>
	<section>
		<h2>환자조회</h2>
		<table border="1">
			<tr>
				<td>환자 코드</td>
				<td>환자 이름</td>
				<td>환자 생년월일</td>
				<td>환자 성별</td>
				<td>환자 전화번호</td>
				<td>환자 거주지</td>
			</tr>
			<%
			for (int i = 0; i < list.size(); i++) {
			%>
			<tr>
				<td><%=list.get(i).getPno() %></td>
				<td><%=list.get(i).getPname() %></td>
				<td><%=list.get(i).getPbirth() %></td>
				<td><%=list.get(i).getPgender() %></td>
				<td><%=list.get(i).getPtel1()%>-<%=list.get(i).getPtel2()%>-<%=list.get(i).getPtel3() %></td>
				<td><%=list.get(i).getPcity() %></td>
			</tr>
			<%
			}
			%>
		</table>
	</section>
	<footer> Copyright @ 2020 All right reserved HRD </footer>
</body>
</html>