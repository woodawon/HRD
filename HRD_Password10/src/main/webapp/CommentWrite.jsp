<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
<%
Connection con;
PreparedStatement psmt;
ResultSet rs;

Class.forName("oracle.jdbc.OracleDriver");
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String id = "system";
String pw = "1234";

con = DriverManager.getConnection(url, id, pw);
String sql = "insert into comment_tbl values (seq_comment_tbl.nextval, ?, ?, sysdate, ?)";
psmt = con.prepareStatement(sql);
psmt.setString(1, request.getParameter("writer"));
psmt.setString(2, request.getParameter("comment"));
psmt.setInt(3, Integer.parseInt(request.getParameter("b_idx")));
int result = psmt.executeUpdate();

if(result == 1) {
%>
alert('댓글 작성이 완료되었습니다.');
<%
response.sendRedirect("Board.jsp");
} else {
%>
alert('정상적으로 댓글 작성이 완료되지 못했습니다.');
<%
response.sendRedirect("main.jsp");
}
%>
</script>
</body>
</html>