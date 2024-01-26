<%@page import="DBPKG.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DBPKG.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
int[] result = new int[4]; // 10 20 30 40
int[] cityCode = {10, 20, 30, 40};
String[] cityName = {"서울", "경기", "강원", "대구"};
BoardDAO dao = new BoardDAO(application);
ArrayList<BoardDTO> patientList = dao.searchPatient();
ArrayList<BoardDTO> resultList = dao.searchResult();
dao.close();

for(int i = 0; i < resultList.size(); i++) {
	for(int j = 0; j < patientList.size(); j++) {
		if((resultList.get(i).getPno()).equals(patientList.get(j).getPno())) {
			if(Integer.parseInt(patientList.get(j).getPcity()) == 10) {
				result[0]++;
			} else if (Integer.parseInt(patientList.get(j).getPcity()) == 20) {
				result[1]++;
			} else if (Integer.parseInt(patientList.get(j).getPcity()) == 30) {
				result[2]++;
			} else {
				result[3]++;
			}
		}
	}
}

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
		<h2 id="con1">지역별검사건수</h2>
		<table border="1">
			<tr>
				<td>지역 코드</td>
				<td>지역명</td>
				<td>검사건수</td>
			</tr>
			<%
			for (int i = 0; i < result.length; i++) {
			%>
			<tr>
				<td><%=cityCode[i] %></td>
				<td><%=cityName[i] %></td>
				<td><%=result[i] %></td>
			</tr>
			<%
			}
			%>
		</table>
	</section>
	<footer> Copyright @ 2020 All right reserved HRD </footer>
</body>
</html>