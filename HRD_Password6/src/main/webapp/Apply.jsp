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

String sql = "select * from TBL_TEACHER_202201";
psmt = con.prepareStatement(sql);
rs = psmt.executeQuery();
String answer = null;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="main.css" type="text/css" rel="stylesheet" />
<link href="teacherSearch.css" type="text/css" rel="stylesheet" />
<script type="text/javascript">
	function addNumber() {
		alert('click');
	}
	function change1() {
		const reply = document.querySelector('#name');
		const num = document.querySelector('#number');
		num.value = reply.value;
	}
	function change2() {
		const cls = document.querySelector('#clsName');
		const price = document.querySelector('#price');
		const number = document.querySelector('#number');
		if(Number(number.value) >= 20000) {
			price.value = Number(cls.value) / 2;
		}
	}
</script>
</head>
<body>
	<header>
		<h1>골프연습장 회원관리 프로그램 ver1.0</h1>
	</header>
	<nav>
		<a href="TeacherSearch.jsp">강사조회</a> <a href="Apply.jsp">수강신청</a> <a
			href="UserSearch.jsp">회원정보조회</a> <a href="Sales.jsp">강사매출현황</a> <a
			href="main.jsp">홈으로</a>
	</nav>
	<section>
		<h3>수강신청</h3>
		<form action="ApplyProcess.jsp" id="reply">
			<table border="1">
				<tr>
					<td>수강일</td>
					<td><input type="text" name="REGISTER_MONTH" />2022년3월
						예)202203</td>
				</tr>
				<tr>
					<td>회원명</td>
					<td><select name="C_NAME" id="name" onchange="change1()">
							<option>회원명</option>
							<option value="10001">홍길동</option>
							<option value="10002">장발장</option>
							<option value="10003">임꺽정</option>
							<option value="20001">성춘향</option>
							<option value="20002">이몽룡</option>
					</select></td>
				</tr>
				<tr>
					<td>회원번호</td>
					<td><input type="text" name="C_NO" id="number" />예)10001</td>
				</tr>
				<tr>
					<td>강의장소</td>
					<td><select name="CLASS_AREA">
							<option>강의장소</option>
							<option>서울본원</option>
							<option>성남분원</option>
							<option>대전분원</option>
							<option>부산분원</option>
							<option>대구분원</option>
					</select></td>
				</tr>
				<tr>
					<td>강의명</td>
					<td><select id="clsName" name="CLASS_NAME" onchange="change2()">
							<option>강의명</option>
							<option value="100000">초급반</option>
							<option value="200000">중급반</option>
							<option value="300000">고급반</option>
							<option value="400000">심화반</option>
					</select></td>
				</tr>
				<tr>
					<td>수강료</td>
					<td><input type="text" name="CLASS_PRICE" id="price" />원</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;">
						<button>수강신청</button>
						<button>다시쓰기</button>
					</td>
				</tr>
			</table>
		</form>
	</section>
	<footer>
		<p>HRDKOREA Copyright@2015 All rights reserved. Human Resources
			Development Service of Korea</p>
	</footer>
</body>
</html>