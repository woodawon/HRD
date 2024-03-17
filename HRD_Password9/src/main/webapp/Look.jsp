<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="main.css" type="text/css" rel="stylesheet" />
</head>
<script type="text/javascript">
	function check() {
		if(document.frm.RESVNO.value == "") {
			alert('예약번호가 입력되지 않았습니다!');
			document.frm.RESVNO.focus();
			return false;
		}
		return true;
	}
</script>
<body>
	<header>
		<h1>(과정평가형 정보처리산업기사) 백신접종예약 프로그램 ver 2021-08</h1>
	</header>
	<nav>
		<a href="Book.jsp">백신접종예약</a> <a href="Look.jsp">접종예약조회</a> <a
			href="Total.jsp">접종인원통계</a> <a href="main.jsp">홈으로</a>
	</nav>
	<section>
		<h3>접종예약조회</h3>
		<form action="LookSearch.jsp" name="frm">
			<table border="1" style="margin: auto;">
				<tr>
					<td>예약번호를 입력 하시오.</td>
					<td><input type="text" name="RESVNO" /></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;">
						<button type="submit" onclick="return check();">예약조회</button>
						<button type="button" onclick="location.href='main.jsp';">홈으로</button>
					</td>
				</tr>
			</table>
		</form>
	</section>
	<footer>
		<p>HRDKOREA Copyright @ 2021 All rights reserved. Human Resources
			Development Service of Korea</p>
	</footer>
</body>
</html>