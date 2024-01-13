<%@page import="java.io.Reader"%>
<%@page import="java.sql.Date"%>
<%@page import="DBPKG.BoardDAO"%>
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
		dto.setCustno(Integer.parseInt(request.getParameter("custno")));
		dto.setAddress(request.getParameter("address"));
		dto.setPhone(request.getParameter("phone"));
		dto.setCity(request.getParameter("city"));
		dto.setJoindate(request.getParameter("joindate"));
		dto.setGrade(request.getParameter("grade"));
		dto.setCustname(request.getParameter("custname"));
		BoardDAO dao = new BoardDAO(application);
		int result = dao.insertReview(dto);
		session.setAttribute("result", result);
		dao.close();
		response.sendRedirect("UserRegister.jsp");
	%>
</body>
</html>