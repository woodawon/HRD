<%@page import="java.util.ArrayList"%>
<%@page import="DBPKG.BoardDAO"%>
<%@page import="DBPKG.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
BoardDAO dao = new BoardDAO(application);
ArrayList<BoardDTO> patientList = dao.searchPatient();
ArrayList<BoardDTO> labTestList = dao.searchLabTest();
ArrayList<BoardDTO> resultList = dao.searchResult();
dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="Main.css" type="text/css" rel="stylesheet" />
<link href="Patient_Lookup.css" type="text/css" rel="stylesheet" />
<link href="Enter_test_results.css" type="text/css" rel="stylesheet" />
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
		<h2 id="con1">검사결과조회</h2>
		<table border="1">
			<tr>
				<td>환자 코드</td>
				<td>환자 이름</td>
				<td>검사 명</td>
				<td>검사 시작일</td>
				<td>검사 상태</td>
				<td>검사 완료일</td>
				<td>검사 결과</td>
			</tr>
			<%
			for (int i = 0; i < resultList.size(); i++) {
			%>
			<tr>
				<td><%=resultList.get(i).getPno() %></td>
				<%
				for(int j = 0; j < patientList.size(); j++) {
					if((resultList.get(i).getPno()).equals(patientList.get(j).getPno())) {
				%>
						<td><%=patientList.get(j).getPname() %></td>
				<%
					}
				}	
				%>
				<%
				for(int k = 0; k < labTestList.size(); k++) {
					if((resultList.get(i).getTcode()).equals(labTestList.get(k).getTcode())) {
				%>
						<td><%=labTestList.get(k).getTname() %></td>
				<%
					}
				}
				%>
				<td><%=resultList.get(i).getTsdate() %></td>
				<%
				if(Integer.parseInt((resultList.get(i).getTstatus()).replaceAll(" ", "")) == 1) {
				%>
				<td>검사 중</td>
				<% 
				} else {
				%>
				<td>검사 완료</td>
				<%
				}
				%>
				<td><%=resultList.get(i).getTldate() %></td>
				<%
				
				if(((resultList.get(i).getTresult()).replaceAll(" ", "")).equals("X")) {
				%>
				<td>미입력</td>
				<%
				} else if(((resultList.get(i).getTresult()).replaceAll(" ", "")).equals("P")) {
				%>
				<td>양성</td>
				<%
				} else {
				%>
				<td>음성</td>
				<%
				} 
				%>
			</tr>
			<%
			}
			%>
		</table>
	</section>
	<footer> Copyright @ 2020 All right reserved HRD </footer>
</body>
</html>