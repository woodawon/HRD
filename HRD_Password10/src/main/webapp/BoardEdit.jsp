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
<link href="main.css" type="text/css" rel="stylesheet" />
<link href="Board.css" type="text/css" rel="stylesheet" />
</head>
<script type="text/javascript">
	function check() {
		if(document.frm.writer.value == '') {
			alert('작성자를 입력하지 않았습니다.');
			document.frm.writer.focus();
			return false;
		}
		if(document.frm.subject.value == '') {
			alert('제목을 입력하지 않았습니다.');
			document.frm.subject.focus();
			return false;
		}
		if(document.frm.content.value == '') {
			alert('내용을 입력하지 않았습니다.');
			document.frm.content.focus();
			return false;
		}
		alert('게시물 수정이 완료되었습니다.');
		return true;
	}
</script>
<body>
	<header>
		<h1>커뮤니티 제작 프로그램</h1>
	</header>
	<nav>
		<a href="Board.jsp">게시판목록/조회</a>
		<a href="main.jsp">홈으로</a>
	</nav>
	<section>
		<form action="BoardEditProcess.jsp" name="frm">
			<h3>게시판 작성</h3>
			<table border="1">
				<tr>
					<td>작성자</td>
					<td><input type="text" name="writer" value="<%=session.getAttribute("writer")%>"/></td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" name="subject" value="<%=session.getAttribute("subject")%>" /></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><input type="text" name="content" id="content" value="<%=session.getAttribute("content")%>" /></td>
				</tr>
			</table>
			<div id="boardwrite">
				<button type="button" onclick="location.href='Board.jsp';">취소</button>
				<button type="submit" onclick="return check();">완료</button>
			</div>
		</form>
	</section>
	<footer>
		<p>Copyright @ 2020 All right reserved HRD</p>
	</footer>
</body>
</html>