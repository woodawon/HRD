<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="main.css" type="text/css" rel="stylesheet" />
<link href="RegisterPerson.css" type="text/css" rel="stylesheet" />
</head>
<body>
	<header>
		<h1>(과정평가형 정보처리산업기사)학생회장투표 프로그램 ver 2021-10</h1>
	</header>
	<nav>
		<a href="ShowPerson.jsp">후보조회</a> <a href="RegisterPerson.jsp">후보등록</a>
		<a href="Vote.jsp">투표하기</a> <a href="Result.jsp">투표결과조회</a> <a
			href="PersonRank.jsp">후보자순위</a> <a href="main.jsp">홈으로</a>
	</nav>
	<section>
		<h3>후보등록</h3>
		<form action="RegisterProcess.jsp">
			<table border="1">
				<tr>
					<td>후보번호</td>
					<td><input type="text" name="NO" required /></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="Name" required /></td>
				</tr>
				<tr>
					<td>팀번호</td>
					<td><select name="Code">
							<option>==팀번호를 선택하세요==</option>
							<option>1팀</option>
							<option>2팀</option>
							<option>3팀</option>
							<option>4팀</option>
							<option>5팀</option>
					</select></td>
				</tr>
				<tr>
					<td>학력</td>
					<td><select name="School">
							<option>==학력을 선택하세요==</option>
							<option>중졸</option>
							<option>고졸</option>
							<option>전문대졸</option>
							<option>대졸</option>
							<option>석사수료</option>
							<option>석사취득</option>
							<option>박사수료</option>
							<option>박사취득</option>
					</select></td>
				</tr>
				<tr>
					<td>주민번호</td>
					<td><input type="text" name="Jumin1" required />-<input
						type="text" name="Jumin2" required /></td>
				</tr>
				<tr>
					<td>전공학년반</td>
					<td><input type="text" name="Major" required /></td>
				</tr>
				<tr>
					<td id="su" colspan="2"><button type="submit">등록</button></td>
				</tr>
			</table>
		</form>
		<button id="home" onclick="location.href='main.jsp';">홈으로</button>
	</section>
	<footer>
		<p>HRDKOREA Copyright@2021 All rights reserved. Human REsources
			Development Service of Korea</p>
	</footer>
</body>
</html>