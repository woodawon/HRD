<%@page import="DBPKG.BoardDTO"%>
<%@page import="DBPKG.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
String id = request.getParameter("id");
int korean = Integer.parseInt(request.getParameter("korean"));
int math = Integer.parseInt(request.getParameter("math"));
int english = Integer.parseInt(request.getParameter("english"));
int history = Integer.parseInt(request.getParameter("history"));

BoardDAO dao = new BoardDAO(application);
BoardDTO dto = new BoardDTO();
dto.setId(id);
dto.setKorean(korean);
dto.setMath(math);
dto.setEnglish(english);
dto.setHistory(history);
int result = dao.insertStudent(dto);
if (result == 1) {
%>
<script>
	alert('����� �Ϸ�Ǿ����ϴ�.');
</script>
<%
response.sendRedirect("studentSearch.jsp");
} else {
%>
<script>
	alert('����� ���� ���߽��ϴ�.');
</script>
<%
response.sendRedirect("studentInfoAdd.jsp");
}
dao.close();
%>

