<%@page import="DBPKG.BoardDTO"%>
<%@page import="DBPKG.BoardDAO"%>
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
	BoardDAO dao = new BoardDAO(application);
	String num = session.getAttribute("num").toString();
	System.out.println(num);
	BoardDTO dto = new BoardDTO();
	dto.setCustno(Integer.parseInt(request.getParameter("custno")));
	dto.setCustname(request.getParameter("custname"));
	dto.setPhone(request.getParameter("phone"));
	dto.setAddress(request.getParameter("address"));
	dto.setJoindate(request.getParameter("joindate"));
	dto.setGrade(request.getParameter("grade"));
	dto.setCity(request.getParameter("city"));
	int result = dao.EditUser(num, dto);
	session.setAttribute("result", result);
	dao.close();
	response.sendRedirect("UserRegisterProcess.jsp");
	%>
</body>
</html>