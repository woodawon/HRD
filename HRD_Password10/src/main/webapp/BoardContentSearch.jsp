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
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String id = "system";
String pw = "1234";

con = DriverManager.getConnection(url, id, pw);
session.setAttribute("idx", request.getParameter("idx"));
session.setAttribute("writer", request.getParameter("writer"));
session.setAttribute("subject", request.getParameter("subject"));
session.setAttribute("content", request.getParameter("content"));

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="main.css" type="text/css" rel="stylesheet" />
<link href="Board.css" type="text/css" rel="stylesheet" />
</head>
<script type="text/javascript">
	function update() {
		var writerValue = document.frm.writer.value;
		var commentValue = document.frm.comment.value;
		var newURL = "CommentWrite.jsp?writer="
				+ writerValue 
				+ "&comment="
				+ commentValue
				+ "&b_idx="
				+ <%=request.getParameter("idx")%>;
		window.location.href = newURL;

	}
</script>
<body>
	<header>
		<h1>커뮤니티 제작 프로그램</h1>
	</header>
	<nav>
		<a href="Board.jsp">게시판목록/조회</a> <a href="main.jsp">홈으로</a>
	</nav>
	<section>
		<form action="BoardEdit.jsp" name="frm">
			<h3>게시판 조회</h3>
			<table border="1">
				<tr>
					<td colspan="3">제목</td>
					<td colspan="3"><%=request.getParameter("subject")%></td>
				</tr>
				<tr>
					<td>작성자</td>
					<td><%=request.getParameter("writer")%></td>
					<td>작성일</td>
					<td><%=request.getParameter("date1")%></td>
					<td>수정일</td>
					<td><%=request.getParameter("crystal_date")%></td>
				</tr>
				<tr>
					<td colspan="6" id="left"><%=request.getParameter("content")%>
					</td>
				</tr>
				<tr>
					<td colspan="6" id="left">
						<p>댓글조회</p> <%
 String sql = "select * from comment_tbl where b_idx=?";
 psmt = con.prepareStatement(sql);
 psmt.setInt(1, Integer.parseInt(request.getParameter("idx")));
 rs = psmt.executeQuery();
 while (rs.next()) {
 %>
						<p>
							<%=rs.getString("writer") + " / "%>
							<%=rs.getString("content") + " / "%>
							<%=rs.getString("date1") + "/ "%>
							<a href="CommentDelete.jsp?idx=<%=rs.getInt("idx")%>">삭제</a>
						</p> <%
 }
 %>
					</td>
				</tr>
				<tr>
					<td colspan="6" id="left">
						<p>댓글작성</p> <input type="text" name="writer" />작성자
						<div id="commentpage">
							<input type="text" name="comment" id="writerInput" />
							<button type="button" onclick="update();">작성완료</button>
						</div>
					</td>
				</tr>
			</table>
			<button type="button" onclick="location.href='Board.jsp';">목록</button>
			<button type="submit" onclick="location.href='BoardEdit.jsp?writer=<%=request.getParameter("writer")%>&content=<%=request.getParameter("content")%>&subject=<%=request.getParameter("subject")%>';">수정</button>
			<button type="button" onclick="location.href='BoardDelete.jsp';">삭제</button>
		</form>
	</section>
	<footer>
		<p>Copyright @ 2020 All right reserved HRD</p>
	</footer>
</body>
</html>