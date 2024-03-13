<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="main.css" type="text/css" rel="stylesheet" />
</head>
<body>
	<header>
		<h1>과정 평가형 정보처리산업기사) 지역구의원투표 프로그램 ver 2020-05</h1>
	</header>
	<nav>
		<a href="PSearch.jsp">후보조회</a> <a href="Vote.jsp">투표하기</a> <a
			href="VSearch.jsp">투표검수조회</a> <a href="Rank.jsp">후보자등수</a> <a
			href="main.jsp">홈으로</a>
	</nav>
	<section>
		<h3>투표하기</h3>
		<form action="VoteProcess.jsp">
			<table border="1" style="margin: auto;">
				<tr>
					<td>주민번호</td>
					<td><input type="text" name="V_JUMIN" required />ex)890615315726</td>
				</tr>
				<tr>
					<td>성명</td>
					<td><input type="text" name="V_NAME" required /></td>
				</tr>
				<tr>
					<td>후보번호</td>
					<td>
						<select name="M_NO" required>
							<option></option>
							<option value="1">[1]김후보</option>
							<option value="2">[2]이후보</option>
							<option value="3">[3]박후보</option>
							<option value="4">[4]조후보</option>
							<option value="5">[5]최후보</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>투표시간</td>
					<td><input type="text" name="V_TIME" required /></td>
				</tr>
				<tr>
					<td>투표장소</td>
					<td><input type="text" name="V_AREA" required /></td>
				</tr>
				<tr>
					<td>유권자확인</td>
					<td>
						<input type="radio" name="V_CONFIRM" value="Y" />
						<input type="radio" name="V_CONFIRM" value="N" />	
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<button type="submit">투표하기</button>
						<button type="button" onclick="alert('정보를 지우고 처음부터 다시 입력합니다.'); location.href='Vote.jsp';">다시하기</button>
					</td>
				</tr>
			</table>
		</form>
	</section>
	<footer>
		<p>Copyright@2020 All right reserved HRD</p>
	</footer>
</body>
</html>