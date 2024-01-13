<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="main.css" rel="stylesheet" type="text/css" />
<link href="studentInfoAdd.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<header>
		<h1>학생 성적 조회 프로그램 ver 1.0</h1>
	</header>
	<nav>
		<a href="studentSearch.jsp">학생조회</a> <a href="studentInfoAdd.jsp">학생성적등록</a>
		<a href="studentGradeSearch.jsp">학생성적조회</a> <a href="main.jsp">홈으로</a>
	</nav>
	<section>
		<form action="studentInfoAddProcess.jsp">
			<h1 id="tableTitle">학생성적 등록</h1>
			<div>
				<p>학번</p>
				<input type="text" name="id" required />
			</div>
			<div>
				<p>국어</p>
				<input type="text" name="korean" required />
			</div>
			<div>
				<p>수학</p>
				<input type="text" name="math" required />
			</div>
			<div>
				<p>영어</p>
				<input type="text" name="english" required />
			</div>
			<div>
				<p>역사</p>
				<input type="text" name="history" required />
			</div>
			<button type="submit">등록</button>
		</form>
	</section>
	<footer>
		<p>Copyright @ 2018 All right reserved SangilMedia High School</p>
	</footer>
</body>
</html>