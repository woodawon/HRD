<%@page import="java.util.Collections"%>
<%@page import="java.util.Arrays"%>
<%@page import="DBPKG.SaleDTO"%>
<%@page import="DBPKG.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DBPKG.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%!int Sale(ArrayList<BoardDTO> list, int custno) {
		int money = 0;
		for (int i = 0; i < 10; i++) {
			if (custno == list.get(i).getCustno()) {
				money += list.get(i).getPcost() * list.get(i).getAmount();
			}
		}
		return money;
	}%>
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
	ArrayList<BoardDTO> list = dao.selectSales();
	ArrayList<BoardDTO> userList = dao.selectUser();
	ArrayList<SaleDTO> saleList = new ArrayList<>();
	ArrayList<Integer> numbers = new ArrayList<>();
	int check = list.get(0).getCustno();
	numbers.add(check);

	for (int i = 0; i < list.size() - 1; i++) {
		if (check != list.get(i + 1).getCustno()) {
			check = list.get(i + 1).getCustno();
			numbers.add(check);
		}
	}
	Integer[] saleNums = new Integer[numbers.size()];
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
				<td id="left">고객등급</td>
				<td id="left">매출</td>
			</tr>
			<%
			for (int i = 0; i < numbers.size(); i++) {
				for (int j = 0; j < userList.size(); j++) {
					if (numbers.get(i) == userList.get(j).getCustno()) {
						SaleDTO saledto = new SaleDTO();
						saledto.setCustno(numbers.get(i));
						saledto.setName(userList.get(j).getCustname());
						saledto.setGrade(userList.get(j).getGrade());
						saledto.setSale(Sale(list, numbers.get(i)));
						saleList.add(saledto);
						break;
					}
				}
			}
			for(int i = 0;i < saleList.size();i++) {
				saleNums[i] = saleList.get(i).getSale();
			}
			Arrays.sort(saleNums, Collections.reverseOrder());
			%>
			<%
			for (int i = 0; i < saleList.size(); i++) {
				for(int j = 0;j < saleList.size();j++) {
					if(saleNums[i] == saleList.get(j).getSale()) {
			%>
			<tr>
				<td id="left"><%=saleList.get(j).getCustno()%></td>
				<td id="left"><%=saleList.get(j).getName()%></td>
				<td id="left"><%=saleList.get(j).getGrade()%></td>
				<td id="left"><%=saleList.get(j).getSale()%></td>
			</tr>
			<%
					}
				}
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