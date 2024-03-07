<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Connection con;
PreparedStatement psmt;
ResultSet rs;
Class.forName("oracle.jdbc.OracleDriver");
String id = "golf";
String pw = "1234";
String url = "jdbc:oracle:thin:@localhost:1521:xe";
con = DriverManager.getConnection(url, id, pw);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String sql = "insert into TBL_CLASS_202201(REGISTER_MONTH, C_NO, CLASS_AREA, TUITION, TEACHER_CODE) values (?, ?, ?, ?, ?)";
	psmt = con.prepareStatement(sql);
	psmt.setString(1, request.getParameter("REGISTER_MONTH"));
	System.out.println(request.getParameter("REGISTER_MONTH"));
	System.out.println(request.getParameter("C_NO"));
	System.out.println(request.getParameter("CLASS_AREA"));
	System.out.println(request.getParameter("CLASS_NAME"));
	System.out.println(request.getParameter("CLASS_PRICE"));
	psmt.setString(2, request.getParameter("C_NO"));
	psmt.setString(3, request.getParameter("CLASS_AREA"));
	psmt.setInt(4, Integer.parseInt(request.getParameter("CLASS_PRICE")));
	if((request.getParameter("CLASS_NAME")).equals("초급반")) {
		psmt.setString(5, "100");
	} else if((request.getParameter("CLASS_NAME")) == "중급반") {
		psmt.setString(5, "200");
	} else if((request.getParameter("CLASS_NAME")) == "고급반") {
		psmt.setString(5, "300");
	} else if((request.getParameter("CLASS_NAME")) == "심화반") {
		psmt.setString(5, "400");
	}
	int result = psmt.executeUpdate();
	if (result == 1) {
	%>
	<script>
		alert('수강신청이 정상적으로 완료되었습니다!');
	</script>
	<%
		response.sendRedirect("main.jsp");
	} else {
		response.sendRedirect("Apply.jsp");
	}
	%>
</body>
</html>