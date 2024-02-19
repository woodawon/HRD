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
		<h3>투표하기</h3>
		<form action="VoteProcess.jsp">
			<table border="1">
				<tr>
					<td>주민번호</td>
					<td><input type="text" name="v_jumin" required />예)0403013000001</td>
				</tr>
				<tr>
					<td>성명</td>
					<td><input type="text" name="v_name" required /></td>
				</tr>
				<tr>
					<td>후보번호</td>
					<td><select name="choice_no">
							<option>==후보번호 선택==</option>
							<option>1</option>
							<option>2</option>
							<option>3</option>
							<option>4</option>
							<option>5</option>
					</select></td>
				</tr>
				<tr>
					<td>투표시간</td>
					<td><input type="text" name="v_time" /></td>
				</tr>
				<tr>
					<td>투표장소</td>
					<td><input type="text" name="v_area" /></td>
				</tr>
				<tr>
					<td>유권자확인</td>
					<td>
						<input type="radio" name="v_confirm" value="Y" /> 확인
						<input type="radio" name="v_confirm" value="N" /> 미확인
					</td>
				</tr>
				<tr>
					<td id="su" colspan="2">
					<button type="submit">투표하기</button>
					<button onclick="location.href='vote.jsp';">다시쓰기</button>
					</td>
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