<%@page import="DBPKG.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DBPKG.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
BoardDAO dao = new BoardDAO(application);
ArrayList<BoardDTO> sellList = dao.searchSell();
ArrayList<BoardDTO> priceList = dao.searchPrice();
dao.close();
int allSellPrice = 0;
String name = null;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="main.css" type="text/css" rel="stylesheet" />
<link href="Sales_Status.css" type="text/css" rel="stylesheet" />
</head>
<body>
	<header>
		<h1>매장별 커피 판매관리 ver 1.0</h1>
	</header>
	<menu>
		<a href="Register_Sales.jsp">판매등록</a>
		<a href="Sales_Status.jsp">판매현황</a>
		<a href="Sales_by_store.jsp">매장별판매액</a>
		<a href="Sales_by_product.jsp">상품별판매액</a>
		<a href="main.jsp">홈으로</a>
	</menu>
	<section>
		<h3>판매현황</h3>
		<table border="1">
			<tr>
				<td>바번호</td>
				<td>상품코드</td>
				<td>판매날짜</td>
				<td>매장코드</td>
				<td>상품명</td>
				<td>판매수량</td>
				<td>총판매액</td>
			</tr>
			<%
			for (int i = 0; i < sellList.size(); i++) {
			%>
			<tr>
				<td><%= sellList.get(i).getSaleno()%></td>
				<td><%= sellList.get(i).getPcode()%></td>
				<%
				for (int j = 0;j < priceList.size();j++) {
					if((sellList.get(i).getPcode()).equals(priceList.get(j).getPcode())) {
						allSellPrice = priceList.get(j).getCost() * sellList.get(i).getAmount();
						name = priceList.get(j).getName();
						break;
					}
				}
				%>
				<td><%= sellList.get(i).getSaledate()%></td>
				<td><%= sellList.get(i).getScode()%></td>
				<td><%= name%></td>
				<td><%= sellList.get(i).getAmount()%></td>
				<td><%= allSellPrice%></td>
			</tr>
			<%
			}
			%>
		</table>
	</section>
	<footer> Copyright @ 2018 All right reserved SangilMedia High
		School </footer>
</body>
</html>