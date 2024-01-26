<%@page import="DBPKG.BoardDTO"%>
<%@page import="DBPKG.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	BoardDAO dao = new BoardDAO(application);
	BoardDTO dto = new BoardDTO();
	dto.setPno(request.getParameter("p_no"));
	dto.setTcode(request.getParameter("testNames"));
	dto.setTsdate(request.getParameter("t_sdate"));
	dto.setTstatus(request.getParameter("tStatus"));
	dto.setTldate(request.getParameter("t_ldate"));
	dto.setTresult(request.getParameter("testResult"));
	int result = dao.addTestResult(dto);

	if(result == 1) {
		response.sendRedirect("Main.jsp");
	} else {
		response.sendRedirect("Enter_test_results.jsp");
	}
%>