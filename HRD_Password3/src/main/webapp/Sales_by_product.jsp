<%@page import="java.util.Collection"%>
<%@page import="DBPKG.BoardDAO"%>
<%@page import="DBPKG.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%!
// 전역변수 및 메서드
int[] resultArr = new int[4];
int SellPrice = 0;

void addArr(String sellCode) {
	switch(sellCode) {
	case"AA01":
		resultArr[0] += SellPrice;
		break;
	case"AA03":
		resultArr[1] += SellPrice;
		break;
	case"AA04":
		resultArr[2] += SellPrice;
		break;
	case"AA05":
		resultArr[3] += SellPrice;
		break;
	default:
		System.out.println("실패");
	}
}
%>
<%
BoardDAO dao = new BoardDAO(application);
ArrayList<BoardDTO> sellList = dao.searchSell();
ArrayList<BoardDTO> priceList = dao.searchPrice();
dao.close();
ArrayList<BoardDTO> resultList = new ArrayList<>();

for (int i = 0; i < sellList.size(); i++) {
	for(int j = 0;j < priceList.size();j++) {
		if((priceList.get(j).getPcode()).equals(sellList.get(i).getPcode())) {
			System.out.println(priceList.get(j).getPcode());
			System.out.println(sellList.get(i).getPcode());
			SellPrice = priceList.get(j).getCost() * sellList.get(i).getAmount();
			addArr(priceList.get(j).getPcode());
		}
	}
}

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
		<h3>상품별 판매액</h3>
		<table border="1">
			<tr>
				<td>상품코드</td>
				<td>상품명</td>
				<td>상품별 판매액</td>
			</tr>
			<%
			for(int i = 0;i < 4;i++) {
			%>
			<tr>
				<td><%=priceList.get(i).getPcode() %></td>
				<td><%=priceList.get(i).getName() %></td>
				<td><%=resultArr[i] %></td>
			</tr>
			<%
			}
			resultArr = new int[4];
			%>
		</table>
	</section>
	<footer> Copyright @ 2018 All right reserved SangilMedia High
		School </footer>
</body>
</html>