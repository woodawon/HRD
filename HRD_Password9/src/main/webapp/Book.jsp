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
			alert('접종예약번호가 입력되지 않았습니다.');
			document.frm.RESVNO.focus();
			return false;
		}
		if(document.frm.JUMIN.value == "") {
			alert('주민번호가 입력되지 않았습니다.');
			document.frm.JUMIN.focus();
			return false;
		}
		if(document.frm.VCODE.value == "") {
			alert('백신코드가 입력되지 않았습니다.');
			document.frm.VCODE.focus();
			return false;
		}
		if(document.frm.HOSPCODE.value == "") {
			alert('병원코드가 입력되지 않았습니다.');
			document.frm.HOSPCODE.focus();
			return false;
		}
		if(document.frm.RESVDATE.value == "") {
			alert('예약 일자가 입력되지 않았습니다.');
			document.frm.RESVDATE.focus();
			return false;
		}
		if(document.frm.RESVTIME.value == "") {
			alert('예약시간이 입력되지 않았습니다.');
			document.frm.RESVTIME.focus();
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
		<h3>백신접종예약</h3>
		<form action="BookProcess.jsp" name="frm">
			<table border="1" style="margin: auto; text-align: center;">
				<tr>
					<td>접종예약번호</td>
					<td><input type="text" name="RESVNO" />예) 20210001</td>
				</tr>
				<tr>
					<td>주민번호</td>
					<td><input type="text" name="JUMIN" />예) 710101-1000001</td>
				</tr>
				<tr>
					<td>백신코드</td>
					<td><input type="text" name="VCODE" />예) V001 ~ V003</td>
				</tr>
				<tr>
					<td>병원코드</td>
					<td><input type="text" name="HOSPCODE" />예) H001</td>
				</tr>
				<tr>
					<td>예약일자</td>
					<td><input type="text" name="RESVDATE" />예) 20211231</td>
				</tr>
				<tr>
					<td>예약시간</td>
					<td><input type="text" name="RESVTIME" />예) 1230</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;">
						<button type="submit" onclick="return check();">등록</button>
						<button type="button" onclick="alert('정보를 지우고 처음부터 다시 입력합니다!'); location.href='Book.jsp';">다시쓰기</button>
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