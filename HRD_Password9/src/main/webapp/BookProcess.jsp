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

String sql = "insert into TBL_VACCRESV_202108 values (?,?,?,?,?,?)";
psmt = con.prepareStatement(sql);
psmt.setString(1, request.getParameter("RESVNO"));
psmt.setString(2, request.getParameter("JUMIN"));
psmt.setString(3, request.getParameter("VCODE"));
psmt.setString(4, request.getParameter("HOSPCODE"));
psmt.setString(5, request.getParameter("RESVDATE"));
psmt.setString(6, request.getParameter("RESVTIME"));
int result = psmt.executeUpdate();
if(result == 1) {
%>
alert('접종예약정보가 등록 되었습니다!');
location.href = 'Look.jsp';
<%
} else {
%>
location.href = 'Book.jsp';
<%
}
%>
</script>
</head>
<body>
</body>
</html>