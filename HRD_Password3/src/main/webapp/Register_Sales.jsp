<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="main.css" type="text/css" rel="stylesheet" />
<link href="Register_Sales.css" type="text/css" rel="stylesheet" />
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
		<h3>판매등록</h3>
		<form action="Register_Sales_Process.jsp">
			<table border="1">
				<tr>
					<td>판매번호</td>
					<td><input type="text" name="saleno" /></td>
				</tr>
				<tr>
					<td>상품코드</td>
					<td><input type="text" name="pcode" /></td>
				</tr>
				<tr>
					<td>판매날짜</td>
					<td><input type="text" name="saledate" /></td>
				</tr>
				<tr>
					<td>매장코드</td>
					<td><input type="text" name="scode" /></td>
				</tr>
				<tr>
					<td>판매수량</td>
					<td><input type="text" name="amount" /></td>
				</tr>
				<tr>
					<td colspan="2">
						<button type="submit">등록</button>
						<button onclick="Register_Sales.jsp">다시쓰기</button>
					</td>
				</tr>
			</table>
		</form>
	</section>
	<footer> Copyright @ 2018 All right reserved SangilMedia High
		School </footer>
</body>
</html>