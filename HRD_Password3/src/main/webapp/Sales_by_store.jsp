<%@page import="java.util.Collection"%>
<%@page import="DBPKG.BoardDAO"%>
<%@page import="DBPKG.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%!
// 전역변수 및 메서드
int[] resultArr = new int[4];
int allSellPrice = 0;

void addArr(String shopCode) {
	switch(shopCode) {
	case"S001":
		resultArr[0] += allSellPrice;
		break;
	case"S002":
		resultArr[1] += allSellPrice;
		break;
	case"S003":
		resultArr[2] += allSellPrice;
		break;
	case"S004":
		resultArr[3] += allSellPrice;
		break;
	default:
		System.out.println("실패");
	}
}
%>
<%
BoardDAO dao = new BoardDAO(application);
ArrayList<BoardDTO> shopList = dao.searchShop();
ArrayList<BoardDTO> sellList = dao.searchSell();
ArrayList<BoardDTO> priceList = dao.searchPrice();
dao.close();
ArrayList<BoardDTO> resultList = new ArrayList<>();
String shopCode = null;

for (int i = 0; i < sellList.size(); i++) {
	for (int j = 0;j < priceList.size();j++) {
		if((sellList.get(i).getPcode()).equals(priceList.get(j).getPcode())) {
			allSellPrice = priceList.get(j).getCost() * sellList.get(i).getAmount();
			shopCode = sellList.get(i).getScode();
			BoardDTO dto = new BoardDTO();
			dto.setScode(shopCode);
			dto.setCost(allSellPrice);
			resultList.add(dto);
			addArr(shopCode);
			break;
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
		<h3>매장별 판매액</h3>
		<table border="1">
			<tr>
				<td>매장코드</td>
				<td>매장명</td>
				<td>매장별 판매액</td>
			</tr>
			<%
			for(int i = 0;i < 4;i++) {
			%>
			<tr>
				<td><%=shopList.get(i).getScode() %></td>
				<td><%=shopList.get(i).getSname() %></td>
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