<%@page import="java.sql.Date"%>
<%@page import="DBPKG.BoardDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="DBPKG.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		BoardDTO dto = new BoardDTO();
		dto.setSaleno(Integer.parseInt(request.getParameter("saleno")));
		dto.setPcode(request.getParameter("pcode"));
		dto.setSaledate(request.getParameter("saledate"));
		dto.setScode(request.getParameter("scode"));
		dto.setAmount(Integer.parseInt(request.getParameter("amount")));
		BoardDAO dao = new BoardDAO(application);
		int result = dao.addSell(dto);	
		dao.close();
	%>
	<%
	if(result == 1) {
	%>
	<script>
		alert("등록이 완료되었습니다.");
	</script>
	<%
	response.sendRedirect("main.jsp");
	}
	%>
</body>
</html>