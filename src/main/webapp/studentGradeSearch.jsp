<%@page import="java.util.Collections"%>
<%@page import="java.util.Arrays"%>
<%@page import="DBPKG.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DBPKG.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%!int sum(ArrayList<BoardDTO> list2, int num) {
		int korean = list2.get(num).getKorean();
		int english = list2.get(num).getEnglish();
		int math = list2.get(num).getMath();
		int history = list2.get(num).getHistory();
		int sum = (korean + english + math + history);
		return sum;
	}%>
<%
int count = 1;
BoardDAO dao = new BoardDAO(application);
ArrayList<BoardDTO> list1 = dao.selectStudent();
ArrayList<BoardDTO> list2 = dao.selectScore();
Integer[] ave = new Integer[10];

for (int i = 0; i < list1.size(); i++) {
	ave[i] = sum(list2, i) / 4;
}
Arrays.sort(ave, Collections.reverseOrder());
ArrayList<Integer> aves = new ArrayList<>();
for (int i = 0; i < ave.length; i++) {
	aves.add(ave[i]);
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="main.css" rel="stylesheet" type="text/css" />
<link href="studentGradeSearch.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<header>
		<h1>학생 성적 조회 프로그램 ver 1.0</h1>
	</header>
	<nav>
		<a href="studentSearch.jsp">학생조회</a> <a href="studentInfoAdd.jsp">학생성적등록</a>
		<a href="studentGradeSearch.jsp">학생성적조회</a> <a href="main.jsp">홈으로</a>
	</nav>
	<section>
		<h1 id="tableTitle">학생성적 조회</h1>
		<table border="1">
			<tr>
				<td>학번</td>
				<td>이름</td>
				<td>학년</td>
				<td>반</td>
				<td>번호</td>
				<td>성별</td>
				<td>국어</td>
				<td>수학</td>
				<td>영어</td>
				<td>역사</td>
				<td>합계</td>
				<td>평균</td>
				<td>순위</td>
			</tr>
			<%
			while (count < 11) {
				for (int i = 0; i < list1.size(); i++) {
					for (int j = 0; i < list1.size(); j++) {
						if (aves.get(i) == sum(list2, j) / 4) {
			%>
			<tr>
				<td><%=list1.get(j).getId()%></td>
				<td><%=list1.get(j).getName()%></td>
				<td><%=list1.get(j).getGrade()%></td>
				<td><%=list1.get(j).getClasses()%></td>
				<td><%=list1.get(j).getNum()%></td>
				<td><%=list1.get(j).getGender()%></td>
				<td><%=list2.get(j).getKorean()%></td>
				<td><%=list2.get(j).getEnglish()%></td>
				<td><%=list2.get(j).getMath()%></td>
				<td><%=list2.get(j).getHistory()%></td>
				<td><%=sum(list2, j)%></td>
				<td><%=sum(list2, j) / 4%></td>
				<td><%=count%></td>
			</tr>
			<%
							count++;
							list1.remove(j);
							list2.remove(j);
							aves.remove(i);
							break;
						}
					}
				}
			}
			%>
			<tr>
				<td colspan="6" />
				<td>국어 총합</td>
				<td>수학 총합</td>
				<td>영어 총합</td>
				<td>역사 총합</td>
				<td>총합</td>
				<td>총평균</td>
				<td>●●●●●●</td>
			</tr>
			<tr>
				<td colspan="6" />
				<td>709</td>
				<td>687</td>
				<td>726</td>
				<td>789</td>
				<td>2911.0</td>
				<td>291.1</td>
				<td>●●●●●●</td>
			</tr>
		</table>
	</section>
	<footer>
		<p>Copyright @ 2018 All right reserved SangilMedia High School</p>
	</footer>
</body>
</html>