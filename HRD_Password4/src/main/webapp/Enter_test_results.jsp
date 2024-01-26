<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="Main.css" type="text/css" rel="stylesheet" />
<link href="Patient_Lookup.css" type="text/css" rel="stylesheet" />
<link href="Enter_test_results.css" type="text/css" rel="stylesheet" />
</head>
<script>
	function reset() {
		 window.location.href = "Enter_test_results.jsp";
	}
</script>
<body>
	<header>
		<h1>(과정평가형산업기사)검사프로그램</h1>
	</header>
	<menu>
		<a href="Patient_Lookup.jsp">환자조회</a>
		<a href="Enter_test_results.jsp">검사결과입력</a>
		<a href="Get_test_results.jsp">검사결과조회</a>
		<a href="Number_of_tests_by_region.jsp">지역별검사건수</a>
		<a href="Main.jsp">홈으로</a>
	</menu>
	<section>
		<h2 id="con1">검사결과입력</h2>
		<form action="Enter_test_results_process.jsp" method="post">
			<table border="1">
				<tr>
					<td>환자코드</td>
					<td><input type="text" name="p_no" />예)1001</td>
				</tr>
				<tr>
					<td>검사명</td>
					<td><select name="testNames">
							<option value="검사명">검사명</option>
							<option value="T001">[T001]결핵</option>
							<option value="T002">[T002]장티푸스</option>
							<option value="T003">[T003]수두</option>
							<option value="T004">[T004]홍역</option>
							<option value="T005">[T005]콜레라</option>
					</select></td>
				</tr>
				<tr>
					<td>검사시작일</td>
					<td><input type="text" name="t_sdate" />예)20200101</td>
				</tr>
				<tr>
					<td>검사상태</td>
					<td><input type="radio" name="tStatus" value="1" />검사 중 <input
						type="radio" name="tStatus" value="2" />검사 완료</td>
				</tr>
				<tr>
					<td>검사완료일</td>
					<td><input type="text" name="t_ldate" />예)20200101</td>
				</tr>
				<tr>
					<td>검사결과</td>
					<td><input type="radio" name="testResult" value="X" />미입력 <input
						type="radio" name="testResult" value="P" />양성 <input type="radio"
						name="testResult" value="N" />음성</td>
				</tr>
				<tr>
					<td colspan="2" id="buttons">
						<button type="submit">등록</button>
						<button type="button" onclick="reset()">재입력</button>
					</td>
				</tr>
			</table>
		</form>
	</section>
	<footer> Copyright @ 2020 All right reserved HRD </footer>
</body>
</html>